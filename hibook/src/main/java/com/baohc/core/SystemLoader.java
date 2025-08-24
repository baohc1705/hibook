package com.baohc.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.app.router.RegisterRouteController;
import com.baohc.core.router.BaseRouter;
import com.baohc.core.router.DoRouting;
import com.baohc.core.router.Router;

public class SystemLoader {
	private static SystemLoader instance = null;
	private Router router;
	private BaseRouter baseRouter;
	private DoRouting doRouting;
	
	public SystemLoader() {
		if (instance == null) {
			instance = this;
			initSystem();
		}
	}
	
	private void initSystem() {
		// tuân thủ thứ tự để khởi tạo route
		try {
			router = new Router();
			baseRouter = new RegisterRouteController();
			baseRouter.RegisterRoute();
			
			doRouting = new DoRouting();
			System.out.println("=========Hệ thống khởi tạo hoàn tất=========");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("=========Hệ thống khởi tạo trục trặc=========");
		}
	}

	public static synchronized SystemLoader getInstance() {
		if (instance == null) instance = new SystemLoader();
		return instance;
	}
	
	public void doRoute(String url, HttpServletRequest request, HttpServletResponse response) {
		try {
			doRouting.start(url, request, response);
//			System.out.println("[SystemLoader:doRoute] passed, url: " + url);
		} catch (Exception e) {
			e.printStackTrace();
//			System.out.println("[SystemLoader:doRoute] failed, url: " + url);
		}
		
	}
}
