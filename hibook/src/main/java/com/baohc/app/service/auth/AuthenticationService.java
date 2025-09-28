package com.baohc.app.service.auth;

import java.sql.Date;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baohc.app.config.SecurityConfig;
import com.baohc.app.dao.user.UserDAO;
import com.baohc.app.dao.user.UserDAOImpl;
import com.baohc.app.model.RoleDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.service.user.UserSessionService;
import com.baohc.core.utils.PasswordUtil;
import com.baohc.core.utils.StringKit;

public class AuthenticationService {
	private static final Logger LOGGER = LoggerFactory.getLogger(AuthenticationService.class);
	
	private UserDAO userDAO;
	private UserSessionService sessionService;
	public AuthenticationService() {
		userDAO = UserDAOImpl.getInstance();
		sessionService = new UserSessionService();
	}

	public boolean isAuthenticated(HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			if (session == null) {
				return false;
			}
			String dbSessionId = (String) session.getAttribute(SecurityConfig.ATTR_SESSIONID_NAME);
			
			if (dbSessionId == null) {
				LOGGER.debug("DBSession ID not found!");
				return false;
			}
			
//			@SuppressWarnings("unchecked")
//			Set<RoleDTO> roles = (Set<RoleDTO>)session.getAttribute(SecurityConfig.ATTR_SESSIONID_USERROLES_NAME);
//			if (roles == null || roles.isEmpty()) {
//				LOGGER.debug("User roles not found in DBSessionId");
//				return false;
//			}
			
			boolean isValid = sessionService.isValidSession(dbSessionId, request);
			if (!isValid) {
				LOGGER.debug("Session not found in DB: " + dbSessionId);
				// Giải phóng luôn session
				session.invalidate();
			}
			
			return isValid;
			
		} catch (Exception e) {
			LOGGER.error("Error checking authenticated for session");
			return false;
		}
		
	}

	public UserDTO authenticate(String identifier, String password, HttpServletRequest request,
			HttpServletResponse response) {
		String clientIp = getClientIpAddress(request);
		try {
			identifier = identifier.trim().toLowerCase();
			
			boolean isEmail = identifier.matches(SecurityConfig.EMAIL_PATTERN);
			UserDTO user = null;
			if (isEmail) {
				user = userDAO.findByEmail(identifier);
			} else {
				user = userDAO.findByUsername(identifier);
			}
			if (user != null) {
				// Kiểm tra xem tài khoản có bị khóa không
				if (user.isAccount_locked()) {
					request.setAttribute("error", "Tài khoản của bạn đã bị khóa!. Vui lòng liên hệ admin");
					return null;
				}
				
				// Kiểm tra password
				boolean isValid = PasswordUtil.verifyPasswordArgon(password, user.getPassword());
				
				if (!isValid) {
					userDAO.updateFailedLoginAttempt(user.getUsername());
					request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không hợp lệ!");
					return null;
				}
				else {
					sessionService.createSession(user, request, response);
					userDAO.resetFailedLoginAttempt(user.getUsername());
					request.setAttribute("error", "Đăng nhập thành công");
					return user;
				}
			}
			request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không hợp lệ!");
			return null;
		} catch (Exception e) {
			LOGGER.error("BUG authenticating user account\n"+e.getMessage());
			return null;
		}
	}

	

	private String getClientIpAddress(HttpServletRequest request) {
		String xForwardedFor = request.getHeader("X-Forwarded-For");
		if (xForwardedFor != null && !xForwardedFor.isEmpty()) {
			return xForwardedFor.split(",")[0].trim();
		}

		String xRealIp = request.getHeader("X-Real-IP");
		if (xRealIp != null && !xRealIp.isEmpty()) {
			return xRealIp;
		}

		return request.getRemoteAddr();
	}

	public UserDTO getUserCurrent(HttpServletRequest request) {
		try {
			HttpSession session = request.getSession(false);
			String dbSessionId = (String)session.getAttribute(SecurityConfig.ATTR_SESSIONID_NAME);
			if(dbSessionId == null)
				 return null;
			return sessionService.getUserFromSession(dbSessionId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public void logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			boolean isLogout = sessionService.logout(request, response);
			if (isLogout) {
				LOGGER.debug("Logout successful");
			} else {
				LOGGER.debug("logout failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public boolean regiter(String username, String email, String password, String confirmPassword, String fullname,
			String birthDate, HttpServletRequest request, String mess) {
		boolean validation = validateRegistrationInput(username, email, password, confirmPassword, fullname, birthDate);
		if (!validation) {
			return false;
		}
		username = username.trim().toLowerCase();
		email = email.trim().toLowerCase();
		try {
			if (userDAO.findByUsername(username) != null) {
				mess =  "Tên đăng nhập đã tồn tại";
				return false;
			}
			
			if (userDAO.findByEmail(email) != null) {
				mess =  "Email đã tồn tại";
				return false;
			}
			
			UserDTO newUser = new UserDTO();
			newUser.setId(StringKit.RandomId());
			newUser.setUsername(username);
			newUser.setEmail(email);
			newUser.setFullname(fullname);
			newUser.setBirthDate(Date.valueOf(birthDate));
			
			int created = userDAO.insertAccount(newUser, password);
			if (created == 1) {
				mess = "Đã tạo tài khoản thành công";
				return true;
			} else {
				mess =  "Tạo tài khoản thất bại";
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	private boolean validateRegistrationInput(String username, String email, String password, String confirmPassword,
			String fullname, String birthDate) {
		if (username == null || username.trim().isEmpty()) {
			System.err.println("Username is required");
			return false;
		}

		if (!username.matches(SecurityConfig.USERNAME_PATTERN)) {
			System.err.println("Username must be 3-50 characters and contain only letters, numbers, and underscores");
			return false;
		}

		if (email == null || email.trim().isEmpty()) {
			System.err.println("Email is required");
			return false;
		}

		if (!email.matches(SecurityConfig.EMAIL_PATTERN)) {
			System.err.println("Invalid email format");
			return false;
		}

		if (password == null || password.isEmpty()) {
			System.err.println("Password is required");
			return false;
		}

		if (!password.equals(confirmPassword)) {
			System.err.println("Passwords do not match");
			return false;
		}
		
		if (fullname == null || fullname.trim().isEmpty()) {
			System.err.println("Fullname is required");
			return false;
		}
		
		if (birthDate == null) {
			System.err.println("Birth Date is required");
			return false;
		}
		return true;
	}
}
