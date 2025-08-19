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

import com.baohc.model.user.UserDAO;
import com.baohc.model.user.UserDTO;
import com.baohc.utils.EncryptPassword;
import com.google.gson.Gson;

/**
 * Servlet implementation class VerifyServlet
 */
@WebServlet(name = "verification-email", urlPatterns = { "/verification-email" })
public class VerifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		
		Gson gson = new Gson();
		try {
			
			String otp_user = request.getParameter("otp_user");
			System.out.println(otp_user);
			otp_user = EncryptPassword.toSHA1(otp_user);
			
			HttpSession session = request.getSession();
			String code_otp = (String)session.getAttribute("code_OTP");
			
			Long code_OTP_Time = (Long)session.getAttribute("code_OTP_Time");
			
			UserDTO user = (UserDTO)session.getAttribute("user_verification_otp");
			
			if (code_otp == null || code_OTP_Time == null) {
				resp.put("status", "error");
				resp.put("message", "Mã xác thực không tồn tại!!");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			if (System.currentTimeMillis() > code_OTP_Time) {
				
				session.removeAttribute("code_OTP");
				session.removeAttribute("code_OTP_Time");
				resp.put("status", "error");
				resp.put("message", "Mã xác thực đã không còn hiệu lực");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			if (otp_user.equals(code_otp)) {
	
				int inserted = UserDAO.getInstance().insert(user);
				if (inserted == 1) {
					session.removeAttribute("code_OTP");
					session.removeAttribute("code_OTP_Time");
					session.removeAttribute("user_verification_otp");
					
					resp.put("status", "success");
					resp.put("message", "Đã xác minh và tạo tài khoản thành công!");
									
				}
				else {
					resp.put("status", "error");
					resp.put("message", "Tạo tài khoản thất bại!");
				}
			}
			else {
				resp.put("status", "error");
				resp.put("message", "Mã xác thực OTP không đúng. Kiểm tra lại email!");
			}
			
			response.getWriter().print(gson.toJson(resp));	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
