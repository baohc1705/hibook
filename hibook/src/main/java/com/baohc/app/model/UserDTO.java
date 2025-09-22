package com.baohc.app.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class UserDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;
	private String username;
	private String email;
	private String password;
	private String fullname;
	private Date birthDate;
	private String avatar;
	private boolean account_locked;
	private int failed_login_attemps;
	private Timestamp last_failed_login;
	private boolean password_change_required;
	private Timestamp created_at;
	private Timestamp updated_at;
	private Timestamp last_login;
	private Set<RoleDTO> roles = new HashSet<RoleDTO>();
	public UserDTO() {
		super();
	}
	public UserDTO(String id, String username, String email, String password, String fullname, Date birthDate,
			String avatar, boolean account_locked, int failed_login_attemps,
			Timestamp last_failed_login, boolean password_change_required, Timestamp created_at, Timestamp updated_at,
			Timestamp last_login) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.fullname = fullname;
		this.birthDate = birthDate;
		this.avatar = avatar;
		this.account_locked = account_locked;
		this.failed_login_attemps = failed_login_attemps;
		this.last_failed_login = last_failed_login;
		this.password_change_required = password_change_required;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.last_login = last_login;
	}
	
	public UserDTO(String username, String email, String password) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		
	}
	
	public UserDTO(String id, String username, String email, String password, String fullname, Date birthDate,
			String avatar, boolean account_locked, int failed_login_attemps,
			Timestamp last_failed_login, boolean password_change_required, Timestamp created_at, Timestamp updated_at,
			Timestamp last_login, Set<RoleDTO> roles) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.fullname = fullname;
		this.birthDate = birthDate;
		this.avatar = avatar;
		
		this.account_locked = account_locked;
		this.failed_login_attemps = failed_login_attemps;
		this.last_failed_login = last_failed_login;
		this.password_change_required = password_change_required;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.last_login = last_login;
		this.roles = roles;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public boolean isAccount_locked() {
		return account_locked;
	}
	public void setAccount_locked(boolean account_locked) {
		this.account_locked = account_locked;
	}
	public int getFailed_login_attemps() {
		return failed_login_attemps;
	}
	public void setFailed_login_attemps(int failed_login_attemps) {
		this.failed_login_attemps = failed_login_attemps;
	}
	public Timestamp getLast_failed_login() {
		return last_failed_login;
	}
	public void setLast_failed_login(Timestamp last_failed_login) {
		this.last_failed_login = last_failed_login;
	}
	public boolean isPassword_change_required() {
		return password_change_required;
	}
	public void setPassword_change_required(boolean password_change_required) {
		this.password_change_required = password_change_required;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	public Timestamp getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}
	public Timestamp getLast_login() {
		return last_login;
	}
	public void setLast_login(Timestamp last_login) {
		this.last_login = last_login;
	}
	public Set<RoleDTO> getRoles() {
		return roles;
	}
	public void setRoles(Set<RoleDTO> roles) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", account_locked=" + account_locked + ", failed_login_attemps=" + failed_login_attemps
				+ ", last_failed_login=" + last_failed_login + ", roles=" + roles + "]";
	}
	
	public void addRole(RoleDTO role) {
		if (role != null)
			this.roles.add(role);
	}
	
	public void removeRole(RoleDTO role) {
		if (role != null) 
			this.roles.remove(role);
	}
	
	public void clearRoles() {
		this.roles.clear();
	}
	
    /**
     * Check if user has specific role
     */
    public boolean hasRole(String roleName) {
        if (roleName == null) return false;
        
        return roles.stream()
                   .anyMatch(role -> roleName.equalsIgnoreCase(role.getName()));
    }
    
    /**
     * Check if user has any of the specified roles
     */
    public boolean hasAnyRole(String[] roleNames) {
        if (roleNames == null || roleNames.length == 0) return false;
        
        for (String roleName : roleNames) {
            if (hasRole(roleName)) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * Check if user has specific permission
     */
    public boolean hasPermission(String permissionName) {
        if (permissionName == null) return false;
        
        return roles.stream()
                   .flatMap(role -> role.getPermissions().stream())
                   .anyMatch(permission -> permissionName.equalsIgnoreCase(permission.getName()));
    }
    
    /**
     * Get all permissions from all roles
     */
    public Set<String> getAllPermission() {
        Set<String> permissions = new HashSet<>();
        
        for (RoleDTO role : roles) {
            for (PermissionDTO permission : role.getPermissions()) {
                permissions.add(permission.getName());
            }
        }
        
        return permissions;
    }
    
    /**
     * Check if user is admin
     */
    public boolean isAdmin() {
        return hasRole("ADMIN");
    }
    
    /**
     * Check if user is moderator or admin
     */
    public boolean isManage() {
    	String[] mods = {"MANAGE", "ADMIN"};
        return hasAnyRole(mods);
    }
    
    /**
     * Check if account needs attention (locked, password change required, etc.)
     */
    public boolean needsAttention() {
        return account_locked || password_change_required;
    }
    
    /**
     * Get user display name (fallback to username if no full name)
     */
    public String getDisplayName() {
        return username != null ? username : "Unknown User";
    }
    
    public String getRoleNames() {
        return roles.stream()
                    .map(RoleDTO::getName)
                    .reduce((a, b) -> a + ", " + b)
                    .orElse("");
    }
}
