package com.baohc.app.controller.book;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.app.dao.book.PhotoDAO;
import com.baohc.app.dao.book.PhotoDAOImpl;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.model.PromotionDTO;
import com.baohc.app.service.author.AuthorService;
import com.baohc.app.service.author.AuthorServiceImpl;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;
import com.baohc.app.service.promotion.PromotionService;
import com.baohc.app.service.promotion.PromotionServiceImpl;
import com.baohc.core.utils.FilterCriteria;
import com.google.gson.Gson;

public class GetBooksController {
	private final String HOME_PAGE = "/WEB-INF/views/homepage.jsp";
	private final String BOOK_DETAIL_PAGE = "/WEB-INF/views/book/bookdetail.jsp";
	private BookService bookService;
	private CateBookService cateBookService;
	private AuthorService authorService;
	private PhotoDAO photoDAO;
	private PromotionService promotionService;

	public GetBooksController() {
		bookService = BookServiceImpl.getInstance();
		cateBookService = CateBookServiceImpl.getInstance();
		authorService = AuthorServiceImpl.getInstance();
		photoDAO = PhotoDAOImpl.getInstance();
		promotionService = PromotionServiceImpl.getInstance();
	}

	public void getBooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String action = request.getParameter("action");

			if (action == null || action.isEmpty()) {
				request.getRequestDispatcher(HOME_PAGE).forward(request, response);
			} else {
				switch (action) {
				case "new-trend":
					getNewTrend(request, response);
					break;
				case "flash-sale":
					getFlashSale(request, response);
					break;
				case "special-offer":
					getSpecialOffer(request, response);
					break;
				case "new-book":
					getNewBook(request, response);
					break;
				case "show-new-book":
					showNewBook(request, response);
					break;
				default:
					request.getRequestDispatcher(HOME_PAGE).forward(request, response);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void showNewBook(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		Map<String, Object> resp = new HashMap<String, Object>();
			
		try {
			String bookId = request.getParameter("bookId");
			if (bookId == null || bookId.trim().isEmpty()) {
				System.err.println("BOOKID NOT FOUND");
				return;
			}
			HttpSession session = request.getSession();
			@SuppressWarnings("unchecked")
			List<BookDTO> newBooks = (List<BookDTO>)session.getAttribute("newBooks");
			if (newBooks == null || newBooks.size() == 0) {
				resp.put("status", "error");
				resp.put("message", "Books not found");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			BookDTO book = null;
			
			for (BookDTO b : newBooks) {
				if (b.getId().equals(bookId)) {
					book = b;
					break;
				}
			}
			if (book != null) {
				Map<String, String> mapCoverPhoto = new HashMap<String, String>();
				PhotoDTO tmp = photoDAO.getCoverPhoto(book);
				if (tmp != null) {
					mapCoverPhoto.put(bookId, tmp.getPathname());
				}
				resp.put("status", "success");
				resp.put("book", book);
				resp.put("mapCoverPhoto", mapCoverPhoto);
			}
			else {
				resp.put("status", "error");
				resp.put("message", "Book not found");
			}
			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void getNewBook(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		Map<String, Object> resp = new HashMap<String, Object>();
		try {
			FilterCriteria criteria = new FilterCriteria();
			criteria.setPage(1);
			criteria.setPageSize(6);
			criteria.setSortBy("createDate");
			criteria.setSortOrder("DESC");
			
			List<BookDTO> books = bookService.getBooksWithFilter(criteria);
			if (books.size() > 0) {
				Map<String, String> mapCoverPhoto = new HashMap<String, String>();
				for (BookDTO b : books) {
					PhotoDTO tmp = photoDAO.getCoverPhoto(b);
					if (tmp != null) {
						mapCoverPhoto.put(b.getId(), tmp.getPathname());
					}
				}
				HttpSession session = request.getSession();
				session.setAttribute("newBooks", books);
				resp.put("books", books);
				resp.put("mapCoverPhoto", mapCoverPhoto);
			}
			else {
				System.err.println("NOT FOUND NEW BOOK");
			}
			response.getWriter().print(gson.toJson(resp));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void getSpecialOffer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, Object> resp = new HashMap<String, Object>();
		Gson gson = new Gson();

		try {
			int page = Integer.parseInt(request.getParameter("page"));
			int limit = 3;
			int offset = (page - 1) * limit;
			
			FilterCriteria criteria = new FilterCriteria();
			criteria.setPage(page);
			criteria.setPageSize(limit);
			// Change condition after
			criteria.setAuthorId("TG04");

			List<BookDTO> books = bookService.getBooksWithFilter(criteria);
			int totalBook = bookService.countBook();
			boolean hasMore = (limit + offset) < totalBook;

			Map<String, String> mapCoverPhoto = new HashMap<String, String>();
			for (BookDTO b : books) {
				PhotoDTO tmp = photoDAO.getCoverPhoto(b);
				if (tmp != null) {
					mapCoverPhoto.put(b.getId(), tmp.getPathname());
				}
			}

			resp.put("books", books);
			resp.put("mapCoverPhoto", mapCoverPhoto);
			resp.put("hasMore", hasMore);
			resp.put("totalBook", totalBook);

			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void getFlashSale(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, Object> resp = new HashMap<String, Object>();
		Gson gson = new Gson();

		try {
			int page = Integer.parseInt(request.getParameter("page"));
			int limit = 4;
			int offset = (page - 1) * limit;
			PromotionDTO promotionDTO = promotionService.findByName("flash sale");
			if (promotionDTO == null) {
				System.err.println("Not found promotion");
				return;
			}
			FilterCriteria criteria = new FilterCriteria();
			criteria.setPage(page);
			criteria.setPageSize(limit);
			criteria.setPromotionId(promotionDTO.getId());

			List<BookDTO> books = bookService.getBooksWithFilter(criteria);
			int totalBook = bookService.countBook();
			boolean hasMore = (limit + offset) < totalBook;

			Map<String, String> mapCoverPhoto = new HashMap<String, String>();
			for (BookDTO b : books) {
				PhotoDTO tmp = photoDAO.getCoverPhoto(b);
				if (tmp != null) {
					mapCoverPhoto.put(b.getId(), tmp.getPathname());
				}
			}
			// Lấy giờ hiện tại theo timezone VN
			ZoneId vnZone = ZoneId.of("Asia/Ho_Chi_Minh");
			LocalDate today = LocalDate.now(vnZone);

			// Hard code: 12:45 hôm nay
			LocalDateTime endTime = LocalDateTime.of(today, LocalTime.of(12, 52));

			// Convert sang millis
			long endTimeMillis = endTime.atZone(vnZone).toInstant().toEpochMilli();
			resp.put("books", books);
			resp.put("mapCoverPhoto", mapCoverPhoto);
			resp.put("hasMore", hasMore);
			resp.put("totalBook", totalBook);
			resp.put("flashsaleTime",endTimeMillis);

			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void getNewTrend(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, Object> resp = new HashMap<String, Object>();
		Gson gson = new Gson();
		try {
			int page = Integer.parseInt(request.getParameter("page"));
			int limit = 4;
			int offset = (page - 1) * limit;

			List<BookDTO> books = bookService.getBooksLimitOffset(limit, offset);
			int totalBook = bookService.countBook();
			boolean hasMore = (limit + offset) < totalBook;

			Map<String, String> mapCoverPhoto = new HashMap<String, String>();

			for (BookDTO b : books) {
				PhotoDTO tmp = photoDAO.getCoverPhoto(b);
				if (tmp != null) {
					mapCoverPhoto.put(b.getId(), tmp.getPathname());
				}
			}
			resp.put("test", "Đay la test");
			resp.put("books", books);
			resp.put("mapCoverPhoto", mapCoverPhoto);
			resp.put("hasMore", hasMore);
			resp.put("totalBook", totalBook);

			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public void showBookDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			request.setCharacterEncoding("UTF-8");
			request.getRequestDispatcher(BOOK_DETAIL_PAGE).forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void getBooksInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession(true);

			String bookId = request.getParameter("bookId");

			BookDTO book = bookService.findById(bookId);

			List<PhotoDTO> photos = photoDAO.getListPhotoByBookId(book);
			FilterCriteria criteria = new FilterCriteria();
			criteria.setCateBookId(book.getCateBook().getId());
			criteria.setPageSize(4);
			criteria.setPage(1);
			List<BookDTO> booksWithCategory = bookService.getBooksWithFilter(criteria);
			// List<BookDTO> booksWithCategory =
			// bookService.getBooksCategory(book.getCateBook());
			Map<String, String> mapCoverPhoto = new HashMap<String, String>();

			String coverPhotoPath = "";

			for (PhotoDTO p : photos) {
				if (p.isCover()) {
					coverPhotoPath = p.getPathname();
				}
			}

			for (BookDTO b : booksWithCategory) {
				mapCoverPhoto.put(b.getId(), photoDAO.getCoverPhoto(b).getPathname());
			}

			session.setAttribute("book", book);
			session.setAttribute("coverPhotoPath", coverPhotoPath);
			session.setAttribute("photos", photos);
			session.setAttribute("totalPhoto", photos.size());
			session.setAttribute("booksWithCategory", booksWithCategory);
			session.setAttribute("mapCoverPhoto", mapCoverPhoto);

			response.sendRedirect(request.getContextPath() + "/books/view-detail");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
