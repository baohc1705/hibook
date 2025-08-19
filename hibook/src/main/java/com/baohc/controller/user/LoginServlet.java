package com.baohc.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.model.user.UserDAO;
import com.baohc.model.user.UserDTO;
import com.baohc.utils.EncryptPassword;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			password = EncryptPassword.toSHA1(password);

			UserDTO user_found = UserDAO.getInstance().login(new UserDTO(null, email, password, null, null));

			HttpSession session = request.getSession();

			if (user_found != null) {
				if (user_found.getCateUser().getId() == 3) {	
					session.setAttribute("USER_ACC", user_found);
					request.getRequestDispatcher("/views/homepage.jsp").forward(request, response);
				}else if (user_found.getCateUser().getId() == 1 || user_found.getCateUser().getId() == 2) {
					session.setAttribute("ADMIN_ACC", user_found);
					request.getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);
				}
				
			} else {
				request.setAttribute("errMsg_Login", "Đăng nhập thất bại.");
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
