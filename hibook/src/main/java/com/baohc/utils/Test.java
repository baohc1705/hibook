package com.baohc.utils;

import java.sql.Connection;

import com.baohc.model.user.CateUserDAO;
import com.baohc.model.user.CateUserDTO;
import com.baohc.model.user.UserDAO;
import com.baohc.model.user.UserDTO;

public class Test {
	public static void main(String[] args) {
//		for (CateUserDTO item : CateUserDAO.getInstance().getData()) {
//			System.out.println(item);
//		}
		
//		for (UserDTO item : UserDAO.getInstance().getData()) {
//			System.out.println(item);
//		}
		
		System.out.println(StringKit.RandomOTP());
	}
}
