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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			password = EncryptPassword.toSHA1(password);

			UserDTO user_found = UserDAO.getInstance().login(new UserDTO(null, email, password, null, null));
			
			HttpSession session = request.getSession();
			
			if (user_found != null) {
				session.setAttribute("user_account", user_found);
				request.getRequestDispatcher("homepage.jsp").forward(request, response);
			}
			else {
				System.out.println("Dang nhap that bai");
				request.setAttribute("errMsg_Login", "Đăng nhập thất bại.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
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
