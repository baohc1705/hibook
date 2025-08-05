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
import com.baohc.utils.EncryptPassword;

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

			String url = "";
			String email = request.getParameter("email");	
			String password = request.getParameter("password");
			
			password = EncryptPassword.toSHA1(password);
			
			String fullname = request.getParameter("fullname");
			Date birthDate = Date.valueOf(request.getParameter("birthDate"));
			
			Random random = new Random();
			
			String id = "#" + System.currentTimeMillis() + random.nextInt(1000) + ""; 
			
			UserDTO user = new UserDTO(id, CateUserDAO.getInstance().find(new CateUserDTO(3,"")), email, password, fullname, birthDate);
			
			UserDTO userGetByEmail = UserDAO.getInstance().findByEmail(user);
			if (userGetByEmail == null) {
				int inserted = UserDAO.getInstance().insert(user);
				if (inserted == 1) {
					response.getWriter().write("success");
				}
				else {
					response.getWriter().write("fail");
					
				}
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("existed_email", user.getEmail());
				response.getWriter().write("exists");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("error");
		}
	}
}
