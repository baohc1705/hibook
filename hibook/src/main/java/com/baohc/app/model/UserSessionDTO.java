package com.baohc.app.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserSessionDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;
	private String userId;
	private String ipAddress;
	private String userAgent;
	private Timestamp lastActivity;
	private Timestamp createdAt;
	private Timestamp expiresAt;
	private boolean isActive;
	public UserSessionDTO(String id, String userId, String ipAddress, String userAgent, Timestamp lastActivity,
			Timestamp createdAt, Timestamp expiresAt, boolean isActive) {
		super();
		this.id = id;
		this.userId = userId;
		this.ipAddress = ipAddress;
		this.userAgent = userAgent;
		this.lastActivity = lastActivity;
		this.createdAt = createdAt;
		this.expiresAt = expiresAt;
		this.isActive = isActive;
	}
	public UserSessionDTO() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	public Timestamp getLastActivity() {
		return lastActivity;
	}
	public void setLastActivity(Timestamp lastActivity) {
		this.lastActivity = lastActivity;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Timestamp getExpiresAt() {
		return expiresAt;
	}
	public void setExpiresAt(Timestamp expiresAt) {
		this.expiresAt = expiresAt;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	
	
}
