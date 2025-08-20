package com.baohc.utils;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

public class TokenKit {
	// tạo salt
	public static String generateSalt() {
		SecureRandom sr = new SecureRandom();
		byte[] salt = new byte[16];
		sr.nextBytes(salt);
		return Base64.getEncoder().encodeToString(salt);
	}
	
	// hasd token SHA256
	public static String hashSHA256(String token, String salt) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            String input = token + salt; 
            byte[] hash = digest.digest(input.getBytes());
            return Base64.getEncoder().encodeToString(hash);
        } catch (Exception e) {
            throw new RuntimeException("Error hashing token", e);
        }
    }
	
	public static boolean verifyToken(String token, String salt, String storedHash) {
        String newHash = hashSHA256(token, salt);
        return newHash.equals(storedHash);
    }
	
	 // Demo
    public static void main(String[] args) {
        String token = "resetPassword123";

        // Tạo salt
        String salt = generateSalt();
        System.out.println("Salt: " + salt);

        // Hash token + salt
        String hashed = hashSHA256(token, salt);
        System.out.println("Hash: " + hashed);

        // Kiểm tra verify
        System.out.println("Verify đúng: " + verifyToken(token, salt, hashed));
        System.out.println("Verify sai: " + verifyToken("wrongToken", salt, hashed));
    }
}
