package com.baohc.app.controller.cart;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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
			bill.setCreateAt(new Timestamp(System.currentTimeMillis()));
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
	        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm dd-MM-yyyy");

	        StringBuilder sb = new StringBuilder();
	        sb.append("<div style='font-family: Arial, sans-serif; margin:0 50px; padding:20px; border:1px solid #e0e0e0; border-radius:8px; background-color:#fafafa;'>");

	        sb.append("<h2 style='color:#2c3e50;'>Xin chào ").append(escapeHtml(bill.getFullname())).append("!</h2>");
	        sb.append("<p>Cảm ơn bạn đã đặt hàng tại <strong style='color:#e74c3c;'>HiBook</strong>.</p>");
	        sb.append("<p style='font-weight:bold;'>Mã đơn hàng: <span style='color:#2980b9;'>").append(bill.getId()).append("</span></p>");
	        sb.append("<p><strong>Địa chỉ nhận hàng:</strong> ")
	          .append(escapeHtml(bill.getShipAddress())).append(", ")
	          .append(escapeHtml(bill.getWard())).append(", ")
	          .append(escapeHtml(bill.getDistrict())).append(", ")
	          .append(escapeHtml(bill.getCity())).append("</p>");
	        sb.append("<p><strong>Số điện thoại:</strong> ").append(escapeHtml(bill.getPhone())).append("</p>");
	        sb.append("<p><strong>Thời gian đặt hàng:</strong> ").append(dateFormat.format(bill.getCreateAt())).append("</p>");

	        sb.append("<h3 style='margin-top:20px; color:#27ae60;'>Chi tiết đơn hàng</h3>");

	        sb.append("<table style='border-collapse: collapse; width: 100%; font-size:14px;'>");
	        sb.append("<thead style='background-color:#f2f2f2;'><tr>")
	          .append("<th style='padding:10px; border:1px solid #ddd; text-align:left;'>Tên sách</th>")
	          .append("<th style='padding:10px; border:1px solid #ddd; text-align:right;'>Giá</th>")
	          .append("<th style='padding:10px; border:1px solid #ddd; text-align:center;'>Số lượng</th>")
	          .append("<th style='padding:10px; border:1px solid #ddd; text-align:right;'>Thành tiền</th>")
	          .append("</tr></thead><tbody>");

	        for (CartItem item : cartToEmail) {	
	            String price = df.format(item.getBook().getPrice()) + " đ";
	            String subTotal = df.format(item.getSubtotal()) + " đ";
	            sb.append("<tr>")
	              .append("<td style='padding:10px; border:1px solid #ddd;'>").append(escapeHtml(item.getBook().getName())).append("</td>")
	              .append("<td style='padding:10px; border:1px solid #ddd; text-align:right; color:#e74c3c; text-wrap:nowrap;'>").append(price).append("</td>")
	              .append("<td style='padding:10px; border:1px solid #ddd; text-align:center;'>").append(item.getQuantity()).append("</td>")
	              .append("<td style='padding:10px; border:1px solid #ddd; text-align:right; color:#c0392b; font-weight:bold; text-wrap:nowrap;'>").append(subTotal).append("</td>")
	              .append("</tr>");
	        }
	        sb.append("</tbody>");

	        String totalPrice = df.format(bill.getTotalPrice()) + " đ";
	        String priceShip = (bill.getDelivery() != null) ? df.format(bill.getDelivery().getPrice()) + " đ" : "0 đ";

	        sb.append("<tfoot>")
	          .append("<tr>")
	          .append("<td colspan='3' style='padding:10px; border:1px solid #ddd; text-align:right; font-weight:bold;'>Phí vận chuyển</td>")
	          .append("<td style='padding:10px; border:1px solid #ddd; text-align:right; color:#e67e22; font-weight:bold; text-wrap:nowrap;'>").append(priceShip).append("</td>")
	          .append("</tr>")
	          .append("<tr style='background-color:#f9f9f9;'>")
	          .append("<td colspan='3' style='padding:10px; border:1px solid #ddd; text-align:right; font-weight:bold;'>Tổng cộng</td>")
	          .append("<td style='padding:10px; border:1px solid #ddd; text-align:right; color:#d35400; font-size:16px; font-weight:bold; text-wrap:nowrap;'>").append(totalPrice).append("</td>")
	          .append("</tr>")
	          .append("</tfoot></table>");

	        sb.append("<p style='margin-top:20px;'>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi qua email <a href='mailto:support@hibook.com'>support@hibook.com</a>.</p>");
	        sb.append("<p style='color:#7f8c8d; font-size:12px;'>Đây là email tự động, vui lòng không trả lời.</p>");
	        sb.append("</div>");

	        String subject = "Đơn hàng #" + bill.getId() + " tại HiBook";
	        if (EmailKit.sendEmail(bill.getEmail(), subject, sb.toString())) {
	            System.out.println("Email gửi đến " + bill.getEmail());
	        } else {
	            System.err.println("GỬI EMAIL ĐƠN HÀNG THẤT BẠI");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        System.err.println("GỬI EMAIL ĐƠN HÀNG THẤT BẠI");
	    }
	}

	private String escapeHtml(String input) {
	    if (input == null) return "";
	    return input.replace("&", "&amp;")
	                .replace("<", "&lt;")
	                .replace(">", "&gt;")
	                .replace("\"", "&quot;");
	}

}
