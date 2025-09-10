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
import com.baohc.core.utils.BillCriteria;

public class UserInfomationController {

	private final String INFO_PAGE = "/WEB-INF/views/user/info.jsp";
	private final String ORDERS_PAGE = "/WEB-INF/views/user/orders.jsp";

	private BillService billService;
	private BillDetailService billDetailService;
	private PhotoDAO photoDAO;

	public UserInfomationController() {
		billService = BillServiceImpl.getInstance();
		billDetailService = BillDetailServiceImpl.getInstance();
		photoDAO = PhotoDAOImpl.getInstance();
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
			default:
				viewInfo(request, response);
				break;
			}

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
			HttpSession session = request.getSession();

			UserDTO user = (UserDTO) session.getAttribute("USER_ACC");
			if (user == null) {
				System.err.println("ĐÃ HẾT PHIÊN ĐĂNG NHẬP");
				response.sendRedirect(request.getContextPath() + "/");
				return;
			}
			
			@SuppressWarnings("unchecked")
			List<BillDTO> bills = (List<BillDTO>) session.getAttribute("bills");

			if (bills != null && bills.size() != 0) {
				System.err.println("BILL IN SESSION CALLED");
			} else {
				BillCriteria billCriteria = new BillCriteria();
				billCriteria.setUserId(user.getId());

				bills = billService.getBillsByFilter(billCriteria);
			}

			@SuppressWarnings("unchecked")
			Map<String, Object> mapBillDetails = (Map<String, Object>) session.getAttribute("mapBillDetails");

			@SuppressWarnings("unchecked")
			Map<String, String> mapCoverPhoto = (Map<String, String>) session.getAttribute("mapCoverPhoto");
			
			if (mapBillDetails == null || mapCoverPhoto == null) {
				mapBillDetails = new HashMap<>();
				mapCoverPhoto = new HashMap<String, String>();
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

			request.getRequestDispatcher(ORDERS_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
