package com.baohc.app.controller.book;

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
import com.google.gson.Gson;

public class CategoryBookController {
	private final String CATEGORY_PAGE = "/WEB-INF/views/book/category.jsp";
	private final String SPA_CATE_FILTER_PAGE = "/WEB-INF/views/book/spa-book-filter.jsp";

	private CateBookService cateBookService;
	private BookService bookService;
	private AuthorService authorService;
	private PhotoDAO photoDAO;

	public CategoryBookController() {
		cateBookService = CateBookServiceImpl.getInstance();
		bookService = BookServiceImpl.getInstance();
		authorService = AuthorServiceImpl.getInstance();
		photoDAO = PhotoDAOImpl.getInstance();
	}

	public void getBooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if (action == null || action.trim().isEmpty()) {
				viewAllCategory(request, response);
				return;
			} else {
				switch (action) {
				case "all":
					viewAllCategory(request, response);
					break;
				case "filter-category":
					filterCategory(request, response);
					break;
				case "filter":
					getBooksWithFilter(request, response);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getBooksWithFilter(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		Map<String, Object> resp = new HashMap<String, Object>();
		HttpSession session = request.getSession();

		// Lấy filter từ req
		FilterCriteria criteria = getFilterCriteria(request, session);
		
		// Save filter to remember filter
		session.setAttribute("filterCriteria", criteria);
		try {
			List<BookDTO> books = bookService.getBooksWithFilter(criteria);
			Map<String, String> mapCoverPhoto = new HashMap<String, String>();
			for(BookDTO b : books) {
				PhotoDTO photo = photoDAO.getCoverPhoto(b);
				mapCoverPhoto.put(b.getId(), photo.getPathname());
			}
			// Count total records for pagination
			int totalRecords = bookService.countBooksWithFilter(criteria);
			int totalPages = (int) Math.ceil((double) totalRecords / criteria.getPageSize());
			PaginationKit paginationKit = new PaginationKit(criteria.getPage(), totalPages, criteria.getPageSize(), totalRecords);
			
			request.setAttribute("books", books);
			request.setAttribute("mapCoverPhoto", mapCoverPhoto);
			request.setAttribute("currentPage", criteria.getPage());
			request.setAttribute("totalPages", totalPages);
			
			String paginationJson = gson.toJson(paginationKit.getPagination());
			request.setAttribute("pagination", paginationJson);
			
			request.getRequestDispatcher(SPA_CATE_FILTER_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	private FilterCriteria getFilterCriteria(HttpServletRequest request, HttpSession session) {
		FilterCriteria criteria = new FilterCriteria();

		String keyword = request.getParameter("keyword");
		String cateBookIdStr = request.getParameter("cateBookId");
		String authorIdStr = request.getParameter("authorId");
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

		if (hasNewParameters(request)) {
			setFilterCriteria(criteria, keyword, cateBookIdStr, minPriceStr, maxPriceStr, sortBy, sortOrder, pageStr,
					pageSizeStr, clearFilter, authorIdStr);
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
		System.err.println("Filter: "+ criteria);
		return criteria;
	}

	private void setFilterCriteria(FilterCriteria criteria, String keyword, String cateBookIdStr, String minPriceStr,
			String maxPriceStr, String sortBy, String sortOrder, String pageStr, String pageSizeStr,
			String clearFilter, String authorIdStr) {
		// Set keyword
		if (keyword != null && !keyword.isEmpty()) {
			criteria.setKeyword(keyword.trim().isEmpty() ? null : keyword.trim());
		}

		// Set category book
		if (cateBookIdStr != null && !cateBookIdStr.isEmpty()) {
			int cateBooKId = Integer.parseInt(cateBookIdStr);
			criteria.setCateBookId(cateBooKId > 0 ? cateBooKId : null);
		}
		// Set author id
		if (authorIdStr != null && !authorIdStr.isEmpty()) {
			criteria.setAuthorId(authorIdStr.trim().isEmpty() ? null : authorIdStr.trim());
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
			criteria.setPageSize(pageSize > 0 ? pageSize : 8);
		}

	}

	private boolean hasNewParameters(HttpServletRequest request) {
		return (request.getParameter("keyword") != null || request.getParameter("cateBookId") != null
				|| request.getParameter("minPrice") != null || request.getParameter("maxPrice") != null
				|| request.getParameter("sortBy") != null || request.getParameter("sortOrder") != null
				|| request.getParameter("authorId") != null);
	}

	private void filterCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		try {
			int cateId = Integer.parseInt(request.getParameter("cateId"));
			if (cateId != 0) {
				FilterCriteria criteria = new FilterCriteria();
				criteria.setCateBookId(cateId);
				criteria.setPage(1);
				criteria.setPageSize(8);
				List<BookDTO> books = bookService.getBooksWithFilter(criteria);
				request.setAttribute("books", books);
				request.getRequestDispatcher(SPA_CATE_FILTER_PAGE).forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void viewAllCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<CateBookDTO> categories = cateBookService.getAllCateBook();
			FilterCriteria criteria = new FilterCriteria();
			criteria.setPage(1);
			criteria.setPageSize(8);
			criteria.setSortBy("createDate");
			criteria.setSortOrder("DESC");
			List<BookDTO> books = bookService.getBooksWithFilter(criteria);

			List<AuthorDTO> authors = authorService.getAllAuthors();
			request.setAttribute("books", books);
			request.setAttribute("authors", authors);
			request.getRequestDispatcher(CATEGORY_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
