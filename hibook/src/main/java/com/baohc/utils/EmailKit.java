package com.baohc.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailKit {
	private static final String APP_EMAIL = "baohc170504@gmail.com";
	private static final String APP_PASSWORD = "ynqseesswtwljkbv";
	private static final String RECIVE_EMAIL = "baohc170504@gmail.com";
	private static final String HOST_NAME = "smtp.gmail.com";
	private static final int SSL_PORT = 465;
	private static final int TSL_PORT = 587;
	
	public static boolean sendEmail(String to, String title, String content) {
		Properties pros = new Properties();
		pros.put("mail.smtp.auth", "true");
		pros.put("mail.smtp.host", HOST_NAME);
		pros.put("mail.smtp.port", TSL_PORT);
		pros.put("mail.smtp.starttls.enable", "true");
		
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(APP_EMAIL, APP_PASSWORD);
			}
		};
		
		Session session = Session.getInstance(pros, auth);
		
		MimeMessage msg = new MimeMessage(session);
		
		try {
			// Kiểu nội dung
			msg.addHeader("Context-type", "text/HTML; charset=UTF-8");
			
			//Người gửi
			msg.setFrom(APP_EMAIL);
			
			//Người nhận
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			
			msg.setReplyTo(new InternetAddress[] {
					new InternetAddress(APP_EMAIL, "HiBook Support Team")
				});
			// Tiêu đề mail 
			msg.setSubject(title);
			
			//Quy định ngày gửi
			msg.setSentDate(new Date());
			
			// Nội dung tin nhắn
			msg.setContent(content, "text/HTML; charset=UTF-8");
			
			//Gửi mail
			Transport.send(msg);
			return true;
			
		} catch (Exception e) {
			System.out.println("Gặp lỗi trong quá trình gửi mail");
			e.printStackTrace();
			return false;
		}
	}
	
	public static void main(String[] args) {
		EmailKit.sendEmail("devblue404@gmail.com","Test mail reply", "Đây là nội dung");
	}
}
