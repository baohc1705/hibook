package com.baohc.app.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class RoleDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String description;
	private Timestamp createdAt;
	private Set<PermissionDTO> permissions = new HashSet<PermissionDTO>(); // Lưu các phần tử không trùng nhau
	public RoleDTO() {
		super();
	}
	public RoleDTO(int id, String name, String description, Timestamp createdAt, Set<PermissionDTO> permissions) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.createdAt = createdAt;
		this.permissions = permissions;
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
	public Set<PermissionDTO> getPermissions() {
		return permissions;
	}
	public void setPermissions(Set<PermissionDTO> permissions) {
		this.permissions = permissions;
	}
	
	public void addPermission(PermissionDTO permissionDTO) {
		this.permissions.add(permissionDTO);
	}
	@Override
	public String toString() {
		return "RoleDTO [id=" + id + ", name=" + name + ", permissions=" + permissions + "]";
	}
	
}
