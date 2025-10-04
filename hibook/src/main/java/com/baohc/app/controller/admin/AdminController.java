package com.baohc.app.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.app.config.PageConfig;
import com.baohc.app.dao.book.PhotoDAO;
import com.baohc.app.dao.book.PhotoDAOImpl;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CateBookDTO;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;

public class AdminController {
	private BookService bookService;
	private PhotoDAO photoDAO;
	private CateBookService cateBookService;
	public AdminController() {
		bookService = BookServiceImpl.getInstance();
		photoDAO = PhotoDAOImpl.getInstance();
		cateBookService = CateBookServiceImpl.getInstance();
	}

	public void showDashboard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String page = request.getParameter("page");
			String redirect = "";
			if (page != null && !"".equals(page)) {
				switch (page) {
				case "dashboard":
					redirect = PageConfig.ADMIN_INDEX;
					break;
				case "book":
					loadBook(request, response);
					return;
				case "all-user":
					redirect = PageConfig.ADMIN_ALL_USER;
					break;
				case "role":
					redirect = PageConfig.ADMIN_ROLE;
					break;
				case "bill":
					redirect = PageConfig.ADMIN_ORDER;
					break;
				default:
					redirect = PageConfig.ADMIN_INDEX;
					break;
				}
			}
			else 
				redirect = PageConfig.ADMIN_INDEX;
			request.getRequestDispatcher(redirect).forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void loadBook(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		try {
			List<CateBookDTO> categories = cateBookService.getAllCateBook();
			List<BookDTO> books = bookService.getAllBook();
			Map<String, Object> coverPhotos = new HashMap<String, Object>();
			
			for(BookDTO b : books) {
				PhotoDTO coverPhoto = photoDAO.getCoverPhoto(b);
				coverPhotos.put(b.getId(), coverPhoto.getPathname());
			}

			
			request.setAttribute("categories", categories);
			request.setAttribute("books", books);
			request.setAttribute("coverPhotos", coverPhotos);
			request.getRequestDispatcher(PageConfig.ADMIN_BOOK).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

}
