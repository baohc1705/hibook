package com.baohc.core.utils;

import java.security.SecureRandom;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baohc.app.config.SecurityConfig;

public class CSRFTokenUtil {
	private static final SecureRandom RANDOM = new SecureRandom(); 
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CSRFTokenUtil.class);
	
	private CSRFTokenUtil() {throw new AssertionError("CSRFTokenManager cannot be instantiated");}
	
	/**
	 * Sinh ra csrf token với Base64
	 * @param request
	 * @return
	 */
	public static String generateToken(HttpServletRequest request) {
		if (!SecurityConfig.CSRF_PROTECTION_ENABLED) {
			return "disable";
		}
		
		String token = generateSecureToken();
		
		HttpSession  session = request.getSession(true);
		session.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, token);
		
		return token;
	}

	private static String generateSecureToken() {
		byte[] randomBytes = new byte[SecurityConfig.CSRF_TOKEN_LENGTH];
		RANDOM.nextBytes(randomBytes);
		return Base64.getUrlEncoder().withoutPadding().encodeToString(randomBytes);
	}
	
	/**
	 * Lấy csrf token từ session
	 * @param request
	 * @return
	 */
	public static String getToken(HttpServletRequest request) {
		HttpSession  session = request.getSession(false);
		if (session == null) {
			return null;
		}
		
		return (String)session.getAttribute(SecurityConfig.CSRF_TOKEN_NAME);
	}
	
	public static boolean validateToken(HttpServletRequest request) {
	    if (!SecurityConfig.CSRF_PROTECTION_ENABLED) 
	        return false;

	    String sessionToken = getToken(request);
	    String requestToken = request.getParameter(SecurityConfig.CSRF_TOKEN_NAME);
	    String csrfHeader = request.getHeader("X-CSRF-Token");

	    if (sessionToken == null) {
	        LOGGER.debug("CSRF validation failed: No token in session");
	        return false;
	    }

	    if ((requestToken == null || requestToken.isEmpty()) 
	        && (csrfHeader == null || csrfHeader.isEmpty())) {
	        LOGGER.debug("CSRF validation failed: No token in request");
	        return false;
	    }

	    boolean isValid = false;
	    if (requestToken != null) {
	        isValid = constantTimeEquals(sessionToken, requestToken);
	    }
	    if (!isValid && csrfHeader != null) {
	        isValid = constantTimeEquals(sessionToken, csrfHeader);
	    }

	    if (!isValid) {
	        LOGGER.debug("CSRF validation failed: Token mismatch - Session: " + sessionToken);
	    } else {
	        LOGGER.debug("CSRF validation successful for token: " + sessionToken);
	    }

	    return isValid;
	}

	
	/**
	 * Sinh token mới và xóa token cũ
	 * @param request
	 * @return
	 */
	public static String refeshToken(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute(SecurityConfig.CSRF_TOKEN_NAME);
		}

		return generateToken(request);
	}
	
	/**
	 * Kiểm tra nếu có csrf token trong session
	 * @param request
	 * @return
	 */
	public static boolean hasToken(HttpServletRequest request) {
		return getToken(request) != null;
	}
	/*
	 * Generate HTML hidden input for CSRF token
	 */
	public static String generateHiddenInput(HttpServletRequest request) {
		String token = getToken(request);
		if (token == null) {
			token = generateToken(request);
		}

		return String.format("<input type=\"hidden\" name=\"%s\" value=\"%s\">", SecurityConfig.CSRF_TOKEN_NAME,
				escapeHtml(token));
	}
	private static String escapeHtml(String input) {
		if (input == null)
			return "";

		return input.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;")
				.replace("'", "&#x27;");
	}
	/*
	 * Get CSRF token for AJAX requests
	 */
	public static String getTokenForAjax(HttpServletRequest request) {
		String token = getToken(request);
		if (token == null) {
			token = generateToken(request);
		}
		return token;
	}
	/*
	 * Validate CSRF token from header (for AJAX requests)
	 */
	public static boolean validateTokenFromHeader(HttpServletRequest request, String headerName) {
		if (!SecurityConfig.CSRF_PROTECTION_ENABLED) {
			return true;
		}

		String sessionToken = getToken(request);
		String headerToken = request.getHeader(headerName);

		if (sessionToken == null || headerToken == null) {
			System.err.println("CSRF header validation failed: Missing token");
			return false;
		}

		boolean isValid = constantTimeEquals(sessionToken, headerToken);

		if (!isValid) {
			System.err.println("CSRF header validation failed: Token mismatch");
		}

		return isValid;
	}
	private static boolean constantTimeEquals(String a, String b) {
		if (a == null || b == null)
			return false;
		if (a.length() != b.length())
			return false;

		int result = 0;
		for (int i = 0; i < a.length(); i++) {
			result |= a.charAt(i) ^ b.charAt(i);
		}

		return result == 0;
	}
	
}
