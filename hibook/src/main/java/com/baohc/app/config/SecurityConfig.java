package com.baohc.app.config;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class SecurityConfig {
	private SecurityConfig() {}
	// Session configuration
	public static final int SESSION_TIMEOUT_MINUTES = 3;
	public static final String SECURE_COOKIE_NAME = "SECURE_JSESSIONID";
	public static final boolean SESSION_SECURE_COOKIES = false; // Enable khi deploy 
	public static final boolean SESSION_HTTP_ONLY = true;
	public static final String ATTR_SESSIONID_NAME = "dbSessionId";
	public static final String ATTR_SESSIONID_USERROLES_NAME = "userRoles";
	public static final String ATTR_SESSIONID_USERID_NAME = "userId";
	public static final String ATTR_SESSIONID_USERNAME = "username";
	public static final String ATTR_SESSIONID_CREATION_TIME_NAME = "sessionCreationTime";
	// Password policy
	public static final int MIN_PASSWORD_LENGTH = 8;
	public static final int MAX_PASSWORD_LENGTH = 128;
	public static final int MAX_LOGIN_ATTEMPTS = 5;
	public static final int ACCOUNT_LOCKED_DURATION_MINUTES = 5;

	// Argon2 recommended params (OWASP guidance)
    //time = 3, memory = 64 MB, parallelism = 1
    public static final int ARGON2_ITERATIONS = 3;
    public static final int ARGON2_MEMORY_KB = 64 * 1024; // 64 MB
    public static final int ARGON2_PARALLELISM = 1;
	
	// CSRF Configuration
	public static final boolean CSRF_PROTECTION_ENABLED = true;
    public static final String CSRF_TOKEN_NAME = "csrfToken";
    public static final int CSRF_TOKEN_LENGTH = 32;
    
    // Rate Limiting
    public static final int RATE_LIMIT_LOGIN_ATTEMPTS = 5;
    public static final int RATE_LIMIT_WINDOW_MINUTES = 3;
    
    // Security Headers
    public static final String[] SECURITY_HEADERS = {
        "X-Frame-Options: DENY",
        "X-Content-Type-Options: nosniff", 
        "X-XSS-Protection: 1; mode=block",
        "Referrer-Policy: strict-origin-when-cross-origin",
        "Permissions-Policy: geolocation=(), microphone=(), camera=()"
    };
    
    // Validation Patterns
    public static final String USERNAME_PATTERN = "^[a-zA-Z0-9_]{3,50}$";
    public static final String EMAIL_PATTERN = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
    public static final String STRONG_PASSWORD_PATTERN = 
        "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
    
    // Public URLs (Không cần authentication)
	private static final String[] PUBLIC_URL_PATTERNS = { "/", "/auth/*", "/favicon.ico", "/error/*",
			"/api/public/*", "/books", "/books/*", "/cart", "/checkout", "/assets/*" , "/components/*", "/verify/email"};
    
    // Admin URLs (Cần admin role và phải authentication)
    private static final String[] ADMIN_URL_PATTERNS = { "/admin", "/admin/*" };
    
    // Manage URLs (Cần manage role và phải authentication)
	private static final String[] MANAGE_URL_PATTERNS = { "/manage/*", "/manage" };
	
	//User URLs (cần authentication, bất kỳ role nào)
    private static final String[] USER_URL_PATTERNS = {
        "/verify-account",
        "/verify-account/*",
        "/forgot-password",
        "/forgot-password/*",
        "/user-information",
        "/verify/email",
        "/user/*"
    };
    
    // Chuyển Array sang Set cho performance
    public static final Set<String> PUBLIC_URLS = new HashSet<>(Arrays.asList(PUBLIC_URL_PATTERNS));
    public static final Set<String> ADMIN_URLS = new HashSet<>(Arrays.asList(ADMIN_URL_PATTERNS));
    public static final Set<String>  MANAGE_URLS = new HashSet<>(Arrays.asList(MANAGE_URL_PATTERNS));
    public static final Set<String> USER_URLS = new HashSet<>(Arrays.asList(USER_URL_PATTERNS));
}
