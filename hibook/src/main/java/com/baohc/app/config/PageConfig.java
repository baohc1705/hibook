package com.baohc.app.config;

public class PageConfig {
	private PageConfig() {}
	// Authentication pages
	public static final String LOGIN = "/WEB-INF/views/auth/login.jsp";
	public static final String REGISTER = "/WEB-INF/views/auth/register.jsp";
	public static final String VERIFY_ACCOUNT= "/WEB-INF/views/auth/verifyAccount.jsp";
	public static final String FORGOT_PASSWORD = "/WEB-INF/views/auth/forgotPassword.jsp";
	
	//Admin Dashboard
	public static final String ADMIN_INDEX= "/WEB-INF/views/admin/index.jsp";
	public static final String ADMIN_BOOK= "/WEB-INF/views/admin/book.jsp";
	public static final String ADMIN_ADD_BOOK = "/WEB-INF/views/admin/book/AddBook.jsp";
	public static final String ADMIN_ALL_USER = "/WEB-INF/views/admin/user/index.jsp";
	public static final String ADMIN_ROLE = "/WEB-INF/views/admin/user/Role.jsp";
}
