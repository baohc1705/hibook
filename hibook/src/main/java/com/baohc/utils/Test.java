package com.baohc.utils;

import java.sql.Connection;

import com.baohc.model.user.CateUserDAO;
import com.baohc.model.user.CateUserDTO;

public class Test {
	public static void main(String[] args) {
		for (CateUserDTO item : CateUserDAO.getInstance().getAll()) {
			System.out.println(item);
		}
	}
}
