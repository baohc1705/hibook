package com.baohc.controller.user;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.Email;

import com.baohc.model.user.PasswordResetTokenDAO;
import com.baohc.model.user.PasswordResetTokenDTO;
import com.baohc.model.user.UserDAO;
import com.baohc.model.user.UserDTO;
import com.baohc.utils.EmailKit;
import com.baohc.utils.StringKit;
import com.baohc.utils.TokenKit;
import com.google.gson.Gson;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet(name = "forgot-password", urlPatterns = { "/forgot-password" })
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO userDAO = UserDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		
		try {
			String email = request.getParameter("email");

			if (email == null && email.isEmpty()) {
				resp.put("status", "error");
				resp.put("message", "Email rỗng hoặc lỗi. Vui lòng kiểm tra lại");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			UserDTO usertmp = new UserDTO();
			usertmp.setEmail(email);
			UserDTO userByEmail = UserDAO.getInstance().findByEmail(usertmp);
			
			if (userByEmail == null) {
				resp.put("status", "error");
				resp.put("message", "Không tìm thấy người dùng với email này.");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			// Tạo raw token + salt
			String rawToken = StringKit.RandomToken();
			String salt = TokenKit.generateSalt();
			String hashedToken = TokenKit.hashSHA256(rawToken, salt);
			
			Timestamp expiry = new Timestamp(System.currentTimeMillis() + (5 * 60 * 1000)); // 5 phút
			int saveToken = PasswordResetTokenDAO.getInstance().saveToken(new PasswordResetTokenDTO(userByEmail.getId(), hashedToken, expiry, salt, false));
			if (saveToken == 1) {
				try {
					System.out.println(userByEmail.getId() + rawToken);
					
					String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
					String link = url + "/reset-password?uid="+ URLEncoder.encode(userByEmail.getId(), "UTF-8") + "&token=" + URLEncoder.encode(rawToken, "UTF-8");
					String content = "<p>Click vào link sau để đặt lại mật khẩu:</p>"
				               + "<a href='" + link + "'>" + link + "</a>";
					
					EmailKit.sendEmail(userByEmail.getEmail(), "Đặt lại mật khẩu tại HiBOOK.com", content);
					
					System.out.println("Gửi mail đặt lại mật khẩu thành công");
					resp.put("status", "success");
					resp.put("message", "Đã gửi thông tin xác nhận đến email của bạn. Vui lòng kiểm tra email.");
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Gửi mail đặt lại mật khẩu thất bại");
					resp.put("status", "error");
					resp.put("message", "Không gửi được mail.Vui lòng kiểm tra lại");
				}
			}
			else {
				resp.put("status", "error");
				resp.put("message", "Vui lòng chọn xác nhận trong mail");
				System.out.println("Token không khớp");
			}
			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Lỗi máy chủ");
		}
	}

}
