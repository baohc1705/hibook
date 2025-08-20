package com.baohc.model.user;

import java.sql.Timestamp;

public class PasswordResetTokenDTO {
	private int id;
	private String user_id;
	private String token;
	private Timestamp expiry;
	private String salt;
	private boolean used;
	private Timestamp createAt;
	public PasswordResetTokenDTO() {
		super();
	}
	
	public PasswordResetTokenDTO(String user_id, String token, Timestamp expiry, String salt, boolean used) {
		super();
		this.user_id = user_id;
		this.token = token;
		this.expiry = expiry;
		this.salt = salt;
		this.used = used;
	}

	public PasswordResetTokenDTO(int id, String user_id, String token, Timestamp expiry, String salt, boolean used,
			Timestamp createAt) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.token = token;
		this.expiry = expiry;
		this.salt = salt;
		this.used = used;
		this.createAt = createAt;
	}
	public PasswordResetTokenDTO(String user_id, String token, Timestamp expiry, String salt, boolean used,
			Timestamp createAt) {
		super();
		this.user_id = user_id;
		this.token = token;
		this.expiry = expiry;
		this.salt = salt;
		this.used = used;
		this.createAt = createAt;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Timestamp getExpiry() {
		return expiry;
	}
	public void setExpiry(Timestamp expiry) {
		this.expiry = expiry;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public boolean isUsed() {
		return used;
	}
	public void setUsed(boolean used) {
		this.used = used;
	}
	public Timestamp getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}

	@Override
	public String toString() {
		return "PasswordResetTokenDTO [id=" + id + ", user_id=" + user_id + ", token=" + token + ", expiry=" + expiry
				+ ", salt=" + salt + ", used=" + used + ", createAt=" + createAt + "]";
	}
	
	
	
}
