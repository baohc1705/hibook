package com.baohc.app.model;

public class CateBookDTO {
	private int id;
	private String 	name;
	public CateBookDTO(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public CateBookDTO() {
		super();
	}
	public CateBookDTO(String name) {
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
		return "CateBookDTO [id=" + id + ", name=" + name + "]";
	}
	
	
}
