package com.baohc.core.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.baohc.core.router.DoRouting;
@WebFilter("/*")
public class RequestFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest)request;
			String path = req.getRequestURI().substring(req.getContextPath().length());
			if (DoRouting.hasRoute(req.getMethod(), path)) {
//				System.out.println("[Filter:doFilter] tìm thấy route (" + req.getMethod() + "," + path + ")");
//				System.out.println("[Filter:doFilter] thêm app vào gửi đên FrontController \n (/app" + path + ")");
				request.getRequestDispatcher("/app"+path).forward(request, response);
			}
			
			else {
				System.out.println("[Filter:doFilter] bỏ qua (" + req.getMethod() + "," + path + ")");
				chain.doFilter(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[Filter:doFilter] Lỗi");
		}
		
	}
}
