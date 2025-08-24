package com.baohc.core.router;

public class RouteModel {
	
	private final Object controller;
	private final String method;

	public RouteModel(Object controller, String method) {
		super();
		this.controller = controller;
		this.method = method;
	}

	public Object getController() {
		return controller;
	}
	public String getMethod() {
		return method;
	}

	@Override
	public String toString() {
		return "RouteModel [controller=" + controller + ", method=" + method + "]";
	}	
	
	
}
