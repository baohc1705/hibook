package com.baohc.app.controller.cart;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.app.config.SecurityConfig;
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
import com.baohc.core.utils.CSRFTokenUtil;
import com.baohc.core.utils.EmailKit;
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
			List<CartItem> cartItemsSelected = new ArrayList<CartItem>();
			String[] selectedBooks = request.getParameterValues("books");
			if (selectedBooks != null) {
				for (String bookId : selectedBooks) {
					System.out.println("Book found: " + bookId);
					for (CartItem item : cartItems) {
						if (item.getBook().getId().equals(bookId))
							cartItemsSelected.add(item);
					}
				}
			} else {
				System.err.println("SELECTED BOOK NULL");
			}

			if (cartItemsSelected.size() == 0) {
				// TODO: Handle cart items empty
				System.err.println("CART ITEM EMPTY");
				return;
			}

			double cartTotal = cartService.getCartTotal(cartItemsSelected);
			Map<String, String> mapCoverPhoto = new HashMap<String, String>();

			for (CartItem item : cartItemsSelected) {
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

			session.setAttribute("cartItemsSelected", cartItemsSelected);
			request.setAttribute("cartTotal", cartTotal);
			request.setAttribute("mapCoverPhoto", mapCoverPhoto);
			request.setAttribute("deliveries", deliveries);

			StringBuilder sb = new StringBuilder();
			for (CityEnum item : CityEnum.values()) {
				sb.append("<option value='").append(item.name()).append("'>").append(item.getDisplayName())
						.append("</option>");
			}
			request.setAttribute("citysEnum", sb.toString());
			
			String csrfToken = CSRFTokenUtil.generateToken(request);
			request.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, csrfToken);
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
			city = CityEnum.valueOf(city).getDisplayName();
			
			String district = request.getParameter("district");
			
			String ward = request.getParameter("ward");
			
			String shipAddress = request.getParameter("address");
			
			String deliveryIdStr = request.getParameter("delivery");
			System.out.println(deliveryIdStr);
			int deliveryId = (deliveryIdStr != null && !deliveryIdStr.trim().isEmpty())
					? Integer.parseInt(deliveryIdStr)
					: 0;
			boolean isDisable = false;

			String totalPriceStr = request.getParameter("totalPrice");
			double totalPrice = (totalPriceStr != null && !totalPriceStr.trim().isEmpty())
					? Double.parseDouble(totalPriceStr)
					: null;

			String note = request.getParameter("note");

			String status = BillStatus.CHO_XAC_NHAN.getDisplayName();

			String payMethod = request.getParameter("payMethod");
			System.out.println("PAY METHOD:  " + payMethod);

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
			bill.setPayMethod(payMethod);

			int insertBill = billService.insert(bill);
			if (insertBill == 1) {

				List<CartItem> cartItems = cartService.getCartItems(request);
				@SuppressWarnings("unchecked")
				List<CartItem> cartItemsSelected = (List<CartItem>) session.getAttribute("cartItemsSelected");

				if (cartItemsSelected == null || cartItemsSelected.isEmpty()) {
					resp.put("status", "error");
					resp.put("message", "Không có sản phẩm để thanh toán");
					response.getWriter().print(gson.toJson(resp));
					return;
				}

				try {
					for (CartItem item : cartItemsSelected) {
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
					
					List<CartItem> cartToEmail = new ArrayList<CartItem>();
					// TODO: DEBUG 
					for(CartItem item : cartItems) {
						System.err.println("ITEM COOKIES: " + item.getBook().getName());
					}
					// Nếu chọn hết
					if (cartItemsSelected.size() == cartItems.size()) {
						cartToEmail = cartItems;
						cartService.clearCart(response);
					} else {
						cartToEmail = cartItemsSelected;
						// Chỉ chọn một phần
						for (CartItem itemSelected : cartItemsSelected) {
							System.err.println("ITEM SELECTED: " + itemSelected.getBook().getName());
							String bookIdSelected = itemSelected.getBook().getId();
							cartService.removeFromCartSelected(cartItems, response, bookIdSelected);
						}
						
						
					}

					// Xóa session tạm
					session.removeAttribute("cartItemsSelected");

					sendCartToEmail(bill, cartToEmail);
					
					resp.put("status", "success");
					resp.put("message", "Đã đặt hàng thành công. Vui lòng kiểm tra email để xem đơn hàng");

				}
			} else {
				resp.put("status", "error");
				resp.put("message", "Đặt hàng không thành công. Vui lòng kiểm tra lại thông tin đơn hàng.");
			}

			response.getWriter().print(gson.toJson(resp));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void sendCartToEmail(BillDTO bill, List<CartItem> cartToEmail) {
		try {
			DecimalFormat df = new DecimalFormat("#,###");
			
			StringBuilder sb = new StringBuilder();
			sb.append("<h3>Xin chào "+ bill.getFullname() +" !</h3>");
			sb.append("<p>Cảm ơn bạn đã đặt hàng tại HiBook</p>");
			sb.append("<p style='font-weight:bold;'>Mã đơn hàng: ").append(bill.getId()).append("</p>");
			sb.append("<p>Địa chỉ nhận hàng: ").append(bill.getShipAddress()).append(", ")
			.append(bill.getWard()).append(", ")
			.append(bill.getDistrict()).append(", ")
			.append(bill.getCity()).append("</p>");
			sb.append("<p>Số điện thoại: ").append(bill.getPhone()).append("</p>");
			sb.append("<p>Thời gian đặt hàng: ").append(new Timestamp(System.currentTimeMillis())).append("</p>");
			sb.append("<h3>Chi tiết đơn hàng của bạn</h3>");
			sb.append(
					"<table border='1' cellspacing='0' cellpadding='5' style='border-collapse: collapse; width: 100%;'>");
			// Header
			sb.append("<thead style='background-color:#f2f2f2;'>");
			sb.append("<tr>");
			sb.append("<th style='padding: .5rem;'>Tên sách</th>");
			sb.append("<th style='padding: .5rem;'>Giá</th>");
			sb.append("<th style='padding: .5rem;'>Số lượng</th>");
			sb.append("<th style='padding: .5rem;'>Thành tiền</th>");
			sb.append("</tr>");
			sb.append("</thead>");

			// Body
			sb.append("<tbody>");
			for (CartItem item : cartToEmail) {	
				String price = df.format(item.getBook().getPrice()) + " đ";
				String subTotal = df.format(item.getSubtotal()) + " đ";
				sb.append("<tr>");
				sb.append("<td style='padding: .5rem;'>").append(item.getBook().getName()).append("</td>");
				sb.append("<td style='padding: .5rem; text-align: right; color:red;'>").append(price).append("</td>");
				sb.append("<td style='padding: .5rem; text-align: center;'>").append(item.getQuantity()).append("</td>");
				sb.append("<td style='padding: .5rem; text-align: right; color:red; font-weight:bold'>").append(subTotal).append("</td>");
				sb.append("</tr>");
			}
			sb.append("</tbody>");
			String totalPrice = df.format(bill.getTotalPrice()) + " đ";
			String priceShip = df.format(bill.getDelivery().getPrice()) + " đ";
			// Footer
			sb.append("<tfoot>");
			sb.append("<tr>");
			sb.append("<td colspan='3' style='text-align:right; font-weight:bold;'>Phí vận chuyển</td>");
			sb.append("<td style='font-weight:bold; color:red; text-align: right;'>").append(priceShip).append("</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='3' style='text-align:right; font-weight:bold;'>Tổng cộng</td>");
			sb.append("<td style='font-weight:bold; color:red; text-align: right;'>").append(totalPrice).append("</td>");
			sb.append("</tr>");
			sb.append("</tfoot>");

			sb.append("</table>");

			if (EmailKit.sendEmail(bill.getEmail(), "ĐƠN HÀNG CỦA BẠN TẠI HIBOOK.com", sb.toString()))
				System.out.println("Email gửi đến " + bill.getEmail() + ":\n" + sb.toString());
			else {
				System.err.println("GỬI EMAIL ĐƠN HÀNG THẤT BẠI");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("GỬI EMAIL ĐƠN HÀNG THẤT BẠI");
		}

	}
}
