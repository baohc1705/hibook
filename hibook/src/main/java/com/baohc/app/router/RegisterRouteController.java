package com.baohc.app.router;

import com.baohc.app.controller.WelcomeController;
import com.baohc.app.controller.admin.AdminController;
import com.baohc.app.controller.admin.bill.GetBillController;
import com.baohc.app.controller.admin.bill.BillController;
import com.baohc.app.controller.admin.book.AdminBookController;
import com.baohc.app.controller.admin.book.AdminGetBookController;
import com.baohc.app.controller.admin.book.BookController;
import com.baohc.app.controller.auth.AuthenticationController;
import com.baohc.app.controller.book.CategoryBookController;
import com.baohc.app.controller.book.GetBooksController;
import com.baohc.app.controller.cart.CartController;
import com.baohc.app.controller.cart.CheckoutController;
import com.baohc.app.controller.user.UserInfomationController;
import com.baohc.app.controller.verify.VerifyController;
import com.baohc.core.router.BaseRouter;
import com.baohc.core.router.Router;

public class RegisterRouteController implements BaseRouter {

	@Override
	public void RegisterRoute() {
		// Home page
		Router.get("/", new WelcomeController(), "welcome");

		// ===USER INFO===
		Router.get("/user-information", new UserInfomationController(), "getSinglePageApplication");
		Router.post("/user-information", new UserInfomationController(), "doTask");

		// ==========AMDIN===============
		Router.get("/admin", new AdminController(), "showDashboard");
		
		Router.get("/admin/book", new BookController(), "doGetBook");
		Router.post("/admin/book", new BookController(), "doPostBook");
		
		Router.get("/admin/book/show", new AdminBookController(), "doPaginationBook");
		Router.get("/admin/books/show", new AdminGetBookController(), "getBooksWithFilter");
		Router.get("/admin/book/add", new AdminBookController(), "showAddBook");
		Router.post("/admin/book/add", new AdminBookController(), "doAddBook");
		Router.get("/admin/book/edit", new AdminBookController(), "showEditBook");
		Router.post("/admin/book/edit", new AdminBookController(), "doEditBook");
		Router.post("/admin/book/remove", new AdminBookController(), "doRemoveBook");
		Router.get("/admin/bills", new GetBillController(), "getBills");
		Router.post("/admin/bills", new BillController(), "doBills");

		// ==============USER=================
		Router.get("/books", new GetBooksController(), "getBooks");
		Router.get("/books/view", new GetBooksController(), "getBooksInfo");
		Router.get("/books/view-detail", new GetBooksController(), "showBookDetail");
		Router.get("/books/category", new CategoryBookController(), "getBooks");

		// ==========CART============
		Router.get("/cart", new CartController(), "getCart");
		Router.post("/cart", new CartController(), "doCart");
		Router.get("/checkout", new CheckoutController(), "getCheckout");
		Router.post("/checkout", new CheckoutController(), "doCheckout");

		// ==========VERIFY========
		Router.post("/verify/email", new VerifyController(), "doPostSendVerificationToEmail");
		Router.get("/verify/email", new VerifyController(), "doGetSendVerificationToEmail");

		// =========AUTHENTICATION=========
		Router.get("/auth/login", new AuthenticationController(), "doGetLogin");
		Router.post("/auth/login", new AuthenticationController(), "doPostLogin");

		Router.get("/auth/logout", new AuthenticationController(), "doGetLogout");

		Router.get("/auth/register", new AuthenticationController(), "doGetRegister");
		Router.post("/auth/register", new AuthenticationController(), "doPostRegister");

		Router.get("/auth/forgot-password", new AuthenticationController(), "doGetForgotPassword");
		Router.post("/auth/forgot-password", new AuthenticationController(), "doPostForgotPassword");

	}
}
