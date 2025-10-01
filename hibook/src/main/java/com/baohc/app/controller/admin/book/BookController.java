package com.baohc.app.controller.admin.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.app.config.PageConfig;

public class BookController {
	
	public BookController() {
		
	}
	
	public void doGetBook(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			String url = "";
			if (action != null && !"".equals(action)) {
				switch(action) {
				case "add":
					url = PageConfig.ADMIN_ADD_BOOK;
					break;
					default: 
						url = PageConfig.ADMIN_BOOK;
				}
			}
			
			request.getRequestDispatcher(url).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
