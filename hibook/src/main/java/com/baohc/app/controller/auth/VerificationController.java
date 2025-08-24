package com.baohc.app.controller.auth;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baohc.app.model.UserDTO;
import com.baohc.app.model.UserTokenDTO;
import com.baohc.app.service.user.UserService;
import com.baohc.app.service.user.UserServiceImpl;
import com.baohc.app.service.user.UserTokenService;
import com.baohc.app.service.user.UserTokenServiceImpl;
import com.baohc.core.utils.EmailKit;
import com.baohc.core.utils.EncryptPassword;
import com.baohc.core.utils.StringKit;
import com.baohc.core.utils.TokenKit;
import com.google.gson.Gson;

public class VerificationController {

	private UserService userService;
	private UserTokenService userTokenService;

	public VerificationController() {
		userService = UserServiceImpl.getInstance();
		userTokenService = UserTokenServiceImpl.getInstance();
	}

	public void showVerifyAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.getRequestDispatcher("/WEB-INF/views/auth/verifyAccount.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sendOtpMail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();

		try {
			HttpSession session = request.getSession();

			String email = request.getParameter("email");
			UserDTO user = new UserDTO();
			String toEmail="";
			UserDTO userIsVerify = (UserDTO) session.getAttribute("userIsVerify");
			user = userIsVerify;
			
			
			// user da ton tai chua xac minh
			if (user == null) {
				UserDTO useremail = userService.findByEmail(new UserDTO(null, email, null, null, null));
				if (useremail != null) {
					user = useremail;
				}
			}
			
			String fullname="";
			if (user != null) {
				toEmail = user.getEmail();
				fullname = user.getFullname();
			}
			
			if (toEmail.isEmpty() && "".equals(toEmail)) 
				toEmail = email;

			String code_otp = StringKit.RandomOTP();
			try {
				EmailKit.sendEmail(toEmail , "Xác thực email tại HiBOOK.com", "Xin chào " + fullname 
						+ ",\nMã OTP của bạn là: " + code_otp + "\n(OTP có hiệu lực 1 phút)");
				System.out.println("Gửi mail lại thành công");

				code_otp = EncryptPassword.toSHA1(code_otp);
				session.setAttribute("code_OTP", code_otp);

				Long code_OTP_Time = System.currentTimeMillis() + (60 * 1000);
				session.setAttribute("code_OTP_Time", code_OTP_Time); // Hiệu lực 1 phút

				resp.put("status", "success");
				resp.put("message", "Gửi mail thành công");
				resp.put("expireTime", code_OTP_Time.toString());

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Gửi mail lại thất bại");
				resp.put("status", "error");
				resp.put("message", "Gửi mail thất bại");
			}

			response.getWriter().print(gson.toJson(resp));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void doVerifyAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();

		Gson gson = new Gson();

		try {

			String otp_user = request.getParameter("otp_user");
			System.out.println(otp_user);
			otp_user = EncryptPassword.toSHA1(otp_user);

			HttpSession session = request.getSession();
			String code_otp = (String) session.getAttribute("code_OTP");

			Long code_OTP_Time = (Long) session.getAttribute("code_OTP_Time");

			UserDTO user = (UserDTO) session.getAttribute("userIsVerify");

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

				int inserted = userService.insert(user);
				if (inserted == 1) {
					session.removeAttribute("code_OTP");
					session.removeAttribute("code_OTP_Time");
					session.removeAttribute("user_verification_otp");

					resp.put("status", "success");
					resp.put("message", "Đã xác minh và tạo tài khoản thành công!");

				} else {
					resp.put("status", "error");
					resp.put("message", "Tạo tài khoản thất bại!");
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
	
	private Map<String, String> verifyOTP(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map<String, String> res = new HashMap<String, String>();
		
		try {
			String otp_user = request.getParameter("otp_user");
			System.out.println(otp_user);
			otp_user = EncryptPassword.toSHA1(otp_user);

			HttpSession session = request.getSession();
			String code_otp = (String) session.getAttribute("code_OTP");
			Long code_OTP_Time = (Long) session.getAttribute("code_OTP_Time");
			
			if (code_otp == null || code_OTP_Time == null) {	
				res.put("status", "error");
				res.put("message", "Mã xác thực không tồn tại!!"); 
			}

			if (System.currentTimeMillis() > code_OTP_Time) {
				session.removeAttribute("code_OTP");
				session.removeAttribute("code_OTP_Time");
				res.put("status", "error");
				res.put("message", "Mã xác thực đã không còn hiệu lực");
			}
			if (otp_user.equals(code_otp)) {
				session.removeAttribute("code_OTP");
				session.removeAttribute("code_OTP_Time");

				res.put("status", "success");
				res.put("message", "Đã xác minh OTP thành công!");
			}
			else {
				res.put("status", "error");
				res.put("message", "Mã OTP không đúng!");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}
	
	public void updateEmailByOTP(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();
		try {
			String new_email = request.getParameter("newEmail");
			
			Map<String, String> isVerify = verifyOTP(request, response);
			
			String status = isVerify.get("status");
			String message = isVerify.get("message");
			
			if (status.equals("success")) {
				resp.put("newEmail", new_email);
				resp.put("status", status);
				resp.put("message", message);
			} else {
				resp.put("status", status);
				resp.put("message", message);
			}
			response.getWriter().print(gson.toJson(resp));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void sendTokenMail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		Map<String, String> resp = new HashMap<String, String>();
		Gson gson = new Gson();

		try {
			String email = request.getParameter("email");

			if (email == null && email.isEmpty()) {
				resp.put("status", "error");
				resp.put("message", "Email rỗng hoặc lỗi. Vui lòng kiểm tra lại");
				response.getWriter().print(gson.toJson(resp));
				return;
			}

			UserDTO usertmp = new UserDTO();
			usertmp.setEmail(email);

			UserDTO userByEmail = userService.findByEmail(usertmp);

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
				System.out.println(userByEmail.getId() + rawToken);
				String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
				String linkGET = url + "/forgot-password?userId="
						+ URLEncoder.encode(userByEmail.getId(), "UTF-8") + "&token="
						+ URLEncoder.encode(rawToken, "UTF-8");
				String content = "<p>Clink vào link để xác thực tài khoản của bạn</p>"
						+"<a href='"+linkGET+"'>"+linkGET+"</a>";
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

			}
			else {
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
}
