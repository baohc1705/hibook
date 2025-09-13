package com.baohc.app.router;

import com.baohc.app.controller.WelcomeController;
import com.baohc.app.controller.admin.AdminController;
import com.baohc.app.controller.admin.bill.GetBillController;
import com.baohc.app.controller.admin.bill.BillController;
import com.baohc.app.controller.admin.book.AdminBookController;
import com.baohc.app.controller.admin.book.AdminGetBookController;
import com.baohc.app.controller.auth.AuthController;
import com.baohc.app.controller.auth.VerificationController;
import com.baohc.app.controller.book.GetBooksController;
import com.baohc.app.controller.cart.CartController;
import com.baohc.app.controller.cart.CheckoutController;
import com.baohc.app.controller.user.UserInfomationController;
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
		
		//===USER INFO===
		Router.get("/user-information", new UserInfomationController(), "getSinglePageApplication");
		Router.post("/user-information", new UserInfomationController(), "doTask");
		
		//==========AMDIN===============
		Router.get("/admin", new AdminController() , "showDashboard");
		
		
		Router.get("/admin/book", new AdminBookController(), "showBooks");
		
		Router.get("/admin/book/show", new AdminBookController(), "doPaginationBook");
		
		Router.get("/admin/books/show", new AdminGetBookController(), "getBooksWithFilter");
		
		Router.get("/admin/book/add",new AdminBookController(), "showAddBook");
		Router.post("/admin/book/add", new AdminBookController(), "doAddBook");
		
		Router.get("/admin/book/edit", new AdminBookController(), "showEditBook");
		Router.post("/admin/book/edit", new AdminBookController(), "doEditBook");
		
		Router.post("/admin/book/remove", new AdminBookController(), "doRemoveBook");
		
		Router.get("/admin/bills", new GetBillController(), "getBills");
		Router.post("/admin/bills", new BillController(), "doBills");
		
		//==============USER=================
		Router.get("/books", new GetBooksController(), "getBooks");
		Router.get("/books/view", new GetBooksController(), "getBooksInfo");
		Router.get("/books/view-detail", new GetBooksController(), "showBookDetail");
		
		// ==========CART============
		Router.get("/cart", new CartController(), "getCart");
		Router.post("/cart", new CartController(), "doCart");
		Router.get("/checkout", new CheckoutController(), "getCheckout");
		Router.post("/checkout", new CheckoutController(), "doCheckout");
		
		// ==========VERIFY=========
		
		Router.post("/verify", new VerificationController(), "sendMail");
	}
}
