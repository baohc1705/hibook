package com.baohc.app.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminController {
	private final String ADMIN_HOME_PAGE = "/WEB-INF/views/admin/dashboard.jsp";
	public AdminController() {}
	
	public void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			request.getRequestDispatcher(ADMIN_HOME_PAGE).forward(request, response);;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
