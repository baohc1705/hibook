package com.baohc.utils;

import java.util.Random;

public class StringKit {
	
	public static String RandomOTP() {
		Random rd = new Random();
		String char1 = rd.nextInt(10) + "";
		String char2 = rd.nextInt(10) + "";
		String char3 = rd.nextInt(10) + "";
		String char4 = rd.nextInt(10) + "";
		String char5 = rd.nextInt(10) + "";
		String char6 = rd.nextInt(10) + "";
		
		return char1 + char2 + char3 + char4 + char5 + char6;
	}
}
