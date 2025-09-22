package com.baohc.app.service.user;

import java.util.List;

import com.baohc.app.model.UserDTO;

public interface UserService {
	public List<UserDTO> getAllUser();

	public UserDTO find(UserDTO user);

	public int insert(UserDTO user);

	public int insertAll(List<UserDTO> arr);

	public int delete(UserDTO user);

	public int deleteAll(List<UserDTO> arr);

	public int update(UserDTO user);

	public UserDTO findByEmail(String email);

	public UserDTO login(UserDTO user);

	public int updateAvatar(UserDTO user);

	public int updatePassword(String user_id, String newPassword);
}
