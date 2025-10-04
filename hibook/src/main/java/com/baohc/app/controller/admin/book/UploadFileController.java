package com.baohc.app.controller.admin.book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.baohc.app.dao.book.PhotoDAO;
import com.baohc.app.dao.book.PhotoDAOImpl;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.core.utils.FileKit;
import com.google.gson.Gson;

@MultipartConfig
@WebServlet("/admin/upload/*")
public class UploadFileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "/assets/images/books";
	private BookService bookService ;
	private PhotoDAO photoDAO;
	
	@Override
	public void init() throws ServletException {
		bookService = BookServiceImpl.getInstance();
		photoDAO = PhotoDAOImpl.getInstance();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String uri = request.getRequestURI().substring(request.getContextPath().length());
			String path = uri.substring("/admin/upload".length());
			
			if ("/add-book".equals(path)) {
				addPhotoBook(request, response);
			}
		} catch (Exception e) {
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
			String bookId = request.getParameter("bookId");
			if (bookId == null || "".equals(bookId)) {
				resp.put("status", "error");
				resp.put("message", "Không có sách");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			BookDTO book = bookService.findById(bookId);
			
			if(book == null) {
				resp.put("status", "error");
				resp.put("message", "Không có sách");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			// Tạo list photo để thêm vào db
			List<PhotoDTO> photos = new ArrayList<PhotoDTO>();
			
			// Thêm ảnh bìa (bắt buộc)
			Part coverPhoto = request.getPart("coverPhoto");
			String coverPhotoFileName = FileKit.uploadFile(coverPhoto, UPLOAD_DIR, request);
			PhotoDTO photoDTO = new PhotoDTO();
			photoDTO.setBook(book);
			photoDTO.setPathname(coverPhotoFileName);
			photoDTO.setCover(true);
			photos.add(photoDTO);
			
			// Thêm ảnh phụ
			for (Part item: request.getParts()) {
				if ("photo".equals(item.getName())) {
					String photoFileName = FileKit.uploadFile(item, UPLOAD_DIR, request);
					PhotoDTO photo = new PhotoDTO();
					photo.setBook(book);
					photo.setPathname(photoFileName);
					photo.setCover(false);
					photos.add(photo);
				}
			}
			
			try {
				if (photos != null && photos.size() != 0) {
					for (PhotoDTO p : photos) {
						photoDAO.insert(p);
					}
				}
				
				resp.put("status", "success");
				resp.put("message", "Thêm ảnh thành công");
				
			} catch (Exception e) {
				resp.put("status", "error");
				resp.put("message", "Ảnh load lỗi");
			}
			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
