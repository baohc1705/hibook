package com.baohc.core.utils;


import com.baohc.app.dao.user.CateUserDAOImpl;
import com.baohc.app.model.CateUserDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.service.user.CateUserService;
import com.baohc.app.service.user.CateUserServiceImpl;
import com.baohc.app.service.user.UserService;
import com.baohc.app.service.user.UserServiceImpl;

public class Test {
	public static void main(String[] args) {
//		for (CateUserDTO item : CateUserDAO.getInstance().getData()) {
//			System.out.println(item);
//		}
		
//		for (UserDTO item : UserDAO.getInstance().getData()) {
//			System.out.println(item);
//		}
		
		CateUserService service = CateUserServiceImpl.getInstance();
		
		for (CateUserDTO item : service.getData()) {
			System.out.println(item);
		}
		
		UserService userService = UserServiceImpl.getInstance();
		
		for (UserDTO item : userService.getAllUser()) {
			System.out.println(item);
		}
		
		System.out.println("found login : " + userService.login(new UserDTO(null,"devblue404@gmail.com", EncryptPassword.toSHA1("123"), null, null)));
	}
}
