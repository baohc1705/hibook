package com.baohc.app.router;

import com.baohc.app.controller.WelcomeController;
import com.baohc.app.controller.admin.AdminController;
import com.baohc.app.controller.admin.book.AdminBookController;
import com.baohc.app.controller.auth.AuthController;
import com.baohc.app.controller.auth.VerificationController;
import com.baohc.app.controller.user.UserController;
import com.baohc.core.router.BaseRouter;
import com.baohc.core.router.Router;

public class RegisterRouteController implements BaseRouter{
	
	@Override
	public void RegisterRoute() {
		// Home page
		Router.get("/", new WelcomeController(), "welcome");
		
		// Authentication
		Router.get("/login", new AuthController(), "showLogin");
		Router.post("/login", new AuthController(), "doLogin");	
		
		Router.get("/logout", new AuthController(), "doLogout");
		
		Router.get("/register", new AuthController(), "showRegister");
		Router.post("/register", new AuthController(), "doRegister");
		
		Router.get("/verify-account", new VerificationController(), "showVerifyAccount");
		Router.post("/verify-account", new VerificationController(), "doVerifyAccount");
		
		Router.post("/verify-account/send-otp-mail", new VerificationController(), "sendOtpMail");
		
		Router.get("/forgot-password/show", new AuthController(), "showForgotPassword");
		
		Router.get("/forgot-password", new AuthController(), "doGetForgotPassword");
		Router.post("/forgot-password", new AuthController(), "doForgotPassword");
		
		Router.post("/forgot-password/send-token-email", new VerificationController(), "sendTokenMail");
		
//		Router.get("/user/show-info", new UserController(), "showUserInfo");
//		Router.post("/user/edit-info", new UserController(), "doEditUserInfo");
		
		Router.post("/verify-account/verify-otp-email", new VerificationController(), "updateEmailByOTP");
		
		//==========AMDIN===============
		Router.get("/admin", new AdminController() , "showDashboard");
		
		
		Router.get("/admin/book", new AdminBookController(), "showBooks");
		
		Router.get("/admin/book/show", new AdminBookController(), "doPaginationBook");
		
		Router.get("/admin/book/add",new AdminBookController(), "showAddBook");
		Router.post("/admin/book/add", new AdminBookController(), "doAddBook");
		
		Router.get("/admin/book/edit", new AdminBookController(), "showEditBook");
		Router.post("/admin/book/edit", new AdminBookController(), "doEditBook");
		
		Router.post("/admin/book/remove", new AdminBookController(), "doRemoveBook");
	}
}
