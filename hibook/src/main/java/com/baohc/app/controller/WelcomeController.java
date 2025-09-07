package com.baohc.app.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.app.dao.book.PhotoDAO;
import com.baohc.app.dao.book.PhotoDAOImpl;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.service.author.AuthorService;
import com.baohc.app.service.author.AuthorServiceImpl;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;

public class WelcomeController {
	
	private final String HOME_PAGE = "/WEB-INF/views/homepage.jsp";
	
	public void welcome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(HOME_PAGE).forward(request, response);
	}
}
