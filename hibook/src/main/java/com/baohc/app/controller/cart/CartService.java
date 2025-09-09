package com.baohc.app.controller.cart;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CartItem;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.core.utils.HMACUtils;

public class CartService {
	private static final String CART_COOKIES_NAME = "hibook_cart";
	private static final int COOKIES_MAX_AGE = 7 * 24 * 60 * 60; // 7 days
	private BookService bookService;

	public CartService() {
		bookService = BookServiceImpl.getInstance();
	}

	/*
	 * Get HMAC secret from environment variable NOTE: No use hard-code. Secret must
	 * be one for 1 client
	 */

	private static final String HMAC_SECRET = getHmacSecret();

	private static String getHmacSecret() {
		// NOTE: get secret from environment variable
		// Code is demo i use hard-code for secret
		String secret = "PRIVATE_KEY_ONLY_ONE";
		return secret;
	}

	public List<CartItem> getCartItems(HttpServletRequest request) {
		List<CartItem> cartItems = new ArrayList<CartItem>();
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (CART_COOKIES_NAME.equals(cookie.getName())) {
					// Get cookies data from client
					try {
						String cartData = URLDecoder.decode(cookie.getValue(), "UTF-8");
						// Part string data to object
						cartItems = parseSignedCartData(cartData);
					} catch (Exception e) {

						e.printStackTrace();
					}
				}
			}
		}
		return cartItems;
	}
	
	public List<CartItem> addToCart(HttpServletRequest request, HttpServletResponse response, BookDTO book, int quantity) {
		List<CartItem> cartItems = getCartItems(request);
		
		// Check if cart item exists and increase quantity
		boolean itemExists = false;
		for (CartItem item : cartItems) {
			if (item.getBook().getId().equals(book.getId())) {
				item.setQuantity(item.getQuantity() + quantity);
				itemExists = true;
				break;
			}
		}
		
		if (!itemExists) {
			cartItems.add(new CartItem(book, quantity));
		}
		
		saveCartToCookies(response, cartItems);
		
		return cartItems;
	}
	
	public void updateQuantity(HttpServletRequest request, HttpServletResponse response, String bookId, int newQuantity) {
		List<CartItem> cartItems = getCartItems(request);
		
		for (CartItem item : cartItems) {
			if (item.getBook().getId().equals(bookId)) {
				if (newQuantity <= 0) {
					cartItems.remove(item);
				}
				else {
					item.setQuantity(newQuantity);
				}
				break;
			}
		}
		
		saveCartToCookies(response, cartItems);
	}
	
	public void removeFromCart(HttpServletRequest request, HttpServletResponse response, String bookId) {
		List<CartItem> cartItems = getCartItems(request);
		cartItems.removeIf(item -> item.getBook().getId().equals(bookId));
		saveCartToCookies(response, cartItems);
	}
	
	public void removeFromCartSelected(List<CartItem> cartItems, HttpServletResponse response, String bookId) {
		cartItems.removeIf(item -> item.getBook().getId().equals(bookId));
		saveCartToCookies(response, cartItems);
	}
	
	public void clearCart(HttpServletResponse response) {
		Cookie cookie = new Cookie(CART_COOKIES_NAME, "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		cookie.setHttpOnly(true);
		response.addCookie(cookie);
	}
	
	public double getCartTotal(List<CartItem> cartItems) {
		return cartItems.stream().mapToDouble(CartItem::getSubtotal).sum();
	}
	
	public int getCartItemCount(List<CartItem> cartItems) {
		return cartItems.stream().mapToInt(CartItem::getQuantity).sum();
	}
	
	public int countCartItem(List<CartItem> cartItems) {
		return cartItems != null ? cartItems.size() : 0;
	}

	private void saveCartToCookies(HttpServletResponse response, List<CartItem> cartItems) {
		try {
			// Create cart data payload
			String cartData = createCartData(cartItems);
			
			// Sign cart data
			String signedCartData = signCartDataWithTimestamp(cartData);
			
			// URL encode for cookie storage
			String encodedCartData = URLEncoder.encode(signedCartData, "UTF-8");
			
			// Add cookies
			Cookie cookie = new Cookie(CART_COOKIES_NAME, encodedCartData);
			cookie.setMaxAge(COOKIES_MAX_AGE);
			cookie.setPath("/");
			cookie.setHttpOnly(true); // prevent XSS attacks
			
			response.addCookie(cookie);
			
		} catch (Exception e) {
			System.err.println("SAVE CART TO COOKIES FAILED");
			e.printStackTrace();
		}
		
	}

	private String signCartDataWithTimestamp(String cartData) {
		// Add  timestamp to prevent replay attacks
		long timestamp = System.currentTimeMillis();
		String payload = cartData + "|ts:" + timestamp;
		
		// HMAC for signing
		String signature = HMACUtils.hmacSha256(payload, HMAC_SECRET);
		
		return payload + "." + signature;
	}

	private String createCartData(List<CartItem> cartItems) {
		if (cartItems.isEmpty()) {
			return "";
		}
		
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < cartItems.size(); i++) {
			CartItem item = cartItems.get(i);
			if (i > 0) {
				sb.append("|");
			}
			
			// Only store book id and quantity 
			sb.append(item.getBook().getId()).append(",").append(item.getQuantity());
			
		}
		return sb.toString();
	}

	/* Parse cookies string to object cart item */
	private List<CartItem> parseSignedCartData(String signedCartData) {
		try {
			// Split pay load and signature
			String[] parts = signedCartData.split("\\.");
			if (parts.length != 2) {
				System.err.println("Invalid signed cart data format");
				return new ArrayList<CartItem>();
			}

			String payload = parts[0];
			String receivedSignature = parts[1];

			// Verify HMAC signature
			boolean isValid = HMACUtils.verifyHmac(payload, receivedSignature, HMAC_SECRET);
			if (!isValid) {
				System.err.println("HMAC_VERIFICATION_FAILED: possible tampering detected");
				return new ArrayList<CartItem>();
			}

			// Extract cart data

			String cartData = payload;
			if (payload.contains("|ts:")) {
				String[] payloadParts = payload.split("\\|ts:");
				cartData = payloadParts[0];

				// Check expired time
				if (payloadParts.length > 1) {
					try {
						long timestamp = Long.parseLong(payloadParts[1]);
						long currentTime = System.currentTimeMillis();
						long maxAge = COOKIES_MAX_AGE * 1000L; // millis
						if (currentTime - timestamp > maxAge) {
							System.err.println("EXPIRED_CART_DATA: Cart data max age "
									+ (currentTime - timestamp) / 1000 + " sec");
							return new ArrayList<CartItem>();
						}
					} catch (Exception e) {
						System.err.println("INVALID_TIMESTAMP: " + payloadParts[1]);
						return new ArrayList<CartItem>();
					}
				}

				return parseCartData(cartData);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<CartItem> parseCartData(String cartData) {
		List<CartItem> cartItems = new ArrayList<CartItem>();

		if (cartData != null && !cartData.isEmpty()) {
			String[] items = cartData.split("\\|");
			for (String itemData : items) {
				String[] parts = itemData.split(",");
				if (parts.length == 2) {
					try {
						String bookId = parts[0];
						int quantity = Integer.parseInt(parts[1]);

						// Fetch fresh book from db
						BookDTO book = bookService.findById(bookId);

						if (book != null && quantity > 0) {
							cartItems.add(new CartItem(book, quantity));
						}
					} catch (Exception e) {
						System.err.println("Error parsing cart item: " + itemData);
					}
				}
			}
		}

		return cartItems;
	}
}
