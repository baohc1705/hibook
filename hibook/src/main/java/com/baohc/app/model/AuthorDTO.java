package com.baohc.app.model;

import java.sql.Date;

public class AuthorDTO {
	private String id;
	private String fullname;
	private String email;
	private Date dob;
	private String biography;
	public AuthorDTO() {
		super();
	}
	public AuthorDTO(String id, String fullname, String email, Date dob, String biography) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.dob = dob;
		this.biography = biography;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getBiography() {
		return biography;
	}
	public void setBiography(String biography) {
		this.biography = biography;
	}
	@Override
	public String toString() {
		return "AuthorDTO [id=" + id + ", fullname=" + fullname + ", email=" + email + ", dob=" + dob + ", biography="
				+ biography + "]";
	}
	
	
}
