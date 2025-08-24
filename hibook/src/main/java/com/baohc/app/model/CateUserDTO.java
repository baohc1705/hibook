package com.baohc.app.model;

import java.util.Objects;

public class CateUserDTO {
	private int id;
	private String name;
	public CateUserDTO() {
		super();
		this.id = 0;
		this.name = "";
	}
	
	public CateUserDTO(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public CateUserDTO(String name) {
		super();
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "CateUserDTO [id=" + id + ", name=" + name + "]";
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
		CateUserDTO other = (CateUserDTO) obj;
		return id == other.id;
	}
}
