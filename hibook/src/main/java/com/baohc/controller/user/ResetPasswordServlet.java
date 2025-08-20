package com.baohc.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.model.user.PasswordResetTokenDAO;
import com.baohc.model.user.PasswordResetTokenDTO;
import com.baohc.model.user.UserDAO;
import com.baohc.model.user.UserDTO;
import com.baohc.utils.EncryptPassword;
import com.baohc.utils.TokenKit;
import com.google.gson.Gson;

/**
 * Servlet implementation class ResetPasswordServlet
 */
@WebServlet(name = "reset-password", urlPatterns = { "/reset-password" })
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			String uid = request.getParameter("uid");
			String rawToken = request.getParameter("token");
			System.out.println(uid + rawToken);
			String salt = PasswordResetTokenDAO.getInstance().getSaltByUserID(uid);
			String hasedToken = TokenKit.hashSHA256(rawToken, salt);
			
			PasswordResetTokenDTO token = PasswordResetTokenDAO.getInstance().findValidToken(uid, hasedToken);
			System.out.println(token);
			if (token != null) {
				request.setAttribute("uid", uid);
				request.setAttribute("token_id", token.getId());
				request.setAttribute("tokenValid", true);
				System.out.println("Token thành công");
				request.setAttribute("msgSuccessToken", "Email đã xác thực thành công.");
				request.getRequestDispatcher("/views/forgotPassword.jsp").forward(request, response);
			}
			else {
				System.out.println("Token không hợp lệ hoặc đã hết hạn");
				request.setAttribute("tokenValid", false);
				request.setAttribute("msgErrorToken", "Email đã xác thực không thành công. Đã hết hạn xác thực!!!");
				request.getRequestDispatcher("/views/forgotPassword.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
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
			String uid = request.getParameter("userid");
			int token_id = Integer.parseInt(request.getParameter("token_id"));
			String newPassword = request.getParameter("password");
			
			if (newPassword == null && newPassword.isEmpty()) {
				resp.put("status", "error");
				resp.put("message", "Password rỗng. Kiểm tra lại password");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			newPassword = EncryptPassword.toSHA1(newPassword);
			int updatePassword = UserDAO.getInstance().updatePasswordByToken(uid, newPassword);
			if (updatePassword == 1)  {
				PasswordResetTokenDAO.getInstance().markAsUsed(token_id);
				System.out.println("Cập nhật password thành công");
				resp.put("status", "success");
				resp.put("message", "Cập nhật mật khẩu thành công.");
				
			}
			else {
				System.out.println("Cập nhật password fail");
				resp.put("status", "error");
				resp.put("message", "Cập nhật mật khẩu thất bại.");
			}
			
			response.getWriter().print(gson.toJson(resp));

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
