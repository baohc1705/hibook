package com.baohc.core.router;

import java.util.HashMap;

public class Router {
	private static HashMap<String, RouteModel> httpGetRouteList;
	private static HashMap<String, RouteModel> httpPostRouteList;
	private static HashMap<String, RouteModel> httpPutRouteList;
	private static HashMap<String, RouteModel> httpPatchRouteList;
	private static HashMap<String, RouteModel> httpDeleteRouteList;
	
	public Router() {
		initRouteList();
		System.out.println("Router: [Khởi tạo danh sách các route]" );
	}

	private void initRouteList() {
		if (httpGetRouteList == null)
			httpGetRouteList = new HashMap<String, RouteModel>();
		
		if (httpPostRouteList == null) 
			httpPostRouteList = new HashMap<String, RouteModel>();
		
		if (httpPutRouteList == null) 
			httpPutRouteList = new HashMap<String, RouteModel>();
		
		if (httpPatchRouteList == null)
			httpPatchRouteList = new HashMap<String, RouteModel>();
		
		if (httpDeleteRouteList == null )
			httpDeleteRouteList = new HashMap<String, RouteModel>();	
	}
	
	public static void get(String url, Object controller, String method) {
		httpGetRouteList.put(url, new RouteModel(controller, method));
	}
	
	public static void post(String url, Object controller, String method) {
		httpPostRouteList.put(url, new RouteModel(controller, method));
	}
	
	public static void put(String url, Object controller, String method) {
		httpPutRouteList.put(url, new RouteModel(controller, method));
	}
	
	public static void patch(String url, Object controller, String method) {
		httpPatchRouteList.put(url, new RouteModel(controller, method));
	}
	
	public static void delete(String url, Object controller, String method) {
		httpDeleteRouteList.put(url, new RouteModel(controller, method));
	}
	
	public static HashMap<String, HashMap<String, RouteModel>> getAllRouteList() {
		HashMap<String, HashMap<String, RouteModel>> result = new HashMap<String, HashMap<String,RouteModel>>();
		result.put("GET", httpGetRouteList);
		result.put("POST", httpPostRouteList);
		result.put("PUT", httpPutRouteList);
		result.put("PATCH", httpPatchRouteList);
		result.put("DELETE", httpDeleteRouteList);
		return result;
	}
 }
