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

import com.baohc.utils.EncryptPassword;
import com.google.gson.Gson;

/**
 * Servlet implementation class VerifyEmailServlet
 */
@WebServlet(name = "verify-email", urlPatterns = { "/verify-email" })
public class VerifyEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		
		try {
			HttpSession session = request.getSession();
			String otp_user = request.getParameter("otp_user");
			otp_user = EncryptPassword.toSHA1(otp_user);
			
			String newEmail = request.getParameter("newEmail");
			
			String otpCode = (String)session.getAttribute("otpCode");
			Long otpTime = (Long)session.getAttribute("otpTime");
			
			if (otpCode == null || otpTime == null) {
				resp.put("status", "error");
				resp.put("message", "Lỗi session otp");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			if (System.currentTimeMillis() > otpTime) {
				session.removeAttribute("otpCode");
				session.removeAttribute("otpTime");
				resp.put("status", "error");
				resp.put("message", "OTP đã hết hiệu lực");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			if (otp_user.equals(otpCode)) {
				
				session.removeAttribute("otpCode");
				session.removeAttribute("otpTime");
				resp.put("status", "success");
				resp.put("message", "Xác thực thành công");
				resp.put("newEmail", newEmail);
			}
			else {
				resp.put("status", "error");
				resp.put("message", "Mã xác thực không khớp");
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
