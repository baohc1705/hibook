package com.baohc.app.controller.user;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.baohc.app.model.UserDTO;
import com.baohc.app.service.user.UserService;
import com.baohc.app.service.user.UserServiceImpl;
import com.baohc.core.utils.FileKit;
import com.google.gson.Gson;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,      // 1MB
	    maxFileSize = 1024 * 1024 * 5,        // 5MB
	    maxRequestSize = 1024 * 1024 * 25     // 25MB
	)
@WebServlet(name = "user-controller", urlPatterns = { "/user/*" })
public class UserController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserService userService = UserServiceImpl.getInstance() ;
	private static final String UPLOAD_DIR = "/assets/images/avatars";
	private static final long MAX_FILESIZE = 1024 * 1024;
	
	
	public UserController() {
		userService = UserServiceImpl.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		String path = uri.substring("/user".length());
		
		if (path.equals("/show-info")) {
			showInfo(request, response);
		}
	}
	
	
	private void showInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String reqPage = "";
			String page = request.getParameter("page");
			if (page == null || page.isEmpty()) {
				reqPage = "info";
				request.setAttribute("reqPage", reqPage);
				request.getRequestDispatcher("/WEB-INF/views/user/userInfo.jsp").forward(request, response);
			}
				
			switch (page) {
			case "info":
				reqPage = "info";
				break;
			case "orders":
				reqPage = "orders";
				break;
			default:
				reqPage = "info";
				break;
			}
			request.setAttribute("reqPage", reqPage);
			request.getRequestDispatcher("/WEB-INF/views/user/userInfo.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		
		try {
			HttpSession session = request.getSession();
			UserDTO user = (UserDTO)(session != null ? session.getAttribute("USER_ACC") : null);
			System.out.println("\t\t"+user);
			if (user == null) {
				resp.put("status", "error");
				resp.put("message", "Phiên đăng nhập của bạn đã hết hạn vui lòng đăng nhập lại");
				response.getWriter().print(gson.toJson(resp));
				return;
			}

			String email = request.getParameter("email");
			String fullname = request.getParameter("fullname");
			String birthDate = request.getParameter("birthDate");
			if (email == null || email.isEmpty() || fullname == null || fullname.isEmpty()) {
				resp.put("status", "error");
				resp.put("message", "Dữ liệu trống không thể cập nhật");
				response.getWriter().print(gson.toJson(resp));
			}
			user.setEmail(email);
			user.setFullname(fullname);
			if (birthDate != null && !birthDate.isEmpty()) {
				user.setBirthDate(Date.valueOf(birthDate));
			}
			System.out.println("\t\t"+user);
			Part filePart = request.getPart("avatar-path");
			if (filePart != null && filePart.getSize() > 0) {
				if (filePart.getSize() > MAX_FILESIZE)  {
					resp.put("status", "error");
					resp.put("message", "Kích thước file vượt quá 1MB");
					response.getWriter().print(gson.toJson(resp));
					return;
				}

				String filename = FileKit.uploadFile(filePart, UPLOAD_DIR, request);
				if (filename != null) {
					if (!filename.isEmpty())
						user.setAvatar(filename);
					else  {
						resp.put("status", "error");
						resp.put("message", "Tải file ảnh thất bại. Kiểm tra lại đuôi file (.jpg/.png)");
						response.getWriter().print(gson.toJson(resp));
						return;
					}
				}
			}
			if (userService.update(user) > 0) {
				UserDTO user_res = userService.find(user);
				session.setAttribute("USER_ACC", user_res);
				resp.put("status", "success");
				resp.put("message", "Cập nhật thông tin thành công");
			}
			else {
				resp.put("status", "error");
				resp.put("message", "Lỗi cập nhật thông tin. Kiểm tra lại các dữ liệu");
			}
			
		} catch (Exception e) {
			resp.put("status", "error");
			resp.put("message", "Máy chủ lỗi. Vui lòng thử lại sau");
			e.printStackTrace();
		}
		response.getWriter().print(gson.toJson(resp));
	}
}
