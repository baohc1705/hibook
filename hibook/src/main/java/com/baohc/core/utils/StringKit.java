package com.baohc.core.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

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
	
	public static String RandomPassword() {
		Random rd = new Random();
		String alphabet = "abcdefghijklmnopqrstuvwxyz";
		StringBuilder sb = new StringBuilder();
		
		for (int i = 0 ; i < 6; i++) {
			int index = rd.nextInt(alphabet.length());
			sb.append(alphabet.charAt(index));
		}
		
		return sb.toString();
	}
	
	public static String RandomToken() {
		return UUID.randomUUID().toString();
	}
	
	public static String RandomId() {
		String date = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		return date + RandomOTP();
	}
	
	public static String RandomIdTime() {
		String date = new SimpleDateFormat("yyMMddHHmmss").format(new Date());
		return date;
	}
	public static void main(String[] args) {
		System.out.println(RandomIdTime());
	}
}
