package com.baohc.core.filters;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baohc.app.config.SecurityConfig;
import com.baohc.app.controller.cart.CartService;
import com.baohc.app.model.CartItem;
import com.baohc.app.service.auth.AuthenticationService;
import com.baohc.app.service.auth.AuthorizationService;

/**
 * Filter kiểm tra authentication tất cả request
 */
@WebFilter("/*")
public class SecurityFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LoggerFactory.getLogger(SecurityFilter.class);
	private AuthenticationService authN;
	private AuthorizationService authO;
	private CartService cartService;
	
	@Override
	public void init() throws ServletException {
		authN = new AuthenticationService();
		authO = new AuthorizationService();
		cartService = new CartService();
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length());
		LOGGER.debug("PATH: " + path);
		try {
			// Bỏ qua các path public không cần authentication
//			if (isPublicUrl(path)) {
//				LOGGER.debug("PUBLIC PATH: " + path);
//				loadCartItem(request);
//				chain.doFilter(request, response);
//				return;
//			}
			
//			if ("POST".equalsIgnoreCase(request.getMethod())) {
//				// Kiểm tra CSRFToken của request POST
//				if (!CSRFTokenUtil.validateToken(request)) {
//					LOGGER.debug("CSRF token validation failed for: " + path);
//					response.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid CSRF token");
//					return;
//				}
//			}
			
//			if (!authN.isAuthenticated(request)) {
//				LOGGER.debug("Path không xác thực: " + path);
//				handelUnauthenticated(request, response, path);
//				return;
//			}
//			
//			if (!isAuthorized(request, path)) {
//				LOGGER.error("DEBUGG: Path không có quyền: " + path);
//				handleUnauthorized(request, response, path);
//				return;
//			}
			
			loadCartItem(request);
			
			chain.doFilter(request, response);
		} catch (Exception e) {
			LOGGER.error("Security filter error: {}", e.getMessage(), e);
            sendInternalError(response, request);
		}
		
	}

	private void loadCartItem(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("itemCount") == null) {
			List<CartItem> cartItems = cartService.getCartItems(request);
			int itemCount = cartService.countCartItem(cartItems);
			session.setAttribute("itemCount", itemCount);
		}
	}

	private void sendInternalError(HttpServletResponse res, HttpServletRequest request) throws IOException {
		res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        res.setContentType("text/html");
        res.getWriter().write("<html><body>" + 
            "<h1>500 - Internal Server Error</h1>" +
            "<p>An error occurred while processing your request.</p>" + 
            "<a href='" + request.getContextPath() + "/'>Back to home</a>" +
            "</body></html>");
		
	}

	private void handleUnauthorized(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		// For regular requests
		response.setStatus(HttpServletResponse.SC_FORBIDDEN);
		response.setContentType("text/html");
		response.getWriter().write(
            "<html><body>" +
            "<h1>403 - Access Denied</h1>" +
            "<p>You don't have permission to access this resource.</p>" +
            "<a href='" + request.getContextPath() + "/'>Back to home</a>" +
            "</body></html>"	
        );
		
	}

	/**
	 * Kiểm tra quyền truy cập của các request
	 * @param request
	 * @param path
	 * @return
	 */
	private boolean isAuthorized(HttpServletRequest request, String path) {
		
		// nếu path trong admin url kiểm tra có role không
		if (isAdminUrl(path)) {
			boolean hasAdmin = authO.hasRole(request, "ADMIN");
			LOGGER.debug("ADMIN url matched. User has ADMIN? " + hasAdmin);
			return hasAdmin;
		}
		
		if (isManageUrl(path)) {
			String[] roles = {"ADMIN", "MANAGE"};
			boolean hasManageOrAdmin = authO.hasAnyRole(request, roles);
			LOGGER.debug("MANAGE url matched. User has MANAGE/ADMIN? ? " + hasManageOrAdmin);
			return hasManageOrAdmin;
		}
		
		if (isUserUrl(path)) {
			LOGGER.debug("DEBUG AUTHZ: USER url matched. User is authenticated");
            return true;
		}
		
		LOGGER.warn("AUTHORIZATION FAILED: No matching URL pattern for {}", path);
		return false;
	}

	private void handelUnauthenticated(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		if ("GET".equalsIgnoreCase(request.getMethod())) {
			String originalUrl = request.getRequestURL().toString();
			String queryString = request.getQueryString();
			if (queryString != null) {
				originalUrl += "?" + queryString;
			}
			HttpSession session = request.getSession(true);
			session.setAttribute("originalUrl", originalUrl);
			LOGGER.debug("OriginalURL unauthenticated: " + originalUrl);
		}
		
		response.sendRedirect(request.getContextPath() + "/auth/login");
	}

	private boolean isPublicUrl(String url) {
		if (url == null) return false;
		return SecurityConfig.PUBLIC_URLS.stream().anyMatch(pattern -> {
			if (pattern.endsWith("/*")) {
				String perfix = pattern.substring(0, pattern.length() - 2);
				return url.startsWith(perfix);
			}
			return url.equals(pattern);
		});
	}
	
	private boolean isAdminUrl(String url) {
		if (url == null) return false;
		return SecurityConfig.ADMIN_URLS.stream().anyMatch(pattern -> {
			if (pattern.endsWith("/*")) {
				String perfix = pattern.substring(0, pattern.length() - 2);
				return url.startsWith(perfix);
			}
			return url.equals(pattern);
		});
	}
	
	public static boolean isManageUrl(String url) {
        if (url == null) return false;
        
        return SecurityConfig.MANAGE_URLS.stream().anyMatch(pattern -> {
            if (pattern.endsWith("/*")) {
                String prefix = pattern.substring(0, pattern.length() - 2);
                return url.startsWith(prefix);
            }
            return url.equals(pattern);
        });
    }
	
	public static boolean isUserUrl(String url) {
        if (url == null) return false;
        return SecurityConfig.USER_URLS.stream().anyMatch(pattern -> {
            if (pattern.endsWith("/*")) {
                String prefix = pattern.substring(0, pattern.length() - 2);
                return url.startsWith(prefix);
            }
            return url.equals(pattern);
        });
    }
}
