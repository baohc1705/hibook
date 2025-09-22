package com.baohc.app.controller.verify;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.app.config.PageConfig;
import com.baohc.app.config.SecurityConfig;
import com.baohc.app.model.UserDTO;
import com.baohc.app.model.UserTokenDTO;
import com.baohc.app.service.auth.AuthenticationService;
import com.baohc.app.service.user.UserService;
import com.baohc.app.service.user.UserServiceImpl;
import com.baohc.app.service.user.UserTokenService;
import com.baohc.app.service.user.UserTokenServiceImpl;
import com.baohc.core.utils.CSRFTokenUtil;
import com.baohc.core.utils.EmailKit;
import com.baohc.core.utils.EncryptPassword;
import com.baohc.core.utils.StringKit;
import com.baohc.core.utils.TokenKit;
import com.google.gson.Gson;

public class VerifyController {
	private UserService userService;
	private UserTokenService userTokenService;
	private AuthenticationService authN;
	public VerifyController() {
		userService = UserServiceImpl.getInstance();
		userTokenService = UserTokenServiceImpl.getInstance();
		authN = new AuthenticationService();
	}
	public void doGetSendVerificationToEmail (HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null || action.trim().isEmpty()) {
			handelInvalidRequest(request, response);
			return;
		}
		else {
			switch(action) {
			case "otp" :
				viewPageVerifyByOTP(request, response);
				break;
				default:
					handelInvalidRequest(request, response);
					break;
			}
		}
	}
	private void viewPageVerifyByOTP(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			String csrfToken = CSRFTokenUtil.generateToken(request);
			request.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, csrfToken);
			
			request.getRequestDispatcher(PageConfig.VERIFY_ACCOUNT).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void doPostSendVerificationToEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null || action.trim().isEmpty()) {
			handelInvalidRequest(request, response);
			return;
		} else {
			switch (action) {
			case "token":
				sentTokenToEmail(request, response);
				break;
			case "otp":
				sentOTPToEmail(request, response);
				break;
			case "verify-otp":
				doVerifyOTP(request, response);
				break;
			default:
				handelInvalidRequest(request, response);
				break;
			}
		}
	}
	
	private void doVerifyOTP(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();

		Gson gson = new Gson();
		try {
			
			if (!CSRFTokenUtil.validateToken(request)) {
				resp.put("status", "error");
				resp.put("message", "Invalid request. Please try again.");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			String otp_user = request.getParameter("otp_user");
			otp_user = EncryptPassword.toSHA1(otp_user);
			
			HttpSession session = request.getSession(false);
			String code_otp = (String) session.getAttribute("code_OTP");
			Long code_OTP_Time = (Long) session.getAttribute("code_OTP_Time");

			if (code_otp == null || code_OTP_Time == null) {
				resp.put("status", "error");
				resp.put("message", "Mã xác thực không tồn tại!!");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			if (System.currentTimeMillis() > code_OTP_Time) {

				session.removeAttribute("code_OTP");
				session.removeAttribute("code_OTP_Time");
				resp.put("status", "error");
				resp.put("message", "Mã xác thực đã không còn hiệu lực");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			if (otp_user.equals(code_otp)) {
				UserDTO userDeliveried = (UserDTO)session.getAttribute("userDeliveried");
				String confirmPassword = (String)session.getAttribute("userDeliveried_confirmPassword");
				String birthDate = (String)session.getAttribute("userDeliveried_birthDate");
				boolean register = authN.regiter(userDeliveried.getUsername(), userDeliveried.getEmail(), userDeliveried.getPassword(), confirmPassword, userDeliveried.getFullname(), birthDate, request);
				if (register) {
					request.setAttribute("email", userDeliveried.getEmail());
					session.removeAttribute("code_OTP");
					session.removeAttribute("code_OTP_Time");
					session.removeAttribute("userDeliveried");
					session.removeAttribute("userDeliveried_confirmPassword");
					session.removeAttribute("userDeliveried_birthDate");

					resp.put("status", "success");
					resp.put("message", "Đã xác minh và tạo tài khoản thành công!");

				} else {
					// Registration thất bại
					resp.put("status", "error");
					resp.put("message", "Tạo tài khoản thất bại!");
				
					
					String csrfToken = CSRFTokenUtil.generateToken(request);
					request.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, csrfToken);
					request.getRequestDispatcher(PageConfig.REGISTER).forward(request, response);
					return;
				}
				
			} else {
				resp.put("status", "error");
				resp.put("message", "Mã xác thực OTP không đúng. Kiểm tra lại email!");
			}
			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void sentOTPToEmail(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException { 
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();

		Gson gson = new Gson();
		try {
			// Kiểm tra request
			if (!CSRFTokenUtil.validateToken(request)) {
				resp.put("status", "error");
				resp.put("message", "Invalid request. Please try again.");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			String email = request.getParameter("email");
			HttpSession session = request.getSession(false);
			UserDTO userDeliveried = (UserDTO)session.getAttribute("userDeliveried");
			if (userDeliveried == null) {
				resp.put("status", "error");
				resp.put("message", "User not found");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			if (email == null || "".equals(email)) {
				resp.put("status", "error");
				resp.put("message", "Email empty");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			String codeOTP = StringKit.RandomOTP();
			
			// Gửi mail kèm theo mã otp
			try {
				String html = getHTMLTemplate(userDeliveried.getFullname(), codeOTP);
				EmailKit.sendEmail(email, "Xác thực email tại HiBOOK", html);
				
				codeOTP = EncryptPassword.toSHA1(codeOTP);
				
				session.setAttribute("code_OTP", codeOTP);

				Long code_OTP_Time = System.currentTimeMillis() + (60 * 1000);
				session.setAttribute("code_OTP_Time", code_OTP_Time); 
				
				resp.put("status", "success");
				resp.put("message", "Gửi mail thành công");
				resp.put("expireTime", code_OTP_Time.toString());
			} catch (Exception e) {
				e.printStackTrace();
				resp.put("status", "error");
				resp.put("message", "Gửi mail thất bại");
			}
			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private String getHTMLTemplate(String fullname, String otpCode) {
		StringBuilder html = new StringBuilder();
		html.append("<!DOCTYPE html>")
		    .append("<html lang=\"vi\">")
		    .append("<head>")
		    .append("<meta charset=\"UTF-8\">")
		    .append("<title>Xác thực email - HiBOOK</title>")
		    .append("</head>")
		    .append("<body style=\"margin:0;padding:0;font-family:Arial,Helvetica,sans-serif;background-color:#f4f6f9;\">")
		    .append("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"padding:30px 0;\">")
		    .append("<tr><td>")
		    .append("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" ")
		    .append("style=\"background-color:#ffffff;border-radius:12px;box-shadow:0 2px 8px rgba(0,0,0,0.1);padding:30px;\">")
		    .append("<tr><td align=\"center\" style=\"color:#1e3a8a;font-size:22px;font-weight:bold;padding-bottom:10px;\">")
		    .append("Xác thực tài khoản của bạn")
		    .append("</td></tr>")
		    .append("<tr><td style=\"color:#374151;font-size:15px;line-height:22px;padding:10px 0 20px 0;\">")
		    .append("Xin chào <strong>").append(fullname).append("</strong>,<br>")
		    .append("Bạn vừa yêu cầu mã OTP để xác thực tài khoản tại <b>HiBOOK</b>.<br>")
		    .append("Vui lòng sử dụng mã OTP bên dưới để hoàn tất xác thực:")
		    .append("</td></tr>")
		    .append("<tr><td align=\"center\" style=\"padding:15px 0;\">")
		    .append("<div style=\"font-size:28px;font-weight:bold;color:#2563eb;letter-spacing:4px;background:#f0f9ff;")
		    .append("border:2px dashed #3b82f6;padding:12px 20px;border-radius:8px;display:inline-block;\">")
		    .append(otpCode)
		    .append("</div></td></tr>")
		    .append("<tr><td align=\"center\" style=\"color:#ef4444;font-size:14px;padding:15px 0;\">")
		    .append("Mã OTP chỉ có hiệu lực trong vòng <b>1 phút</b>.")
		    .append("</td></tr>")
		    .append("<tr><td style=\"color:#6b7280;font-size:13px;line-height:20px;padding-top:20px;")
		    .append("border-top:1px solid #e5e7eb;text-align:center;\">")
		    .append("Nếu bạn không yêu cầu hành động này, hãy bỏ qua email này.<br>")
		    .append("© 2025 HiBOOK.com. All rights reserved.")
		    .append("</td></tr>")
		    .append("</table></td></tr></table></body></html>");

		return html.toString();
	}
	private void sentTokenToEmail(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		
		try {
			String email = request.getParameter("email");
			if (!CSRFTokenUtil.validateToken(request)) {
				resp.put("status", "error");
				resp.put("message", "Invalid request. Please try again.");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			if (email == null || email.isEmpty()) {
				resp.put("status", "error");
				resp.put("message", "Email rỗng hoặc lỗi. Vui lòng kiểm tra lại");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			UserDTO userByEmail = userService.findByEmail(email);
			if (userByEmail == null) {
				resp.put("status", "error");
				resp.put("message", "Không tìm thấy người dùng với email này.");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			String userNotVarify = userTokenService.getUserNotVerify(userByEmail.getId());
			
			if (userNotVarify != null && !userNotVarify.isEmpty()) {
				resp.put("status", "error");
				resp.put("message", "Email còn thời hạn xác thực. Không thể gửi xác thực thêm");
				response.getWriter().print(gson.toJson(resp));
				return;
			}
			
			String rawToken = StringKit.RandomToken();
			String salt = TokenKit.generateSalt();
			String hashedToken = TokenKit.hashSHA256(rawToken, salt);
			
			Timestamp expiry = new Timestamp(System.currentTimeMillis() + (1 * 60 * 1000));
			UserTokenDTO token = new UserTokenDTO(userByEmail.getId(), hashedToken, expiry, salt, false);
			int saveToken = userTokenService.saveToken(token);
			
			if (saveToken == 1) {
				String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
						+ request.getContextPath();
				String linkGET = url + "/auth/forgot-password?userId=" + URLEncoder.encode(userByEmail.getId(), "UTF-8")
						+ "&token=" + URLEncoder.encode(rawToken, "UTF-8");
				String content = "<p>Clink vào link để xác thực tài khoản của bạn</p>" + "<a href='" + linkGET + "'>"
						+ linkGET + "</a>";
				try {
					EmailKit.sendEmail(userByEmail.getEmail(), "Đặt lại mật khẩu tại HiBook.com", content);
					System.out.println("Gửi mail đặt lại mật khẩu thành công");
					resp.put("status", "success");
					resp.put("message", "Đã gửi thông tin xác nhận đến email của bạn. Vui lòng kiểm tra email.");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Gửi mail đặt lại mật khẩu thất bại");
					resp.put("status", "error");
					resp.put("message", "Không gửi được mail.Vui lòng kiểm tra lại");
				}

			} else {
				resp.put("status", "error");
				resp.put("message", "Vui lòng chọn xác nhận trong mail");
				System.out.println("Token không save");
			}
			response.getWriter().print(gson.toJson(resp));
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Lỗi máy chủ");
		}
		
	}

	private void handelInvalidRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("error", "Invalid request. Please try again!");
		String csrfToken = CSRFTokenUtil.generateToken(request);
		request.setAttribute(SecurityConfig.CSRF_TOKEN_NAME, csrfToken);
		request.getRequestDispatcher(PageConfig.FORGOT_PASSWORD).forward(request, response);
	}
}
