package com.baohc.app.controller.admin.book;

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
import com.baohc.app.model.AuthorDTO;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CateBookDTO;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.model.PromotionDTO;
import com.baohc.app.service.author.AuthorService;
import com.baohc.app.service.author.AuthorServiceImpl;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;
import com.baohc.core.utils.FileKit;
import com.baohc.core.utils.PaginationKit;
import com.baohc.core.utils.StringKit;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class AdminBookController {
	private final int PAGE_SIZE = 3;

	private final String BOOK_PAGE = "/WEB-INF/views/admin/books/book-management.jsp";
	private final String ADDBOOK_PAGE = "/WEB-INF/views/admin/books/add-book.jsp";
	private final String EDITBOOK_PAGE = "/WEB-INF/views/admin/books/edit-book.jsp";
	private BookService bookService;
	private PhotoDAO photoDAO;
	private CateBookService cateBookService;
	private AuthorService authorService;

	public AdminBookController() {
		bookService = BookServiceImpl.getInstance();
		photoDAO = PhotoDAOImpl.getInstance();
		cateBookService = CateBookServiceImpl.getInstance();
		authorService = AuthorServiceImpl.getInstance();
	}

	public void showBooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();

			List<BookDTO> bookList = bookService.getAllBook();

			Map<BookDTO, String> coverPhotoList = new HashMap<BookDTO, String>();

			List<CateBookDTO> cateBookList = cateBookService.getAllCateBook();
			List<AuthorDTO> authorList = authorService.getAllAuthors();

			for (BookDTO b : bookList) {
				List<PhotoDTO> photolist = photoDAO.getListPhotoByBookId(b);
				for (PhotoDTO pitem : photolist) {
					if (pitem.isCover()) {
						coverPhotoList.put(b, pitem.getPathname());
					}
				}
			}
			session.setAttribute("coverPhotoList", coverPhotoList);
			session.setAttribute("bookList", bookList);
			session.setAttribute("cateBookList", cateBookList);
			session.setAttribute("authorList", authorList);
			request.getRequestDispatcher(BOOK_PAGE).forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void showPaginationBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			request.getRequestDispatcher(BOOK_PAGE).forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void doPaginationBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		try {

			int page = 1;
			if (request.getParameter("page") != null)
				page = Integer.parseInt(request.getParameter("page"));

			int totalRecord = bookService.getTotalRecord();
			int totalPages = (int) Math.ceil((double) totalRecord / PAGE_SIZE);

			List<BookDTO> books = bookService.getAllBookByPage(page, PAGE_SIZE);

			JsonObject json = new JsonObject();
			json.addProperty("totalPages", totalPages);
			json.addProperty("currentPage", page);

			JsonArray jsonArray = new JsonArray();
			for (BookDTO b : books) {
				JsonObject object = new JsonObject();
				object.addProperty("id", b.getId());
				object.addProperty("cateBook_name", b.getCateBook().getName());

				List<PhotoDTO> photolist = photoDAO.getListPhotoByBookId(b);
				for (PhotoDTO pitem : photolist) {
					if (pitem.isCover()) {
						object.addProperty("coverPhoto", pitem.getPathname());
						break;
					}
				}

				object.addProperty("name", b.getName());
				object.addProperty("author", b.getAuthor().getFullname());
				object.addProperty("description", b.getDescription());
				object.addProperty("amount", b.getAmount());
				object.addProperty("price", b.getPrice());
				object.addProperty("createAt", b.getCreateAt().toString());

				jsonArray.add(object);
			}
			json.add("books", jsonArray);

			List<Object> pagination = PaginationKit.getPagination(page, totalPages);
			JsonArray arrPagination = new JsonArray();
			for (Object o : pagination) {
				arrPagination.add(o.toString());
			}
			json.add("arrPagination", arrPagination);

			HttpSession session = request.getSession();

			List<CateBookDTO> cateBookList = cateBookService.getAllCateBook();
			List<AuthorDTO> authorList = authorService.getAllAuthors();

//			if ((cateBookList==null || cateBookList.isEmpty()) && (authorList == null ||
//				authorList.isEmpty())) {
//				cateBookList = cateBookService.getAllCateBook();
//				authorList = authorService.getAllAuthors();
//			}
			session.setAttribute("cateBookList", cateBookList);
			session.setAttribute("authorList", authorList);

			response.getWriter().write(json.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void showAddBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			request.getRequestDispatcher(ADDBOOK_PAGE).forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void doAddBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		try {

			String bookname = request.getParameter("bookname");

			int catebook_id = Integer.parseInt(request.getParameter("catebook"));
			CateBookDTO cateBookDTO = cateBookService.findById(catebook_id);

			String author_id = request.getParameter("author");
			System.out.println("AUTHOR ID: " + author_id);
			AuthorDTO authorDTO = authorService.findById(author_id);

			double price = Double.parseDouble(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			String description = request.getParameter("description");

			BookDTO booktmp = new BookDTO();

			booktmp.setId("B" + StringKit.RandomIdTime());
			booktmp.setName(bookname);
			booktmp.setCateBook(cateBookDTO);
			booktmp.setPrice(price);
			booktmp.setAmount(amount);
			booktmp.setDescription(description);
			booktmp.setAuthor(authorDTO);
			PromotionDTO promotionDTO = new PromotionDTO();
			promotionDTO.setId(1);
			booktmp.setPromotion(promotionDTO);

			System.out.println("BOOK: " + booktmp);

			int insert = bookService.insert(booktmp);

			if (insert == 1) {
				System.out.println("Them sach thanh cong");
				resp.put("status", "success");
				resp.put("message", "Thêm sách thành công");
				resp.put("bookId", booktmp.getId());

			} else {
				System.out.println("Them sach that bai");
				resp.put("status", "error");
				resp.put("message", "Thêm sách thất bại");
			}

			response.getWriter().print(gson.toJson(resp));

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void showEditBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();
			String book_id = request.getParameter("bookId");
			BookDTO bookDTO = bookService.findById(book_id);
			if (bookDTO == null)
				return;

			String coverPhotoPathName = "";
			List<PhotoDTO> photoList = new ArrayList<PhotoDTO>();
			List<PhotoDTO> photoListDB = photoDAO.getListPhotoByBookId(bookDTO);
			for (PhotoDTO p : photoListDB) {
				if (p.isCover()) {
					coverPhotoPathName = p.getPathname();
				} else
					photoList.add(p);
			}
			session.setAttribute("coverPhotoPathName", coverPhotoPathName);
			session.setAttribute("photoList", photoList);
			session.setAttribute("book", bookDTO);
			request.getRequestDispatcher(EDITBOOK_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void doEditBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		try {
			String bookname = request.getParameter("bookname");

			int catebook_id = Integer.parseInt(request.getParameter("catebook"));
			CateBookDTO cateBookDTO = cateBookService.findById(catebook_id);

			String author_id = request.getParameter("author");
			System.out.println("AUTHOR ID: " + author_id);
			AuthorDTO authorDTO = authorService.findById(author_id);

			double price = Double.parseDouble(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			String description = request.getParameter("description");

			String book_id = request.getParameter("bookId");

			BookDTO booktmp = new BookDTO();

			booktmp.setId(book_id);
			booktmp.setName(bookname);
			booktmp.setCateBook(cateBookDTO);
			booktmp.setPrice(price);
			booktmp.setAmount(amount);
			booktmp.setDescription(description);
			booktmp.setAuthor(authorDTO);
			PromotionDTO promotionDTO = new PromotionDTO();
			promotionDTO.setId(1);
			booktmp.setPromotion(promotionDTO);

			System.out.println("BOOK: " + booktmp);

			int update = bookService.update(booktmp);
			if (update == 1) {
				System.out.println("sua sach thanh cong");
				resp.put("status", "success");
				resp.put("message", "Sửa sách thành công");
				resp.put("bookId", booktmp.getId());
			} else {
				System.out.println("Them sach that bai");
				resp.put("status", "error");
				resp.put("message", "Thêm sách thất bại");
			}

			response.getWriter().print(gson.toJson(resp));

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void doRemoveBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		try {
			String book_id = request.getParameter("bookId");

			BookDTO booktmp = bookService.findById(book_id);

			List<PhotoDTO> photoListDB = photoDAO.getListPhotoByBookId(booktmp);

			if (photoListDB != null && photoListDB.size() > 0)
				photoDAO.deletebyBookID(booktmp.getId());

			int isRemovedBook = bookService.delete(booktmp);
			if (isRemovedBook == 1) {
				resp.put("status", "success");
				resp.put("message", "Xóa sách thành công!");
			} else {
				resp.put("status", "error");
				resp.put("message", "Xóa sách thất bại!");
			}
			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
