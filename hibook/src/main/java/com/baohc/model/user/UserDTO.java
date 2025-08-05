package com.baohc.model.user;

import java.sql.Date;
import java.util.Objects;

public class UserDTO {
	private String id;
	private CateUserDTO cateUser;
	private String email;
	private String password;
	private String fullname;
	private Date birthDate;
	public UserDTO() {
		super();
		this.id = "";
		this.cateUser = null;
		this.email = "";
		this.password = "";
		this.fullname = "";
		this.birthDate = null;
	}
	public UserDTO(String id, CateUserDTO cateUser, String email, String password, String fullname, Date birthDate) {
		super();
		this.id = id;
		this.cateUser = cateUser;
		this.email = email;
		this.password = password;
		this.fullname = fullname;
		this.birthDate = birthDate;
	}
	
	public UserDTO(CateUserDTO cateUser, String email, String password, String fullname, Date birthDate) {
		super();
		this.cateUser = cateUser;
		this.email = email;
		this.password = password;
		this.fullname = fullname;
		this.birthDate = birthDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public CateUserDTO getCateUser() {
		return cateUser;
	}
	public void setCateUser(CateUserDTO cateUser) {
		this.cateUser = cateUser;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", cateUser=" + cateUser + ", email=" + email + ", password=" + password
				+ ", fullname=" + fullname + ", birthDate=" + birthDate + "]";
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
		UserDTO other = (UserDTO) obj;
		return Objects.equals(id, other.id);
	}

}
