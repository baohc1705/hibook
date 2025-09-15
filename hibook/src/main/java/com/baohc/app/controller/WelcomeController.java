package com.baohc.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.app.model.CateBookDTO;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;



public class WelcomeController {
	
	private final String HOME_PAGE = "/WEB-INF/views/homepage.jsp";
	private CateBookService cateBookService;
	public WelcomeController() {
		cateBookService = CateBookServiceImpl.getInstance();
	}
	public void welcome(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			List<CateBookDTO> categories = cateBookService.getAllCateBook();
			session.setAttribute("categories", categories);
			request.getRequestDispatcher(HOME_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
