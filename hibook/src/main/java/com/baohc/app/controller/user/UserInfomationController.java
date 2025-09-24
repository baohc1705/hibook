package com.baohc.app.controller.user;

import java.io.IOException;
import java.util.ArrayList;
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
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.service.bill.BillDetailService;
import com.baohc.app.service.bill.BillDetailServiceImpl;
import com.baohc.app.service.bill.BillService;
import com.baohc.app.service.bill.BillServiceImpl;
import com.baohc.app.service.user.UserService;
import com.baohc.app.service.user.UserServiceImpl;
import com.baohc.core.utils.BillCriteria;
import com.baohc.core.utils.PasswordUtil;
import com.baohc.core.utils.enums.BillStatus;
import com.google.gson.Gson;

public class UserInfomationController {

	private final String INFO_PAGE = "/WEB-INF/views/user/info.jsp";
	private final String ORDERS_PAGE = "/WEB-INF/views/user/orders.jsp";
	private final String ORDER_DETAIL_PAGE = "/WEB-INF/views/user/order-detail.jsp";
	private final String RESET_PASS_PAGE = "/WEB-INF/views/user/reset-password.jsp";
	private final String NO_DATA_PAGE = "/WEB-INF/views/errors/not_update.jsp";
	private BillService billService;
	private BillDetailService billDetailService;
	private PhotoDAO photoDAO;
	private UserService userService;

	public UserInfomationController() {
		billService = BillServiceImpl.getInstance();
		billDetailService = BillDetailServiceImpl.getInstance();
		photoDAO = PhotoDAOImpl.getInstance();
		userService = UserServiceImpl.getInstance();
	}

