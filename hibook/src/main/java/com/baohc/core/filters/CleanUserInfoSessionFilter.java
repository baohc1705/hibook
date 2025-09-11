package com.baohc.core.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *	Nếu các request KHÔNG bắt đầu với /user-infomation và /user/show-info 
 *	thì sẽ xóa session của user về user infomation
 */
@WebFilter("/*")
public class CleanUserInfoSessionFilter extends HttpFilter implements Filter {       
	private static final long serialVersionUID = 1L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session =  req.getSession(false);
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath(); 
		String relativeUri = uri.substring(contextPath.length());
		if (session != null) {
			if (!relativeUri.startsWith("/user/show-info") && !relativeUri.startsWith("/user-infomation")) {
				session.removeAttribute("bills");
				session.removeAttribute("mapCoverPhotoOrder");
				session.removeAttribute("mapBillDetails");
			}
		}
		
		chain.doFilter(request, response);
		
	}

}
