package com.baohc.model.author;

import java.sql.Date;
import java.util.Objects;

public class AuthorDTO {
	private String id;
	private String fullname;
	private String email;
	private Date DoB;
	private String biography;
	public AuthorDTO() {
		super();
		this.id = "";
		this.fullname = "";
		this.email = "";
		DoB = null;
		this.biography = "";
	}
	public AuthorDTO(String id, String fullname, String email, Date doB, String biography) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		DoB = doB;
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
	public Date getDoB() {
		return DoB;
	}
	public void setDoB(Date doB) {
		DoB = doB;
	}
	public String getBiography() {
		return biography;
	}
	public void setBiography(String biography) {
		this.biography = biography;
	}
	
	@Override
	public String toString() {
		return "AuthorDTO [id=" + id + ", fullname=" + fullname + ", email=" + email + ", DoB=" + DoB + ", biography="
				+ biography + "]";
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AuthorDTO other = (AuthorDTO) obj;
		return Objects.equals(id, other.id);
	}	
}
