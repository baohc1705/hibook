package com.baohc.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.model.user.UserDTO;
import com.baohc.utils.EmailKit;
import com.baohc.utils.EncryptPassword;
import com.baohc.utils.StringKit;

/**
 * Servlet implementation class ResendOTPServlet
 */
@WebServlet(name = "resend-otp", urlPatterns = { "/resend-otp" })
public class ResendOTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResendOTPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			UserDTO user = (UserDTO)session.getAttribute("user_verification_otp");
			
			String code_otp_new = StringKit.RandomOTP();
			Long otp_time = System.currentTimeMillis() + (60*1000);
			
			try {
				EmailKit.sendEmail(user.getEmail(), "Mã xác thực mới - HiBook",
		                "Xin chào " + user.getFullname() + ",\nMã OTP mới của bạn là: " + code_otp_new + "\n(OTP có hiệu lực 1 phút)");
				System.out.println("Gửi mail lại thành công");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Gửi mail lại thất bại");
			}
			code_otp_new = EncryptPassword.toSHA1(code_otp_new);
			session.setAttribute("code_OTP", code_otp_new);
			session.setAttribute("code_OTP_Time", otp_time);
			
			request.getRequestDispatcher("/views/verification.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Lỗi servlet");
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
