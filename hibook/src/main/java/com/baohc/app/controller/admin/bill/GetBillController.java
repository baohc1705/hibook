package com.baohc.app.controller.admin.bill;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.app.model.BillDTO;
import com.baohc.app.service.bill.BillService;
import com.baohc.app.service.bill.BillServiceImpl;
import com.baohc.core.utils.BillCriteria;
import com.baohc.core.utils.enums.BillStatus;

public class GetBillController {
	private final String BILLS_PAGE = "/WEB-INF/views/admin/bills/view-all.jsp";

	private BillService billService;

	public GetBillController() {
		billService = BillServiceImpl.getInstance();
	}

	public void getBills(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action == null || action.isEmpty()) {
				viewAllBill(request, response);
				return;
			}
			switch (action) {
			case "view-all":
				viewAllBill(request, response);
				break;
			case "filter-status":
				filterStatus(request, response);
				break;
			default:
				viewAllBill(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void filterStatus(HttpServletRequest request, HttpServletResponse response) {
		try {
			String reqstatus = request.getParameter("status");
			if (reqstatus == null || reqstatus.trim().isEmpty()) return;
			String status = "";
			if (BillStatus.CHO_XAC_NHAN.getDisplayName().equals(reqstatus)) {
				status = BillStatus.CHO_XAC_NHAN.getDisplayName();
			}
			else if (BillStatus.DA_XAC_NHAN.getDisplayName().equals(reqstatus)) {
				status = BillStatus.DA_XAC_NHAN.getDisplayName();
			}
			else if (BillStatus.DANG_CHUAN_BI_HANG.getDisplayName().equals(reqstatus)) {
				status = BillStatus.DANG_CHUAN_BI_HANG.getDisplayName();
			}
			else if (BillStatus.DANG_VAN_CHUYEN.getDisplayName().equals(reqstatus)) {
				status = BillStatus.DANG_VAN_CHUYEN.getDisplayName();
			}
			else if (BillStatus.DA_NHAN_HANG.getDisplayName().equals(reqstatus)) {
				status = BillStatus.DA_NHAN_HANG.getDisplayName();
			}
			
			if (!"".equals(status)) {
				BillCriteria billCriteria = new BillCriteria();
				billCriteria.setStatus(status);
				List<BillDTO> bills = billService.getBillsCriteria(billCriteria);
				request.setAttribute("bills", bills);
				System.err.println("SIZE bills"+ bills.size());
			}

			request.getRequestDispatcher(BILLS_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void viewAllBill(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		try {
			List<BillDTO> bills = billService.getAll();
			request.setAttribute("bills", bills);
			request.getRequestDispatcher(BILLS_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
