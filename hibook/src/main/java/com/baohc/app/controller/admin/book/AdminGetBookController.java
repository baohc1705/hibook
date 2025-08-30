package com.baohc.app.controller.admin.book;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.app.dao.book.PhotoDAO;
import com.baohc.app.dao.book.PhotoDAOImpl;
import com.baohc.app.model.AuthorDTO;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CateBookDTO;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.service.author.AuthorService;
import com.baohc.app.service.author.AuthorServiceImpl;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;
import com.baohc.core.utils.FilterCriteria;
import com.baohc.core.utils.PaginationKit;
import com.google.gson.JsonObject;

public class AdminGetBookController {
	private final String BOOK_PAGE = "/WEB-INF/views/admin/books/book-management.jsp";

	private CateBookService cateBookService;
	private BookService bookService;
	private PhotoDAO photoDAO;
	private AuthorService authorService;

	public AdminGetBookController() {
		cateBookService = CateBookServiceImpl.getInstance();
		bookService = BookServiceImpl.getInstance();
		photoDAO = PhotoDAOImpl.getInstance();
		authorService = AuthorServiceImpl.getInstance();
	}

	public void getBooksWithFilter(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Map<BookDTO, String> mapCoverPhoto = new HashMap<BookDTO, String>();
		
		HttpSession session = request.getSession();

		// Get filter criteria from request and response
		FilterCriteria criteria = getFilterCriteria(request, session);

		// Save filter to remember filter
		saveFilterCriteria(criteria, session);

		try {
			List<BookDTO> books = bookService.getBooksWithFilter(criteria);

			// Count total records for pagination
			int totalRecords = bookService.countBooksWithFilter(criteria);
			int totalPages = (int) Math.ceil((double) totalRecords / criteria.getPageSize());
			
			// Get book categories
			if (session.getAttribute("categories") == null ) {
				List<CateBookDTO> categories = cateBookService.getAllCateBook();
				session.setAttribute("categories", categories);
			}
			
			// Get authors
			if (session.getAttribute("authorList") == null ) {
				List<AuthorDTO> authorList = authorService.getAllAuthors();			
				session.setAttribute("authorList", authorList);
			}
			
			// Get promotions
			
			// Get book cover photo
			for (BookDTO b : books) {
				for (PhotoDTO photo : photoDAO.getListPhotoByBookId(b)) {
					if (photo.isCover()) {
						mapCoverPhoto.put(b, photo.getPathname());
						break;
					}
				}
			}
			
			// Get pagination
			PaginationKit paginationKit = new PaginationKit(criteria.getPage(), totalPages, criteria.getPageSize(), totalRecords);
			
			// Set attribute for jsp
			request.setAttribute("books", books);
			request.setAttribute("criteria", criteria);
			request.setAttribute("coverPhoto", mapCoverPhoto);
			request.setAttribute("pagination", paginationKit);
			
			
			request.getRequestDispatcher(BOOK_PAGE).forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void saveFilterCriteria(FilterCriteria criteria, HttpSession session) {
		session.setAttribute("filterCriteria", criteria);

	}

	private FilterCriteria getFilterCriteria(HttpServletRequest request, HttpSession session) {
		FilterCriteria criteria = new FilterCriteria();

		String keyword = request.getParameter("keyword");
		String cateBookIdStr = request.getParameter("cateBookId");
		String minPriceStr = request.getParameter("minPrice");
		String maxPriceStr = request.getParameter("maxPrice");
		String pageStr = request.getParameter("page");
		String pageSizeStr = request.getParameter("pageSize");
		String sortBy = request.getParameter("sortBy");
		String sortOrder = request.getParameter("sortOrder");
		String clearFilter = request.getParameter("clearFilter");

		// Request clear filter ?
		if ("true".equals(clearFilter)) {
			session.removeAttribute("filterCriteria");
			return criteria;
		}

		// Has new parameter from request
		if (hasNewParameters(request)) {
			setFilterCriteria(criteria, keyword, cateBookIdStr, minPriceStr, maxPriceStr, sortBy, sortOrder, pageStr,
					pageSizeStr, clearFilter);
		} else {
			// Hasn't new parameter from request, get session (remember filter)
			FilterCriteria savedCriteria = (FilterCriteria) session.getAttribute("filterCriteria");
			if (savedCriteria != null) {
				criteria = savedCriteria;

				// Only update if request has page parameter
				if (pageStr != null && !pageStr.isEmpty()) {
					try {
						criteria.setPage(Integer.parseInt(pageStr));
					} catch (Exception e) {
						criteria.setPage(1); // Default
					}
				}
			}
		}
		return criteria;
	}

	private void setFilterCriteria(FilterCriteria criteria, String keyword, String cateBookIdStr, String minPriceStr,
			String maxPriceStr, String sortBy, String sortOrder, String pageStr, String pageSizeStr,
			String clearFilter) {
		// Set keyword
		if (keyword != null && !keyword.isEmpty()) {
			criteria.setKeyword(keyword.trim().isEmpty() ? null : keyword.trim());
		}

		// Set category book
		if (cateBookIdStr != null && !cateBookIdStr.isEmpty()) {
			int cateBooKId = Integer.parseInt(cateBookIdStr);
			criteria.setCateBookId(cateBooKId > 0 ? cateBooKId : null);
		}

		// Set price range
		if (minPriceStr != null && !minPriceStr.isEmpty()) {
			double minPrice = Double.parseDouble(minPriceStr);
			criteria.setMinPrice(minPrice > 0 ? minPrice : 0);
		}

		if (maxPriceStr != null && !maxPriceStr.isEmpty()) {
			double maxPrice = Double.parseDouble(maxPriceStr);
			criteria.setMaxPrice(maxPrice > 0 ? maxPrice : 0);
		}

		// Set sorting
		if (sortBy != null && !sortBy.isEmpty()) {
			criteria.setSortBy(sortBy);
		} else
			criteria.setSortBy("");

		if (sortOrder != null && !sortOrder.isEmpty()) {
			criteria.setSortOrder(sortOrder);
		}

		// Set page
		if (pageStr != null && !pageStr.isEmpty()) {
			int page = Integer.parseInt(pageStr);
			criteria.setPage(page > 0 ? page : 1);
		}

		if (pageSizeStr != null && !pageSizeStr.isEmpty()) {
			int pageSize = Integer.parseInt(pageSizeStr);
			criteria.setPageSize(pageSize > 0 ? pageSize : 5);
		}

	}

	private boolean hasNewParameters(HttpServletRequest request) {
		return (request.getParameter("keyword") != null || 
				request.getParameter("cateBookId") != null|| 
				request.getParameter("minPrice") != null || 
				request.getParameter("maxPrice") != null || 
				request.getParameter("sortBy") != null || 
				request.getParameter("sortOrder") != null);
	}
}
