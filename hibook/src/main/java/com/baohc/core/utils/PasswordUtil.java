package com.baohc.core.utils;

import java.security.SecureRandom;

import com.baohc.app.config.SecurityConfig;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import de.mkammerer.argon2.Argon2Factory.Argon2Types;

public class PasswordUtil {
	private static final Argon2 ARGON2 = Argon2Factory.create(Argon2Types.ARGON2id);
	private static final SecureRandom RANDOM = new SecureRandom();

	private PasswordUtil() {
	}

	/**
	 * Hash password với Argon2id
	 */
	public static String hashPasswordArgon(String password) {
		if (password == null)
			throw new IllegalArgumentException("password is null");
		int iterations = SecurityConfig.ARGON2_ITERATIONS;
		int memoryKB = SecurityConfig.ARGON2_MEMORY_KB;
		int parallelism = SecurityConfig.ARGON2_PARALLELISM;

		char[] passwordChars = password.toCharArray();

		try {
			return ARGON2.hash(iterations, memoryKB, parallelism, passwordChars);
		} finally {
			ARGON2.wipeArray(passwordChars);
		}
	}

	/**
	 * Xác minh với Argon2id
	 */
	public static boolean verifyPasswordArgon(String password, String storedHash) {
		if (password == null || storedHash == null)
			return false;
		char[] passwordChars = password.toCharArray();
		try {
			return ARGON2.verify(storedHash, passwordChars);
		} finally {
			ARGON2.wipeArray(passwordChars);
		}
	}
	
	public static void main(String[] args) {
		String pass = "123";
		String dbpass = hashPasswordArgon(pass);
		
		String passin = "1234";
		if (verifyPasswordArgon(passin, dbpass)) {
			System.out.println("OK");
		}
		else
			System.out.println("DENY");
	}
}
