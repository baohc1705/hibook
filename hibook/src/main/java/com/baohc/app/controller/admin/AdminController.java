package com.baohc.app.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.app.config.PageConfig;

public class AdminController {
	// private final String ADMIN_HOME_PAGE = "/WEB-INF/views/admin/dashboard.jsp";
	public AdminController() {
	}

	public void showDashboard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String page = request.getParameter("page");
			String redirect = "";
			if (page != null && !"".equals(page)) {
				switch (page) {
				case "dashboard":
					redirect = PageConfig.ADMIN_DASHBOARD;
					break;
				default:
					redirect = PageConfig.ADMIN_INDEX;
				}
			}
			else 
				redirect = PageConfig.ADMIN_INDEX;
			request.getRequestDispatcher(redirect).forward(request, response);
			;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