	public void getSinglePageApplication(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			String page = request.getParameter("page");
			if (page == null || page.isEmpty())
				viewInfo(request, response);
			switch (page) {
			case "info":
				viewInfo(request, response);
				break;
			case "orders":
				viewOrder(request, response);
				break;
			case "order-detail":
				viewOrderDetail(request, response);
				break;
			case "category":
				displayByBillStatus(request, response);
				break;
			case "reset-password":
				request.getRequestDispatcher(RESET_PASS_PAGE).forward(request, response);
				break;
			case "address":
				request.getRequestDispatcher(NO_DATA_PAGE).forward(request, response);
				break;
			case "percent":
				request.getRequestDispatcher(NO_DATA_PAGE).forward(request, response);
				break;
			case "notification":
				request.getRequestDispatcher(NO_DATA_PAGE).forward(request, response);
				break;
			default:
				viewInfo(request, response);
				break;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void doTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action == null || action.trim().isEmpty()) {
				System.err.println("ACTION NOT FOUND");
				return;
			} else {
				switch (action) {
				case "reset-password":
					resetPassword(request, response);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void resetPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		Map<String, Object> resp = new HashMap<String, Object>();
		try {

			String oldPass = request.getParameter("old-password");
			String newPass = request.getParameter("new-password");
			if ((oldPass == null || oldPass.trim().isEmpty()) || (newPass == null || newPass.trim().isEmpty())) {
				resp.put("status", "error");
				resp.put("message", "Mật khẩu rỗng");
				response.getWriter().print(gson.toJson(resp));
				return;
			};

			HttpSession session = request.getSession(false);
			UserDTO userSession = (UserDTO) session.getAttribute("USER_ACC");
			
			if (userSession == null) {
				resp.put("status", "error");
				resp.put("message", "Đã hết phiên đăng nhập");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			UserDTO user = userService.find(userSession);
			if (!PasswordUtil.verifyPasswordArgon(oldPass, user.getPassword())) {
				resp.put("status", "error");
				resp.put("message", "Mật khẩu cũ không đúng.");
				response.getWriter().print(gson.toJson(resp));
				return;
			} else {
				newPass = PasswordUtil.hashPasswordArgon(newPass);
				int resetPass = userService.updatePassword(user.getId(), newPass);
				
				if (resetPass != 1) {
					resp.put("status", "error");
					resp.put("message", "Cập nhật mật khẩu thất bại");
				} else {
					UserDTO userNewPass = userService.find(user);
					session.removeAttribute("USER_ACC");
					session.setAttribute("USER_ACC", userNewPass);
					
					resp.put("status", "success");
					resp.put("message", "Cập nhật mật khẩu thành công");	
				}
			}
			response.getWriter().print(gson.toJson(resp));

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@SuppressWarnings("unchecked")
	private void displayByBillStatus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		Map<String, Object> resp = new HashMap<String, Object>();
		try {
			String cate = request.getParameter("cate");
			String status = "";
			if ("ALL".equals(cate) || cate == null) {
				viewAllOrder(request, response);
				return;
			} else if (BillStatus.CHO_XAC_NHAN.name().equals(cate)) {
				status = BillStatus.CHO_XAC_NHAN.getDisplayName();

			} else if (BillStatus.DANG_VAN_CHUYEN.name().equals(cate)) {
				status = BillStatus.DANG_VAN_CHUYEN.getDisplayName();

			} else if ("DA_NHAN_HANG".equals(cate)) {
				status = BillStatus.DA_NHAN_HANG.getDisplayName();
			} else if ("XAC_NHAN".equals(cate)) {
				status = "XAC_NHAN";
			}
			System.err.println(status);
			HttpSession session = request.getSession(false);

			List<BillDTO> bills = (List<BillDTO>) session.getAttribute("bills");
			Map<String, String> mapCoverPhoto = (Map<String, String>) session.getAttribute("mapCoverPhotoOrder");
			Map<String, Object> mapBillDetails = (Map<String, Object>) session.getAttribute("mapBillDetails");
			if (bills == null || bills.size() == 0) {
				System.err.println("BILLS SESSION NOT FOUND");
				return;
			}

			List<BillDTO> billsByCategory = new ArrayList<BillDTO>();
			if ("XAC_NHAN".equals(status)) {
				for (BillDTO b : bills) {
					if ("Đã xác nhận".equals(b.getStatus()) || "Đang chuẩn bị hàng".equals(b.getStatus())) {
						billsByCategory.add(b);
					}
				}
			} else {
				for (BillDTO b : bills) {
					if (status.equals(b.getStatus())) {
						billsByCategory.add(b);
					}
				}
			}

			resp.put("mapCoverPhoto", mapCoverPhoto);
			resp.put("billsByCategory", billsByCategory);
			resp.put("mapBillDetails", mapBillDetails);
			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void viewAllOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		Map<String, Object> resp = new HashMap<String, Object>();

		try {
			HttpSession session = request.getSession();

			UserDTO user = (UserDTO) session.getAttribute("USER_ACC");
			if (user == null) {
				System.err.println("ĐÃ HẾT PHIÊN ĐĂNG NHẬP");
				response.sendRedirect(request.getContextPath() + "/");
				return;
			}
			int page = 1;
			String pageStr = request.getParameter("offset");
			if (pageStr != null && !pageStr.isEmpty()) {
				page = Integer.parseInt(pageStr);
			}
			int limit = 4;
			int offset = (page - 1) * limit;
			boolean hasLoadMore = false;

			@SuppressWarnings("unchecked")
			List<BillDTO> bills = (List<BillDTO>) session.getAttribute("bills");

			if (bills != null && bills.size() != 0) {
				System.err.println("BILL IN SESSION CALLED");
			} else {
				BillCriteria billCriteria = new BillCriteria();
				billCriteria.setUserId(user.getId());

				bills = billService.getBillsCriteria(billCriteria);
				System.err.println("bills initialize first time");
			}

			// phân trang
			int toIndex = Math.min(offset + limit, bills.size());
			List<BillDTO> pagedBills = bills.subList(offset, toIndex);
			hasLoadMore = toIndex < bills.size();

			System.out.println("offset=" + offset + ", toIndex=" + toIndex + ", size=" + bills.size());
			@SuppressWarnings("unchecked")
			Map<String, Object> mapBillDetails = (Map<String, Object>) session.getAttribute("mapBillDetails");

			@SuppressWarnings("unchecked")
			Map<String, String> mapCoverPhoto = (Map<String, String>) session.getAttribute("mapCoverPhotoOrder");

			if (mapBillDetails == null || mapCoverPhoto == null) {
				mapBillDetails = new HashMap<>();
				mapCoverPhoto = new HashMap<String, String>();
				System.err.println("Map initialize first time");
			}

			if (mapBillDetails.size() == 0 || mapCoverPhoto.size() == 0) {
				for (BillDTO bill : bills) {
					List<BillDetailDTO> billDetails = billDetailService.getAllbyBill(bill.getId());
					if (billDetails != null && billDetails.size() != 0) {
						mapBillDetails.put(bill.getId(), billDetails);
						for (BillDetailDTO item : billDetails) {
							PhotoDTO photo = photoDAO.getCoverPhoto(item.getBook());
							if (photo != null) {
								mapCoverPhoto.put(item.getBook().getId(), photo.getPathname());
							}
						}
					}
				}
			} else {
				System.err.println("Map detail bill session CALLED");
				System.err.println("Map cover photo session CALLED");
			}

			session.setAttribute("bills", bills);
			session.setAttribute("mapBillDetails", mapBillDetails);
			session.setAttribute("mapCoverPhotoOrder", mapCoverPhoto);

			// TODO: debug
			for (BillDTO b : pagedBills) {
				System.err.println("BILL" + b);
			}
			resp.put("mapCoverPhoto", mapCoverPhoto);
			resp.put("billsByCategory", pagedBills);
			resp.put("mapBillDetails", mapBillDetails);
			resp.put("hasLoadMore", hasLoadMore);
			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void viewInfo(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			request.setAttribute("reqPage", "info");
			request.getRequestDispatcher(INFO_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void viewOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			request.getRequestDispatcher(ORDERS_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	private void viewOrderDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String billId = request.getParameter("billId");
			if (billId == null || billId.isEmpty()) {
				// TODO: DEBUG
				System.err.println("BILL ID NOT FOUND");
				return;
			}

			HttpSession session = request.getSession(false);

			List<BillDTO> bills = (List<BillDTO>) session.getAttribute("bills");

			Map<String, Object> mapBillDetails = (Map<String, Object>) session.getAttribute("mapBillDetails");
			Map<String, String> mapCoverPhoto = (Map<String, String>) session.getAttribute("mapCoverPhotoOrder");

			if (bills == null && mapBillDetails == null && mapCoverPhoto == null) {
				// TODO: DEBUG
				System.err.println("NOT FOUND bills mapBillDetails mapCoverPhoto");
				return;
			}

			List<BillDetailDTO> orderDetail = new ArrayList<BillDetailDTO>();

			BillDTO bill = new BillDTO();
			for (BillDTO b : bills) {
				if (billId.equals(b.getId())) {
					bill = b;

					orderDetail = (List<BillDetailDTO>) mapBillDetails.get(bill.getId());

					break;
				}
			}

			double sum = 0;
			for (BillDetailDTO item : orderDetail) {
				sum += item.getPrice();
			}

			request.setAttribute("totalPriceBill", sum);
			request.setAttribute("bill", bill);
			request.setAttribute("orderDetail", orderDetail);
			request.getRequestDispatcher(ORDER_DETAIL_PAGE).forward(request, response);
			;
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
