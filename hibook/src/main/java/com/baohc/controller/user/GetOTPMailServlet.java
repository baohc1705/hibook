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
import com.baohc.utils.EmailKit;
import com.baohc.utils.EncryptPassword;
import com.baohc.utils.StringKit;
import com.google.gson.Gson;

/**
 * Servlet implementation class GetOTPMailServlet
 */
@WebServlet(name = "get-otp-code", urlPatterns = { "/get-otp-code" })
public class GetOTPMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOTPMailServlet() {
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
			String email = request.getParameter("newEmail");
			if (email == null) {
				resp.put("status", "error");
				resp.put("message", "Email lỗi. Kiểm tra lại email");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			UserDTO user = new UserDTO();
			user.setEmail(email);
			UserDTO userFindByEmail = UserDAO.getInstance().findByEmail(user);
			if (userFindByEmail != null) {
				resp.put("status", "error");
				resp.put("message", "Email đã tồn tại không thể cập nhật với email này");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			String otp = StringKit.RandomOTP();
			
			Long otp_time = System.currentTimeMillis() + (60*1000);
			
			try {
				EmailKit.sendEmail(email, "Xác thực email tại HiBook.com", "Xin chào bạn đây là mã OTP: " + otp 
						+ " (mã có hiệu lực 1 phút.)");
				System.out.println("Gửi mail xác thực thành công");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Gửi mail xác thực thất bại");
			}
			
			otp = EncryptPassword.toSHA1(otp);
			session.setAttribute("otpCode", otp);
			session.setAttribute("otpTime", otp_time);
			
			resp.put("status", "success");
			resp.put("message", "Kiểm tra email để lấy mã xác thực OTP");
			response.getWriter().print(gson.toJson(resp));
			
		} catch (Exception e) {
			// TODO: handle exception
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
