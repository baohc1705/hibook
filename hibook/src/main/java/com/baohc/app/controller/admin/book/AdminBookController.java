package com.baohc.app.controller.admin.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminBookController {
	private final String BOOK_PAGE = "/WEB-INF/views/admin/books/book-management.jsp";
	
	public AdminBookController() {}
	
	public void showBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.getRequestDispatcher(BOOK_PAGE).forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
