package com.baohc.model.book;

import java.util.Objects;

public class CateBookDTO {
	private int id;
	private String name;
	public CateBookDTO() {
		super();
		this.id = 0;
		this.name = "";
	}
	public CateBookDTO(int id, String name) {
		super();
		this.id = id;
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
		return "CateBookDTO [id=" + id + ", name=" + name + "]";
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
		CateBookDTO other = (CateBookDTO) obj;
		return id == other.id;
	}
}
