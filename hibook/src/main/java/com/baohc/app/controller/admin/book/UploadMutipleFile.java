package com.baohc.app.controller.admin.book;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.baohc.app.dao.book.PhotoDAO;
import com.baohc.app.dao.book.PhotoDAOImpl;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.core.utils.FileKit;
import com.baohc.core.utils.StringKit;
import com.google.gson.Gson;

/**
 * Servlet implementation class UploadMutipleFile
 */
@MultipartConfig
@WebServlet("/uploadfile/*")
public class UploadMutipleFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "/assets/images/books";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadMutipleFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String uri = request.getRequestURI().substring(request.getContextPath().length());
			String path = uri.substring("/uploadfile".length());
			
			if ("/add-book".equals(path)) {
				addPhotoBook(request, response);
			}
			else if ("/edit-book".equals(path)) {
				editPhotoBook(request, response);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	private void editPhotoBook(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		try {
			String book_id = request.getParameter("bookId");
			System.out.println("SERVER: UPLOADFILE" + book_id);
			if ("".equals(book_id)) {
				resp.put("status", "error");
				resp.put("message", "Không có sách");
				response.getWriter().print(gson.toJson(resp));
				return;
			}

			

			BookService bookService = BookServiceImpl.getInstance();

			BookDTO bookDTO = bookService.findById(book_id);
			if (bookDTO == null)
				return;
			
			String oldCoverPhoto = request.getParameter("oldCoverPhoto");
			String[] oldPhotos = request.getParameterValues("oldPhotos");
			
			PhotoDTO dto = new PhotoDTO();

			PhotoDAO photoDAO = PhotoDAOImpl.getInstance();
			
			Part coverPhoto = request.getPart("coverPhoto");
			String coverFileName = "";
			// them moi
			if (coverPhoto != null && coverPhoto.getSize() > 0) {
				photoDAO.deleteByPathname(oldCoverPhoto);
				FileKit.delete(oldCoverPhoto, UPLOAD_DIR,  request);
				String coverPhotoFileName = FileKit.uploadFile(coverPhoto, UPLOAD_DIR, request);
				dto.setBook(bookDTO);
				dto.setPathname(coverPhotoFileName);
				dto.setCover(true);
				photoDAO.insert(dto);
				System.out.println("Cập nhật ảnh bìa mới: " + coverFileName);
			}
			// giu nguyen
			else {
				coverFileName = oldCoverPhoto;
				System.out.println("Giữ ảnh bìa cũ: " + coverFileName);
			}
 			

			// Them anh khac
			Collection<Part> parts = request.getParts();
			List<PhotoDTO> photoList = new ArrayList<PhotoDTO>();
			for (Part item : parts) {
				if ("photo".equals(item.getName()) && item.getSize() > 0) {
					String filename = FileKit.uploadFile(item, UPLOAD_DIR, request);
					PhotoDTO dto1 = new PhotoDTO();
					dto1.setBook(bookDTO);
					dto1.setPathname(filename);
					dto1.setCover(false);
					photoList.add(dto1);
				}
			}
			try {
				if (photoList.size() > 0) {
					List<PhotoDTO> photoListDB = photoDAO.getListPhotoByBookId(bookDTO);
					for(PhotoDTO p : photoListDB) {
						if(!p.isCover()) {
							FileKit.delete(p.getPathname(), UPLOAD_DIR, request);
							photoDAO.delete(p);
						}
					}
				}
				
				for(PhotoDTO p : photoList ) {
						System.out.println(p);
						photoDAO.insert(p);
				}
				
				System.out.println("danh sách ảnh đã được thêm");
				resp.put("status", "success");
				resp.put("message", "Thêm ảnh thành công");
				resp.put("isEdit", "true");

			} catch (Exception e) {

				resp.put("status", "error");
				resp.put("message", "Ảnh load lỗi");
			}

			response.getWriter().print(gson.toJson(resp));

		} catch (Exception e) {
			System.out.println("Them anh that bại");
			e.printStackTrace();
		}
		
	}

	private void addPhotoBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		try {
			String book_id = request.getParameter("bookId");
			System.out.println("SERVER: UPLOADFILE" + book_id);
			if ("".equals(book_id)) {
				resp.put("status", "error");
				resp.put("message", "Không có sách");
				response.getWriter().print(gson.toJson(resp));
				return;
			}

			List<PhotoDTO> photoList = new ArrayList<PhotoDTO>();

			BookService bookService = BookServiceImpl.getInstance();

			BookDTO bookDTO = bookService.findById(book_id);
			if (bookDTO == null)
				return;

			PhotoDTO dto = new PhotoDTO();

			PhotoDAO photoDAO = PhotoDAOImpl.getInstance();

			// Them anh bia

			Part coverPhoto = request.getPart("coverPhoto");
			String coverPhotoFileName = FileKit.uploadFile(coverPhoto, UPLOAD_DIR, request);
			dto.setBook(bookDTO);
			dto.setPathname(coverPhotoFileName);
			dto.setCover(true);
			photoList.add(dto);

			// Them anh khac

			for (Part item : request.getParts()) {
				if ("photo".equals(item.getName())) {
					String filename = FileKit.uploadFile(item, UPLOAD_DIR, request);
					PhotoDTO dto1 = new PhotoDTO();
					dto1.setBook(bookDTO);
					dto1.setPathname(filename);
					dto1.setCover(false);
					photoList.add(dto1);
				}
			}
			try {
				if (photoList != null) {
					for (PhotoDTO p : photoList) {
						photoDAO.insert(p);
					}
				}

				System.out.println("danh sách ảnh đã được thêm");
				resp.put("status", "success");
				resp.put("message", "Thêm ảnh thành công");
				resp.put("isEdit", "true");

			} catch (Exception e) {

				resp.put("status", "error");
				resp.put("message", "Ảnh load lỗi");
			}

			response.getWriter().print(gson.toJson(resp));

		} catch (Exception e) {
			System.out.println("Them anh that bại");
			e.printStackTrace();
		}
	}

}
