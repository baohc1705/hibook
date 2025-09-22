package com.baohc.app.service.auth;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baohc.app.model.UserDTO;

public class AuthorizationService {
	private static final Logger LOGGER = LoggerFactory.getLogger(AuthorizationService.class);
	
	private AuthenticationService authN;
	public AuthorizationService() {
		authN = new AuthenticationService();
	}

	public boolean hasRole(HttpServletRequest request, String requiredRole) {
		UserDTO user = authN.getUserCurrent(request);
		if (user == null) return false;
		boolean hasRole = user.hasRole(requiredRole);
		if (!hasRole)
			LOGGER.debug("Tài khoản không có role yêu cầu " + requiredRole);
		return hasRole;
	}
	
	public boolean hasAnyRole(HttpServletRequest request, String[] roles) {
		UserDTO user = authN.getUserCurrent(request);
		if (user == null) return false;
		boolean hasAnyRole = user.hasAnyRole(roles);
		if (!hasAnyRole) 
			LOGGER.error("User không có quyền: " + roles);
		return hasAnyRole;
	}
	
}
