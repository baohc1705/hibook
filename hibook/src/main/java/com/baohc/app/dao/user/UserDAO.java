package com.baohc.app.dao.user;

import java.util.List;

import com.baohc.app.model.UserDTO;

public interface UserDAO {
	public List<UserDTO> getData();

	public UserDTO find(UserDTO user);

	public int insert(UserDTO user);

	public int insertAll(List<UserDTO> arr);

	public int delete(UserDTO user);

	public int deleteAll(List<UserDTO> arr);

	public int update(UserDTO user);

	public UserDTO login(UserDTO user);

	public int updateAvatar(UserDTO user);

	public int updatePassword(String user_id, String newPassword);

	// Add for Authenticate
	public UserDTO findByUsername(String username);

	public UserDTO findByEmail(String email);

	public int insertAccount(UserDTO user, String password);

	public int updateFailedLoginAttempt(String username);

	public void resetFailedLoginAttempt(String username);

	public boolean isAccountLocked(String username);

	public void unlockAccount(String username);

	public void updateLastLogin(String id);

	public int createAccount(UserDTO newUser, String password);
}
