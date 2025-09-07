package com.baohc.app.controller.book;

import java.io.IOException;
import java.util.ArrayList;
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
import com.baohc.app.service.author.AuthorService;
import com.baohc.app.service.author.AuthorServiceImpl;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;
import com.baohc.core.utils.FilterCriteria;
import com.google.gson.Gson;

public class GetBooksController {
	private final String HOME_PAGE = "/WEB-INF/views/homepage.jsp";
	private final String BOOK_DETAIL_PAGE = "/WEB-INF/views/book/bookdetail.jsp";
	private BookService bookService;
	private CateBookService cateBookService;
	private AuthorService authorService;
	private PhotoDAO photoDAO;

	public GetBooksController() {
		bookService = BookServiceImpl.getInstance();
		cateBookService = CateBookServiceImpl.getInstance();
		authorService = AuthorServiceImpl.getInstance();
		photoDAO = PhotoDAOImpl.getInstance();
	}

	public void getBooks(HttpServletRequest request, HttpServletResponse response)
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
			//List<BookDTO> booksWithCategory = bookService.getBooksCategory(book.getCateBook());
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
