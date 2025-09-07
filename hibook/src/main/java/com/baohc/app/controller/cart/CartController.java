package com.baohc.app.controller.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.app.dao.book.PhotoDAO;
import com.baohc.app.dao.book.PhotoDAOImpl;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CartItem;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.google.gson.Gson;

public class CartController {

	private final String CART_PAGE = "/WEB-INF/views/cart/cart.jsp";
	private BookService bookService;
	private CartService cartService;
	private PhotoDAO photoDAO;

	public CartController() {
		bookService = BookServiceImpl.getInstance();
		cartService = new CartService();
		photoDAO = PhotoDAOImpl.getInstance();
	}

	public void getCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action == null) {
				displayCart(request, response);
			} else {
				switch (action) {
				case "view":
					displayCart(request, response);
					break;
				default:
					displayCart(request, response);
					break;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void displayCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Map<String, String> mapCoverPhoto = new HashMap<String, String>();

			HttpSession session = request.getSession(true);

			List<CartItem> cartItems = cartService.getCartItems(request);
			double cartTotal = cartService.getCartTotal(cartItems);
			int itemCount = cartService.countCartItem(cartItems);

			for (CartItem item : cartItems) {
				BookDTO book = bookService.findById(item.getBook().getId());
				PhotoDTO photo = photoDAO.getCoverPhoto(book);
				mapCoverPhoto.put(book.getId(), photo.getPathname());
			}

			request.setAttribute("cartItems", cartItems);
			request.setAttribute("cartTotal", cartTotal);
			session.setAttribute("itemCount", itemCount);
			request.setAttribute("mapCoverPhoto", mapCoverPhoto);

			request.getRequestDispatcher(CART_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void doCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			String action = request.getParameter("action");
			if (action == null) {
				displayCart(request, response);
			} else {
				switch (action) {
				case "add":
					addToCart(request, response);
					break;
				case "remove":
					removeFromCart(request, response);
					break;
				case "update":
					updateCart(request, response);
					break;
				case "clear":
					clearCart(request, response);
					break;
				default:
					displayCart(request, response);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void clearCart(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			cartService.clearCart(response);
			response.sendRedirect(request.getContextPath() + "/cart?action=view");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/cart?action=view");
		}

	}

	private void updateCart(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			String bookId = request.getParameter("bookId");
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			cartService.updateQuantity(request, response, bookId, quantity);
			response.sendRedirect(request.getContextPath() + "/cart?action=view");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/cart?action=view");
		}

	}

	private void removeFromCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		try {
			String bookId = request.getParameter("bookId");
			if (bookId == null || bookId.isEmpty()) {
				return;
			}

			System.out.println("REMOVE CART ITEM:  " + bookId);

			cartService.removeFromCart(request, response, bookId);

			response.sendRedirect(request.getContextPath() + "/cart?action=view");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/cart?action=view");
		}

	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Map<String, Object> resp = new HashMap<String, Object>();
		Gson gson = new Gson();
		try {
			String bookId = request.getParameter("bookId");
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			if (bookId == null || bookId.isEmpty()) {
				System.err.println("CART: Empty bookId");
				resp.put("status", "error");
				resp.put("message", "Không thể tìm thấy sách");
				response.getWriter().print(gson.toJson(resp));
				return;
			}

			BookDTO book = bookService.findById(bookId);
			if (book != null && quantity > 0) {
				List<CartItem> cartItems = cartService.addToCart(request, response, book, quantity);
				HttpSession session = request.getSession();

				int itemCount = cartService.countCartItem(cartItems);

				System.out.println("ITEM COUNT: " + itemCount);

				session.setAttribute("itemCount", itemCount);
				resp.put("status", "success");
				resp.put("message", "Đã thêm sách vào giỏ hàng!");
				resp.put("itemCount", itemCount);

			} else {
				resp.put("status", "error");
				resp.put("message", "Không thể tìm thấy sách");
			}
			response.getWriter().print(gson.toJson(resp));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
