package com.baohc.app.controller.admin.book;

import java.io.IOException;
import java.net.Authenticator.RequestorType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.app.config.PageConfig;
import com.baohc.app.model.AuthorDTO;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CateBookDTO;
import com.baohc.app.model.PromotionDTO;
import com.baohc.app.service.author.AuthorService;
import com.baohc.app.service.author.AuthorServiceImpl;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;
import com.baohc.app.service.promotion.PromotionService;
import com.baohc.app.service.promotion.PromotionServiceImpl;
import com.baohc.core.utils.StringKit;
import com.google.gson.Gson;

public class BookController {
	private CateBookService cateBookService;
	private AuthorService authorService;
	private PromotionService promotionService;
	private BookService bookService;
	public BookController() {
		cateBookService = CateBookServiceImpl.getInstance();
		authorService = AuthorServiceImpl.getInstance();
		promotionService = PromotionServiceImpl.getInstance();
		bookService = BookServiceImpl.getInstance();
	}

	public void doGetBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action != null && !"".equals(action)) {
				switch (action) {
				case "add":
					getFormAddBook(request, response);
					break;
				default:
					break;
				}
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	private void getFormAddBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<CateBookDTO> categories = getCategories(request);
			List<AuthorDTO> authors = getAuthors(request);
			List<PromotionDTO> promotions = getPromotions(request);
			
			request.setAttribute("categories", categories);
			request.setAttribute("authors", authors);
			request.setAttribute("promotions", promotions);
			request.getRequestDispatcher(PageConfig.ADMIN_ADD_BOOK).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@SuppressWarnings("unchecked")
	private List<PromotionDTO> getPromotions(HttpServletRequest request) {
		List<PromotionDTO> promotions = new ArrayList<PromotionDTO>();
		try {
			HttpSession session = request.getSession();
			List<PromotionDTO> sessionPromotions = (List<PromotionDTO>)session.getAttribute("sessionPromotions");
			if (sessionPromotions == null || sessionPromotions.size() == 0) {
				promotions = promotionService.getAllPromotions();
				session.setAttribute("sessionPromotions", promotions);
			}
			else {
				promotions = sessionPromotions;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return promotions;
	}

	@SuppressWarnings("unchecked")
	private List<CateBookDTO> getCategories(HttpServletRequest request) {
		try {
			List<CateBookDTO> categories = new ArrayList<CateBookDTO>();
			HttpSession session = request.getSession();
			List<CateBookDTO> sessionCategories = (List<CateBookDTO>)session.getAttribute("sessionCategories");
			if (sessionCategories == null || sessionCategories.size() == 0) {
				categories = cateBookService.getAllCateBook();
				session.setAttribute("sessionCategories", categories);
			}
			else {
				categories = sessionCategories;
			}
			return categories;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	private List<AuthorDTO> getAuthors(HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			List<AuthorDTO> sessionAuthors = (List<AuthorDTO>)session.getAttribute("sessionAuthors");
			List<AuthorDTO> authors = new ArrayList<AuthorDTO>();
			if (sessionAuthors == null || sessionAuthors.size() == 0) {
				authors = authorService.getAllAuthors();
				session.setAttribute("sessionAuthors", authors);
			}
			else {
				authors = sessionAuthors;
			}
			return authors;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public void doPostBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			
			if (action != null && !"".equals(action)) {
				switch (action) {
				case "add":
					addBook(request, response);
					break;
				default:
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void addBook(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		Map<String, Object> resp = new HashMap<String, Object>();
		try {
			String name = request.getParameter("name");
			
			int categoryId = Integer.parseInt(request.getParameter("category"));
			CateBookDTO categoryTmp = cateBookService.findById(categoryId);
			
			String authorId = request.getParameter("author");
			AuthorDTO authorTmp = authorService.findById(authorId);
			
			String desc = request.getParameter("description");
			double price = Double.parseDouble(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("inventory"));
			int promotionId = Integer.parseInt(request.getParameter("promotion"));
			PromotionDTO promotion = promotionService.findById(promotionId);
			
			BookDTO book = new BookDTO();
			book.setId(StringKit.RandomIdTime());
			book.setName(name);
			book.setCateBook(categoryTmp);
			book.setAuthor(authorTmp);
			book.setDescription(desc);
			book.setPrice(price);
			book.setAmount(amount);
			book.setPromotion(promotion);
			
			int insert = bookService.insert(book);
			if (insert == 1) {
				resp.put("status", "success");
				resp.put("message", "Đã thêm sách thành công");
				resp.put("bookId", book.getId());
			}
			else {
				resp.put("status", "error");
				resp.put("message", "Thêm sách thất bại");
			}
			
			response.getWriter().print(gson.toJson(resp));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
