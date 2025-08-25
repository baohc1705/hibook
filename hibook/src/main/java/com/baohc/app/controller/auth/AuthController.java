package com.baohc.app.controller.auth;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.app.model.CateUserDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.model.UserTokenDTO;
import com.baohc.app.service.user.CateUserService;
import com.baohc.app.service.user.CateUserServiceImpl;
import com.baohc.app.service.user.UserService;
import com.baohc.app.service.user.UserServiceImpl;
import com.baohc.app.service.user.UserTokenService;
import com.baohc.app.service.user.UserTokenServiceImpl;

import com.baohc.core.utils.EncryptPassword;
import com.baohc.core.utils.StringKit;
import com.baohc.core.utils.TokenKit;
import com.google.gson.Gson;



/*NOTE: áp dùng PRG pattern để chuyển trang*/
public class AuthController{
	private UserService userService;
	private CateUserService cateUserService;
	private UserTokenService userTokenService;
	
	private final String HOME_PAGE = "/";
	private final String LOGIN_PAGE = "/WEB-INF/views/auth/login.jsp";
	private final String LOGIN_SERVLET = "/login";
	private final String REGISTER_PAGE = "/WEB-INF/views/auth/register.jsp";
	private final String REGISTER_SERVLET = "/register";
	private final String VERIFYACCOUNT_PAGE = "/WEB-INF/views/auth/verifyAccount.jsp";
	private final String FORGOTPASS_PAGE = "/WEB-INF/views/auth/forgotPassword.jsp";
	
	public AuthController() {
		userService = UserServiceImpl.getInstance();
		cateUserService = CateUserServiceImpl.getInstance();
		userTokenService = UserTokenServiceImpl.getInstance();
	}

	public void showLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
	}

	public void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			password = EncryptPassword.toSHA1(password);

			UserDTO user_tmp = new UserDTO();
			user_tmp.setEmail(email);
			user_tmp.setPassword(password);

			UserDTO user_found = this.userService.login(user_tmp);

			HttpSession session = request.getSession();

			if (user_found != null) {
				if (user_found.getCateUser().getId() == 3) {
					session.setAttribute("USER_ACC", user_found);
					response.sendRedirect(request.getContextPath() + HOME_PAGE);
				} else if (user_found.getCateUser().getId() == 1 || user_found.getCateUser().getId() == 2) {
					session.setAttribute("ADMIN_ACC", user_found);
					response.sendRedirect(request.getContextPath() + "/admin");
				}

			} else {
				session.setAttribute("errMsg_Login", "Đăng nhập thất bại.");
				response.sendRedirect(request.getContextPath() + LOGIN_SERVLET);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void doLogout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			if (session != null)
				session.invalidate();
			response.sendRedirect(request.getContextPath()+LOGIN_SERVLET);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void showRegister (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void doRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");

			String email = request.getParameter("email");	
			String password = request.getParameter("password");
			
			password = EncryptPassword.toSHA1(password);
			
			String fullname = request.getParameter("fullname");
			Date birthDate = Date.valueOf(request.getParameter("birthDate"));

			String id = StringKit.RandomId(); 
			
			CateUserDTO cateUserDTO = cateUserService.find(new CateUserDTO(3, ""));
			
			UserDTO user = new UserDTO(id, cateUserDTO, email, password, fullname, birthDate);
			
			UserDTO userGetByEmail = userService.findByEmail(user);
			
			HttpSession session = request.getSession();
			
			if (userGetByEmail == null) {			
				session.setAttribute("userIsVerify", user);
				response.sendRedirect(request.getContextPath() + "/verify-account");
				System.out.println("Chuyển sang xác thực email");
			}
			else {
				System.out.println("Email đã tồn tại");
				session.setAttribute("errMsg", "Email đã tồn tại");
				response.sendRedirect(request.getContextPath() + REGISTER_SERVLET);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void showForgotPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.getRequestDispatcher(FORGOTPASS_PAGE).forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void doGetForgotPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String user_id = request.getParameter("userId");
			String rawToken = request.getParameter("token");
			
			String salt = userTokenService.getSaltByUserId(user_id);
			String hasedToken = TokenKit.hashSHA256(rawToken, salt);
			
			UserTokenDTO token = userTokenService.findValidToken(user_id, hasedToken);
			System.out.println(token);
			
			if (token != null) {
				userTokenService.maskUsed(token.getId());
				session.setAttribute("user_id", user_id);
				session.setAttribute("token_id", token.getId());
				session.setAttribute("token_IsValid", true);
				
				System.out.println("Token thành công");
				session.setAttribute("msgSuccessToken", "Email đã xác thực thành công.");
				request.getRequestDispatcher(FORGOTPASS_PAGE).forward(request, response);
			}
			else {
				System.out.println("Token không hợp lệ hoặc đã hết hạn");
				session.setAttribute("token_IsValid", false);
				session.setAttribute("msgErrorToken", "Email đã xác thực không thành công. Đã hết hạn xác thực!!!");
				request.getRequestDispatcher(FORGOTPASS_PAGE).forward(request, response);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendError(500);
		}
	}
	
	public void doForgotPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		
		try {
			HttpSession session = request.getSession();
			String user_id = request.getParameter("userid");
			int token_id = Integer.parseInt(request.getParameter("token_id"));
			String new_pass = request.getParameter("password");
			
			if (new_pass == null && new_pass.isEmpty()) {
				resp.put("status", "error");
				resp.put("message", "Password rỗng. Kiểm tra lại password");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			new_pass = EncryptPassword.toSHA1(new_pass);
			
			int update_pass = userService.updatePassword(user_id, new_pass);
			if (update_pass == 1) {
				
				session.removeAttribute("user_id");
				session.removeAttribute("token_id");
				session.removeAttribute("token_IsValid");
				
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
