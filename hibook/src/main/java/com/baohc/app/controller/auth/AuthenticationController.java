package com.baohc.app.controller.auth;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baohc.app.config.PageConfig;
import com.baohc.app.config.SecurityConfig;
import com.baohc.app.model.UserDTO;
import com.baohc.app.model.UserTokenDTO;
import com.baohc.app.service.auth.AuthenticationService;
import com.baohc.app.service.user.UserService;
import com.baohc.app.service.user.UserServiceImpl;
import com.baohc.app.service.user.UserTokenService;
import com.baohc.app.service.user.UserTokenServiceImpl;
import com.baohc.core.utils.CSRFTokenUtil;
import com.baohc.core.utils.PasswordUtil;
import com.baohc.core.utils.TokenKit;
import com.google.gson.Gson;

public class AuthenticationController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AuthenticationController.class);
	
	private AuthenticationService authN;
	private UserTokenService userTokenService;
	private UserService userService;
	public AuthenticationController() {
		authN = new AuthenticationService();
		userTokenService = UserTokenServiceImpl.getInstance();
		userService = UserServiceImpl.getInstance();
	}
	
	public void doGetLogin(HttpServletRequest request , HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			if (authN.isAuthenticated(request)) {
				String redirectUrl = determineRedirectUrl(request);
				LOGGER.debug("Path đã xác thực: " + request.getRequestURI());
				response.sendRedirect(redirectUrl);
				return;
			}
			// Sinh CSRF Token trong session và request bên form
			String csrfToken = CSRFTokenUtil.generateToken(request);
			request.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, csrfToken);
			
			request.getRequestDispatcher(PageConfig.LOGIN).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void doPostLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			String identifier = request.getParameter("identifier");
			String password = request.getParameter("password");
			if (identifier == null || identifier.trim().isEmpty() || password == null || password.trim().isEmpty()) {
				request.setAttribute("error", "Tên đăng nhập và mật khẩu rỗng");
				return;
			}
			// Kiểm tra số lần đăng nhập sai
			if (isRateLimited(request)) {
				handelRateLimited(request, response, identifier);
				return;
			}
			
			if (!CSRFTokenUtil.validateToken(request)) {
				handleCSRFError(request, response, identifier);
				return;
			}
			
			UserDTO user = authN.authenticate(identifier, password, request, response);
			if (user == null) {
				request.getRequestDispatcher(PageConfig.LOGIN).forward(request, response);
				return;
			}
			String redirectUrl = determineRedirectUrl(request);
			UserDTO userSession = authN.getUserCurrent(request);
			LOGGER.debug("GET USER FROM SESSION: " + userSession);
			HttpSession session = request.getSession(false);
			session.setAttribute("USER_ACC", userSession);
			response.sendRedirect(redirectUrl);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void doGetLogout(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException , IOException{
		try {
			authN.logout(request, response);
			response.sendRedirect(request.getContextPath() + "/auth/login?logout=true");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/login?logout=true");
		}
	}
	
	public void doGetRegister(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		try {
			if (authN.isAuthenticated(request)) {
				String redirectUrl = determineRedirectUrl(request);
				LOGGER.debug("Path đã xác thực: " + request.getRequestURI());
				response.sendRedirect(redirectUrl);
				return;
			}
			
			String csrfToken = CSRFTokenUtil.generateToken(request);
			request.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, csrfToken);
			
			request.getRequestDispatcher(PageConfig.REGISTER).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void doPostRegister(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
	
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("passwordCheck");
			String fullname = request.getParameter("fullname");
			String birthDate = request.getParameter("birthDate");
			
			if (!CSRFTokenUtil.validateToken(request)) {
				handleCSRFError(request, response, username);
				return;
			}
			
			UserDTO userDeliveried = new UserDTO();
			
			userDeliveried.setUsername(username);
			userDeliveried.setEmail(email);
			userDeliveried.setPassword(password);
			userDeliveried.setFullname(fullname);
			
			HttpSession session = request.getSession(true);
			session.setAttribute("userDeliveried", userDeliveried);
			session.setAttribute("userDeliveried_confirmPassword", confirmPassword);
			session.setAttribute("userDeliveried_birthDate", birthDate);
			
			response.sendRedirect(request.getContextPath() + "/verify/email?action=otp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/auth/register");
		}
	}
	
	public void doGetForgotPassword(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		try {
			String csrfToken = CSRFTokenUtil.generateToken(request);
			request.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, csrfToken);
			
			HttpSession session = request.getSession(true);
			String user_id = request.getParameter("userId");
			String rawToken = request.getParameter("token");
			if (user_id != null && rawToken != null) {
				String salt = userTokenService.getSaltByUserId(user_id);
				String hasedToken = TokenKit.hashSHA256(rawToken, salt);
				UserTokenDTO token = userTokenService.findValidToken(user_id, hasedToken);
			
				if (token != null) {
					userTokenService.maskUsed(token.getId());
					session.setAttribute("user_id", user_id);
					session.setAttribute("token_id", token.getId());
					session.setAttribute("token_IsValid", true);
					
					System.out.println("Token thành công");
					session.setAttribute("msgSuccessToken", "Email đã xác thực thành công.");
					request.getRequestDispatcher(PageConfig.FORGOT_PASSWORD).forward(request, response);
					return;
				}
				else {
					System.out.println("Token không hợp lệ hoặc đã hết hạn");
					session.setAttribute("token_IsValid", false);
					session.setAttribute("msgErrorToken", "Email đã xác thực không thành công. Đã hết hạn xác thực!!!");
					request.getRequestDispatcher(PageConfig.FORGOT_PASSWORD).forward(request, response);
					return;
				}
			}
			request.getRequestDispatcher(PageConfig.FORGOT_PASSWORD).forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void doPostForgotPassword(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		try {
			if (!CSRFTokenUtil.validateToken(request)) {
				resp.put("status", "error");
				resp.put("message", "Invalid request. Please try again.");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			HttpSession session = request.getSession();
			String user_id = request.getParameter("userid");
			//int token_id = Integer.parseInt(request.getParameter("token_id"));
			String new_pass = request.getParameter("password");
			
			if (new_pass == null || new_pass.isEmpty()) {
				resp.put("status", "error");
				resp.put("message", "Password rỗng. Kiểm tra lại password");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			new_pass = PasswordUtil.hashPasswordArgon(new_pass);
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
			e.printStackTrace();
		}
	}
	
	/**
	 * Xử lý lỗi CSRF Token
	 * @param request
	 * @param response
	 * @param identifier
	 * @throws ServletException
	 * @throws IOException
	 */
	private void handleCSRFError(HttpServletRequest request, HttpServletResponse response, String identifier) 
		throws ServletException, IOException {
		String csrfToken = CSRFTokenUtil.generateToken(request);
		request.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, csrfToken);
		request.setAttribute("error", "Invalid request. Please try again!");
		request.setAttribute("identifier", identifier);
		request.getRequestDispatcher(PageConfig.LOGIN).forward(request, response);
	}

	/**
	 * Hàm xử lý nếu người dùng nhập sai login quá số lần quy định
	 * @param request
	 * @param response
	 * @param identifier 
	 * @throws ServletException
	 * @throws IOException
	 */
	private void handelRateLimited(HttpServletRequest request, HttpServletResponse response, String identifier)
		throws ServletException, IOException {
		// Tạo lại CSRT Token
		String csrfToken = CSRFTokenUtil.generateToken(request);
		request.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, csrfToken);
		//request.setAttribute("error", "Bạn đã đăng nhập sai quá 5 lần. Vui lòng đợi  trong  3 phút");
		request.setAttribute("RateLimitedTimeOut", SecurityConfig.RATE_LIMIT_WINDOW_MINUTES * 60 * 1000);
		request.setAttribute("identifier", identifier);
		request.getRequestDispatcher(PageConfig.LOGIN).forward(request, response);
	}

	/**
	 * Hàm kiểm tra xem người dùng có login sai quá số lần qui định hay không
	 * @param request
	 * @return
	 */
	private boolean isRateLimited(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		
		// Get current attempt count
		Integer attemptCount = (Integer)session.getAttribute("loginAttempts");
		Long lastAttemptTime = (Long)session.getAttribute("lastAttemptTime");
		
		if (attemptCount == null) {
			attemptCount = 0;
		}
		
		Long currentTime = System.currentTimeMillis();
		
		// Reset counter nếu vượt quá time window
		if (lastAttemptTime != null && (currentTime - lastAttemptTime) > SecurityConfig.RATE_LIMIT_WINDOW_MINUTES * 60 * 1000) {
			attemptCount = 0;
		}
		
		// Kiểm tra rate limiting
		if (attemptCount >= SecurityConfig.RATE_LIMIT_LOGIN_ATTEMPTS) {
			request.setAttribute("loginTimeout", SecurityConfig.RATE_LIMIT_WINDOW_MINUTES * 60 * 1000);
			return true;
		}
		
		attemptCount++;
		session.setAttribute("loginAttempts", attemptCount);
		session.setAttribute("lastAttemptTime", currentTime);
		
		return false;
	}

	/**
	 * Kiểm tra đường dẫn người dùng định vào trước lúc login
	 * nếu đường dẫn thỏa thì redirect đến đường dẫn đó
	 * @param request
	 * @return
	 */
	private String determineRedirectUrl(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String originalUrl = (String)session.getAttribute("originalUrl");
		if (originalUrl != null && !originalUrl.isEmpty()) {
			session.removeAttribute("originalUrl");
			if (isValidRedirect(originalUrl, request)) {
				LOGGER.debug("Redirecting to original URL: " + originalUrl);
				return originalUrl;
			}
		}
		// Nếu không có originalUrl -> kiểm tra role
		UserDTO user = authN.getUserCurrent(request);
		System.out.println("USER FROM SESSION: " + user);
		if (user != null) {
			if (user.hasRole("ADMIN")) {
				System.out.println("Chuyển hướng đến /admin");
				return request.getContextPath() + "/admin";
			} else if (user.hasRole("MODERATOR")) {
				System.out.println("Chuyển hướng đến /");
				return request.getContextPath() + "/admin";
			} else {
				System.out.println("Chuyển hướng đến /dashboard");
				return request.getContextPath() + "/";
			}
			
		}
		// Default
		return request.getContextPath() + "/";
	}

	private boolean isValidRedirect(String url, HttpServletRequest request) {
		if (url == null || url.trim().isEmpty())
			return false;
		if (url.startsWith("http://") || url.startsWith("https://") || url.startsWith("//") || url.startsWith(":")) {
			try {
				URI uri = new URI(url);
				String requestDomain = request.getServerName();
				if (!uri.getHost().equals(requestDomain) && !uri.getHost().endsWith("." + requestDomain)) {
					return false;
				}
			} catch (URISyntaxException e) {
				return false;
			}
			if (url.contains("\r") || url.contains("\n") || url.contains("%0d") || url.contains("%0a")) {
				return false;
			}
		}

		return true;
	}
}
