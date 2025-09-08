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
import com.baohc.app.model.BillDTO;
import com.baohc.app.model.BillDetailDTO;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CartItem;
import com.baohc.app.model.DeliveryDTO;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.service.bill.BillDetailService;
import com.baohc.app.service.bill.BillDetailServiceImpl;
import com.baohc.app.service.bill.BillService;
import com.baohc.app.service.bill.BillServiceImpl;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.delivery.DeliveryService;
import com.baohc.app.service.delivery.DeliveryServiceImpl;
import com.baohc.core.utils.StringKit;
import com.baohc.core.utils.enums.BillStatus;
import com.baohc.core.utils.enums.CityEnum;
import com.google.gson.Gson;

public class CheckoutController {
	private static final String CHECKOUT_PAGE = "/WEB-INF/views/cart/checkout.jsp";
	private CartService cartService;
	private PhotoDAO photoDAO;
	private DeliveryService deliveryService;
	private BillService billService;
	private BillDetailService billDetailService;
	private BookService bookService;

	public CheckoutController() {
		cartService = new CartService();
		photoDAO = PhotoDAOImpl.getInstance();
		deliveryService = DeliveryServiceImpl.getInstance();
		billService = BillServiceImpl.getInstance();
		billDetailService = BillDetailServiceImpl.getInstance();
		bookService = BookServiceImpl.getInstance();
	}

	public void getCheckout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action == null || action.isEmpty()) {
				viewCheckout(request, response);
				return;
			}

			switch (action) {
			case "view":
				viewCheckout(request, response);
				break;
			default:
				throw new IllegalArgumentException("Unexpected value: " + action);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void viewCheckout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession(false);

			List<CartItem> cartItems = cartService.getCartItems(request);

			if (cartItems.size() == 0) {
				// TODO: Handle cart items empty
				System.err.println("CART ITEM EMPTY");
				return;
			}

			double cartTotal = cartService.getCartTotal(cartItems);
			Map<String, String> mapCoverPhoto = new HashMap<String, String>();

			for (CartItem item : cartItems) {
				PhotoDTO photo = photoDAO.getCoverPhoto(item.getBook());
				mapCoverPhoto.put(item.getBook().getId(), photo.getPathname());
			}

			List<DeliveryDTO> deliveries = deliveryService.getAll();
			if (deliveries == null || deliveries.size() == 0) {
				// TODO: handle deliveries empty
				System.err.println("DELIVERIES EMPTY");
				return;
			}

			UserDTO user = (UserDTO) session.getAttribute("USER_ACC");
			if (user != null) {
				request.setAttribute("USER_ACC", user);
			}

			request.setAttribute("cartItems", cartItems);
			request.setAttribute("cartTotal", cartTotal);
			request.setAttribute("mapCoverPhoto", mapCoverPhoto);
			request.setAttribute("deliveries", deliveries);

			StringBuilder sb = new StringBuilder();
			for (CityEnum item : CityEnum.values()) {
				sb.append("<option value='")
				.append(item.name())
				.append("'>")
				.append(item.getDisplayName())
				.append("</option>");
			}
			request.setAttribute("citysEnum", sb.toString());

			request.getRequestDispatcher(CHECKOUT_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void doCheckout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action == null || action.isEmpty()) {
				System.err.println("ACTION NOT FOUND");
				viewCheckout(request, response);
			} else {
				switch (action) {
				case "add":
					addBill(request, response);
					break;
				default:
					viewCheckout(request, response);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void addBill(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		Map<String, Object> resp = new HashMap<String, Object>();
		try {
			HttpSession session = request.getSession(false);
			String id = StringKit.RandomBillID();
			UserDTO user = (UserDTO) session.getAttribute("USER_ACC");
			String fullname = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String city = request.getParameter("city");
			String district = request.getParameter("district");
			String ward = request.getParameter("ward");
			String shipAddress = request.getParameter("address"); 
			String deliveryIdStr = request.getParameter("delivery");
			System.out.println(deliveryIdStr);
			int deliveryId = (deliveryIdStr!=null && !deliveryIdStr.trim().isEmpty()) ? Integer.parseInt(deliveryIdStr) : 0 ;
			boolean isDisable = false;
			
			String totalPriceStr = request.getParameter("totalPrice");
			double totalPrice = (totalPriceStr!=null && !totalPriceStr.trim().isEmpty()) ? Double.parseDouble(totalPriceStr) : null;
			
			String note = request.getParameter("note");
			
			String status = BillStatus.CHO_XAC_NHAN.getDisplayName();
			
			BillDTO bill = new BillDTO();
			bill.setId(id);
			bill.setUser(user != null ? user : null);
			bill.setDelivery(deliveryService.findById(deliveryId));
			bill.setDisable(isDisable);
			bill.setTotalPrice(totalPrice);
			bill.setFullname(fullname);
			bill.setEmail(email);
			bill.setPhone(phone);
			bill.setCity(city);
			bill.setDistrict(district);
			bill.setWard(ward);
			bill.setShipAddress(shipAddress);
			bill.setNote(note != null ? note : null);
			bill.setStatus(status);
			
			int insertBill = billService.insert(bill);
			if (insertBill == 1) {
				try {
					List<CartItem> cartItems = cartService.getCartItems(request);

					for (CartItem item : cartItems) {
						BillDetailDTO billDetailDTO = new BillDetailDTO();
						billDetailDTO.setBill(bill);
						BookDTO book = item.getBook();
						billDetailDTO.setBook(book);
						billDetailDTO.setQuantity(item.getQuantity());
						billDetailDTO.setPrice(item.getSubtotal());
						
						if (billDetailDTO != null) {
							billDetailService.insert(billDetailDTO);
							book.setAmount(book.getAmount() - billDetailDTO.getQuantity());
							bookService.update(book);
						}
					}
					
				} catch (Exception e) {
					System.err.println("INSERT BILL DETAIL ERROR");
					e.printStackTrace();
				} finally {
					resp.put("status", "success");
					resp.put("message", "Đã đặt hàng thành công. Vui lòng kiểm tra email để xem đơn hàng");
					
					cartService.clearCart(response);
				}
			}
			else {
				resp.put("status", "error");
				resp.put("message", "Đặt hàng không thành công. Vui lòng kiểm tra lại thông tin đơn hàng.");
			}
			
			response.getWriter().print(gson.toJson(resp));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
