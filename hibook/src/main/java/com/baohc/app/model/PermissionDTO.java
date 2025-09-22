package com.baohc.app.model;


import java.io.Serializable;
import java.sql.Timestamp;
/**
 * Class mapping data in database
 */
public class PermissionDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String resource;
	private String action;
	private String description;
	private Timestamp createdAt;
	public PermissionDTO() {
		super();
	}
	public PermissionDTO(int id, String name, String resource, String action, String description, Timestamp createdAt) {
		super();
		this.id = id;
		this.name = name;
		this.resource = resource;
		this.action = action;
		this.description = description;
		this.createdAt = createdAt;
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
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	@Override
	public String toString() {
		return "PermissionDTO [id=" + id + ", name=" + name + ", resource=" + resource + ", action=" + action + "]";
	}
	
	
}
