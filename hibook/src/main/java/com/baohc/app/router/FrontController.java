package com.baohc.app.router;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.core.SystemLoader;

@WebServlet(value = "/app/*", loadOnStartup = 1)
public class FrontController extends HttpServlet{
	@Override
	public void init() throws ServletException {
		SystemLoader loader = new SystemLoader();
		System.out.println("[FrontController:init] Khởi tạo hệ thống");
	}
	
	/*
	 * Nhiệm vụ của FrontController: nhận hết tất cả request đã thông qua filter
	 * request" /app/*. Sau đó tiến hành bỏ "/app" gửi sang doRoute để thực hiện
	 * mapping
	 */
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String path = req.getRequestURI().substring(req.getContextPath().length());
//			System.out.println("[FrontController] path: (" + path + ")" );
//			System.out.println("[FrontController] remove /app: (" + path.substring(4) + ")");
			SystemLoader.getInstance().doRoute(path.substring(4), (HttpServletRequest)req, (HttpServletResponse)resp);
			System.out.println("[FrontController] doRoute thành công");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("[FrontController] Lỗi");
		}
	}
}
