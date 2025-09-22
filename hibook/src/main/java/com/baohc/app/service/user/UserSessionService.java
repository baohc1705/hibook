package com.baohc.app.service.user;

import java.security.SecureRandom;
import java.sql.Timestamp;
import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baohc.app.config.SecurityConfig;
import com.baohc.app.dao.user.UserSessionDAO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.model.UserSessionDTO;

public class UserSessionService {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserSessionService.class);
	public UserSessionService() {}
	/**
	 * Kiểm tra session Id có trùng khớp session id trong db
	 * 
	 * @param dbSessionId
	 * @param request
	 * @return
	 */
	public boolean isValidSession(String dbSessionId, HttpServletRequest request) {
		if (dbSessionId == null || dbSessionId.trim().isEmpty()) {
			return false;
		}

		UserSessionDTO userSession = UserSessionDAO.getIntance().getUserSessionById(dbSessionId);

		if (userSession != null) {
			// Kiểm tra xem user session có hoạt động không
			if (!userSession.isActive()) {
				LOGGER.info("DBSession not active");
				return false;
			}

			// Kiểm tra session còn han không
			Timestamp expireAt = userSession.getExpiresAt();
			if (expireAt.before(new Timestamp(System.currentTimeMillis()))) {
				LOGGER.info("DBSession expired");
				// Loại bỏ session
				UserSessionDAO.getIntance().invalidateSession(userSession.getId());

				return false;
			}

			// Kiểm tra địa chỉ ip
			String storedIp = userSession.getIpAddress();
			String currentIp = getClientIpAddress(request);

			if (!storedIp.equals(currentIp)) {
				LOGGER.info("Possible session hijacking detected - SessionID:" + dbSessionId + ", StoredIP: " + storedIp
						+ ", CurrentIP: " + currentIp);
				UserSessionDAO.getIntance().invalidateSession(userSession.getId());
				return false;
			}

			UserSessionDAO.getIntance().updateSessionActivity(userSession.getId());
			return true;
		}

		return false;
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

	public void createSession(UserDTO user, HttpServletRequest request, HttpServletResponse response) {
		if (user == null) {
			LOGGER.debug("User not found!");
			return;
		}

		HttpSession oldSession = request.getSession(false);
		if (oldSession != null) {
			oldSession.invalidate();
		}

		HttpSession newSession = request.getSession(true);
		String dbSessionId = generateSecureSessionId();
		String ipAddress = getClientIpAddress(request);
		String userAgent = request.getHeader("User-Agent");
		String user_id = user.getId();
		try {
			int insert = UserSessionDAO.getIntance().insert(dbSessionId, user_id, ipAddress, userAgent);

			if (insert == 1) {
				newSession.setAttribute(SecurityConfig.ATTR_SESSIONID_USERID_NAME, user_id);
				newSession.setAttribute(SecurityConfig.ATTR_SESSIONID_USERNAME, user.getUsername());
				newSession.setAttribute(SecurityConfig.ATTR_SESSIONID_USERROLES_NAME, user.getRoles());
				newSession.setAttribute(SecurityConfig.ATTR_SESSIONID_NAME, dbSessionId);
				newSession.setAttribute(SecurityConfig.ATTR_SESSIONID_CREATION_TIME_NAME, System.currentTimeMillis());
				newSession.setMaxInactiveInterval(SecurityConfig.SESSION_TIMEOUT_MINUTES * 60);

				configureSessionCookie(response, dbSessionId);
				LOGGER.debug("DBSESSIONID: " + dbSessionId + "FOR HTTPSESSION: " + newSession.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void configureSessionCookie(HttpServletResponse response, String dbSessionId) {
		Cookie custom = new Cookie(SecurityConfig.SECURE_COOKIE_NAME, dbSessionId);
		custom.setPath("/");
		custom.setHttpOnly(true);
		custom.setSecure(false);
		custom.setMaxAge(SecurityConfig.SESSION_TIMEOUT_MINUTES * 60);
		response.addCookie(custom);

	}

	private String generateSecureSessionId() {
		byte[] randomBytes = new byte[32];
		new SecureRandom().nextBytes(randomBytes);
		return Base64.getUrlEncoder().withoutPadding().encodeToString(randomBytes);
	}
	public UserDTO getUserFromSession(String dbSessionId) {
		return UserSessionDAO.getIntance().getUserFromSession(dbSessionId);
	}
	public boolean logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);
			if (session == null) return false;
			String dbSessionId = (String)session.getAttribute(SecurityConfig.ATTR_SESSIONID_NAME);
			
			if (dbSessionId != null) {
				UserSessionDAO.getIntance().invalidateSession(dbSessionId);
			}
			
			session.invalidate();
			
			clearSessionCookies(response);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	private void clearSessionCookies(HttpServletResponse response) {
		Cookie jsessionCookie = new Cookie("JSESSIONID", "");
		jsessionCookie.setPath("/");
		jsessionCookie.setMaxAge(0);
		jsessionCookie.setHttpOnly(true);
		response.addCookie(jsessionCookie);

		// Clear custom session cookie if exists
		Cookie customCookie = new Cookie(SecurityConfig.SECURE_COOKIE_NAME, "");
		customCookie.setPath("/");
		customCookie.setMaxAge(0);
		customCookie.setHttpOnly(true);
		response.addCookie(customCookie);
		
	}
	
}
