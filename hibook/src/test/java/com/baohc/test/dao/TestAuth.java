package com.baohc.test.dao;

import java.sql.Date;

import com.baohc.app.dao.user.UserDAO;
import com.baohc.app.dao.user.UserDAOImpl;
import com.baohc.app.model.UserDTO;
import com.baohc.core.utils.PasswordUtil;
import com.baohc.core.utils.StringKit;

public class TestAuth {
	private static UserDAO userDAO = UserDAOImpl.getInstance();
	public static void main(String[] args) {
		
		String username = "brian";
		System.out.println(userDAO.findByUsername(username));
		//testInsertAccount();
		testLogin();
	}
	
	public static void testInsertAccount() {
		UserDTO user = new UserDTO();
		user.setId(StringKit.RandomId());
		user.setUsername("devblue");
		user.setEmail("dev123@gmail.com");
		user.setFullname("Huỳnh Họa Bảo");
		user.setBirthDate(Date.valueOf("2004-05-17"));
		
		int insert = userDAO.insertAccount(user, "Chibao@123");
		if (insert != 0) {
			System.out.println(userDAO.findByUsername(user.getUsername()));
		} 
		else {
			System.out.println("Insert failed");
		}
	}
	
	public static void testLogin() {
		UserDTO user = userDAO.findByUsername("devblue");
		if (user != null) {
			if (userDAO.isAccountLocked(user.getUsername())) {
				System.out.println("Account locked hẹ hẹ");
			}
			else {
				boolean login = PasswordUtil.verifyPasswordArgon("Chibao@123", user.getPassword());
				if (login) {
					userDAO.resetFailedLoginAttempt(user.getUsername());
					System.out.println("login successfull");
				} 
				else {
					userDAO.updateFailedLoginAttempt(user.getUsername());
					System.out.println("Login failed");
				}
			}
		}
	}
}
