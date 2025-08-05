package com.baohc.utils;

import java.security.MessageDigest;

public class EncryptPassword {
	public static String toSHA1(String str) {
		String salt = "jhgaqpo@43509aogja1$#!lkfj";
		String result = null;
		
		str = str + salt;
		
		try {
			byte[] dataBytes = str.getBytes("UTF-8"); 
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result = org.apache.commons.codec.binary.Base64.encodeBase64String(md.digest(dataBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
