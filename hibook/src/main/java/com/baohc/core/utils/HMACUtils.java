package com.baohc.core.utils;

import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class HMACUtils {
	private static final String HMAC_ALGO = "HmacSHA256";
	
	/* 
	 * Generate HMAC-SHA256 signature for given data and secret 
	 * Uses URL-safe Base64 encoding without padding (better for cookies)
	 */
	
	public static String hmacSha256(String data, String secret) {
		try {
			Mac mac = Mac.getInstance(HMAC_ALGO);
			mac.init(new SecretKeySpec(secret.getBytes("UTF-8"), HMAC_ALGO));
			byte[] raw = mac.doFinal(data.getBytes("UTF-8"));
			return Base64.getUrlEncoder().withoutPadding().encodeToString(raw);
		} catch (Exception e) {
			throw new RuntimeException("Failed to compute HMAC: " + e.getMessage(), e);
		}
	}
	
	/* 
	 * Verify HMAC signature with contant-time comparison to prevent timing attacks
	 */
	
	public static boolean verifyHmac(String data, String signature, String secret) {
		try {
			String computedSignature = hmacSha256(data, secret);
			return contantTimeEquals(signature, computedSignature);
		} catch (Exception e) {
			System.err.println("HMAC verification failed: " + e.getMessage());
			return false;
		}
	}

	private static boolean contantTimeEquals(String a, String b) {
		if (a == null || b == null || a.length() != b.length()) {
			return false;
		}
		
		int result = 0;
		for (int i = 0; i < a.length(); i++) {
			result |=  a.charAt(i) ^ b.charAt(i);
		}
		return result == 0;
	}
	
	public static void main(String[] args) {
		System.out.println("=== HMAC Utils Test ===");
		
		// Generate a secret 
		String secret = "PRIVATE_KEY_ONLY_ONE"; // can use hash or UUID 
		System.out.println("SECRET: " + secret);
		
		// Generate a HMAC
		String testData = "1,2|2,3|ts:" + System.currentTimeMillis();
		String signature = hmacSha256(testData, secret);
		System.out.println("TEST DATA: " + testData);
		System.out.println("SIGNATURE: " +  signature);
		
		// Verify HMAC
		boolean isValid = verifyHmac(testData, signature, secret);
		System.out.println("Verification result: " + (isValid ? "VALID" : "INVALID"));
		
		// Test with tampered data
		String tamperedData = testData.replace("1,2", "1,9999");
		System.out.println("TEST TAMPERED DATA: " + tamperedData);
		boolean tamperedValid = verifyHmac(tamperedData, signature, secret);
		System.out.println("Tampered verification: " + (tamperedValid ? "ACCEPTED" : "REJECTED"));
	}
}
