package com.baohc.app.controller.admin.bill;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.app.model.BillDTO;
import com.baohc.app.service.bill.BillService;
import com.baohc.app.service.bill.BillServiceImpl;
import com.google.gson.Gson;

public class BillController {
	private BillService billService;

	public BillController() {
		billService = BillServiceImpl.getInstance();
	}

	public void doBills(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action == null || action.isEmpty()) {
				response.sendRedirect(request.getContextPath() + "/admin/bills");
			} else {
				switch (action) {
				case "update-status":
					updateStatusBill(request, response);
					break;
				default:
					System.err.println("ACTION NOT FOUND");
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	private void updateStatusBill(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		Map<String, Object> resp = new HashMap<String, Object>();
		
		try {
			String billId = request.getParameter("billId");
			if (billId == null || billId.isEmpty()) {
				System.err.println("BillId NOT FOUND");
				return;
			}
			String status = request.getParameter("status");
			
			if (status != null && !status.trim().isEmpty()) {
				BillDTO billOld = billService.findById(billId);
				billOld.setStatus(status);
				int updateStatus = billService.update(billOld);
				if (updateStatus != 0) {
					resp.put("status", "success");
					resp.put("message", "Cập nhật thành công");
				}
				else {
					resp.put("status", "error");
					resp.put("message", "Cập nhật thất bại");
				}
					
			}
			response.getWriter().print(gson.toJson(resp));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
