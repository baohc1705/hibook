package com.baohc.controller.user;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.baohc.model.user.UserDAO;
import com.baohc.model.user.UserDTO;
import com.baohc.utils.FileKit;
import com.google.gson.Gson;

/**
 * Servlet implementation class EditAccountServlet
 */
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1MB
    maxFileSize = 1024 * 1024 * 5,        // 5MB
    maxRequestSize = 1024 * 1024 * 25     // 25MB
)
@WebServlet(name = "edit-account", urlPatterns = { "/edit-account" })
public class EditAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "assets/images/avatars";
    private static final long MAX_FILESIZE = 1024 * 1024;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		
		try {
			HttpSession session = request.getSession();
			UserDTO user = (UserDTO)(session != null ? session.getAttribute("USER_ACC") : null);
			
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
			
			UserDTO userFindByEmail = UserDAO.getInstance().findByEmail(user);
			if (userFindByEmail != null) {
				resp.put("status", "error");
				resp.put("message", "Email đã tồn tại không thể cập nhật với email này");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			if (UserDAO.getInstance().update(user) > 0) {
				UserDTO user_res = UserDAO.getInstance().find(user);
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
