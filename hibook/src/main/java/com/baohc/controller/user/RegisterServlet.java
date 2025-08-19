package com.baohc.controller.user;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.model.user.CateUserDAO;
import com.baohc.model.user.CateUserDTO;
import com.baohc.model.user.UserDAO;
import com.baohc.model.user.UserDTO;
import com.baohc.utils.EmailKit;
import com.baohc.utils.EncryptPassword;
import com.baohc.utils.StringKit;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(name = "register", urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");

			String email = request.getParameter("email");	
			String password = request.getParameter("password");
			
			password = EncryptPassword.toSHA1(password);
			
			String fullname = request.getParameter("fullname");
			Date birthDate = Date.valueOf(request.getParameter("birthDate"));
			
			Random random = new Random();
			
			String id = "#" + System.currentTimeMillis() + random.nextInt(1000) + ""; 
			
			UserDTO user = new UserDTO(id, CateUserDAO.getInstance().find(new CateUserDTO(3,"")), email, password, fullname, birthDate);
			
			UserDTO userGetByEmail = UserDAO.getInstance().findByEmail(user);
			HttpSession session = request.getSession();
			if (userGetByEmail == null) {
				String code_OTP = StringKit.RandomOTP();
				try {
					EmailKit.sendEmail(user.getEmail(), "Xác thực email tại HiBOOK.com", "Xin chào " + user.getFullname() + ",\nMã OTP của bạn là: " + code_OTP
							+ "\n(OTP có hiệu lực 1 phút)");
					System.out.println("Đã gửi mail xác thực thành công");
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				session.setAttribute("user_verification_otp", user);
				
				code_OTP = EncryptPassword.toSHA1(code_OTP);
				
				session.setAttribute("code_OTP", code_OTP);
				session.setAttribute("code_OTP_Time", System.currentTimeMillis() + (60 * 1000)); // Hiệu lực 1 phút
				
				request.getRequestDispatcher("/views/verification.jsp").forward(request, response);
			}
			else {
				request.setAttribute("errMsg", "Email đã tồn tại");
				request.getRequestDispatcher("/views/register.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("error");
		}
	}
}
