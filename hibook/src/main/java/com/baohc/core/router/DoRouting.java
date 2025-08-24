package com.baohc.core.router;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baohc.core.SystemLoader;

public class DoRouting {
	private static HashMap<String, HashMap<String, RouteModel>> routeList;
	
	public DoRouting() {
		routeList =(HashMap<String, HashMap<String,RouteModel>>) Router.getAllRouteList();
		System.out.println("=======DoRouting: Register Routes=======");
		for(Map.Entry<String, HashMap<String, RouteModel>> item : routeList.entrySet()) {
			String httpMethod = item.getKey();
			HashMap<String, RouteModel> routeModel = item.getValue();
			System.out.println("HTTP method: " + httpMethod);
			for (Map.Entry<String, RouteModel> itemRoute : routeModel.entrySet()) {
				System.out.println("["+itemRoute.getKey()+ " mapping: " + itemRoute.getValue() + "]");
			}
		}
		System.out.println("========================================");
	}
	
	//Ví dụ trong routeList:("GET", httpGetRouteList("/login", RouteModel[LoginController, "doLogin"]))
	
	public void start(String url, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[DoRouting]Địa chỉ cần map: " + url); 				// url: /login
		String requestMethod = this.getRequestMethod(request);					// GET
		System.out.println("[DoRouting]Phương thức http: " + requestMethod);
		RouteModel routeModel = routeList.get(requestMethod).get(url); 			// RouteModel[LoginController, "doLogin"]
//		System.out.println("[DoRouting]RouteModel mapping: " + routeModel);
		
		// Truyền sang loadClass để thực thi
		this.loadClass(routeModel, (HttpServletRequest)request , (HttpServletResponse)response);
	}

	private void loadClass(RouteModel routeModel, HttpServletRequest request, HttpServletResponse response) {
		try {
//			System.out.println("[DoRouting:loadClass] RouteModel: " + routeModel);
			
			Method method = routeModel.getController().getClass().getDeclaredMethod(routeModel.getMethod(), HttpServletRequest.class, HttpServletResponse.class);
			
			// ==> method: doLogin
			System.out.println("[DoRouting:getMethod] " + method.getName());
			
			Object[] argument = new Object[2];
			argument[0] = request;
			argument[1] = response;
			method.invoke(routeModel.getController(), argument);
			
		} catch (Exception e) {
			Logger.getLogger(SystemLoader.class.getName()).log(Level.SEVERE, null, e);
		}
	}

	private String getRequestMethod(HttpServletRequest request) {
		return request.getMethod();
		
	}
	
	public static boolean hasRoute(String requestMethod, String url) {
		return routeList.containsKey(requestMethod) && routeList.get(requestMethod).containsKey(url);
	}
}
