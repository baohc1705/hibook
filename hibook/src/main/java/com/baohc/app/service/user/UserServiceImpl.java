package com.baohc.app.service.user;

import java.util.List;

import com.baohc.app.dao.user.UserDAO;
import com.baohc.app.dao.user.UserDAOImpl;
import com.baohc.app.model.UserDTO;

public class UserServiceImpl implements UserService {
	private static UserServiceImpl instance = null;
	private UserDAO userDAO;
	
	private UserServiceImpl() {
		this.userDAO = UserDAOImpl.getInstance();
	}
	
	public static synchronized UserServiceImpl getInstance() {
		if (instance == null) instance =  new UserServiceImpl();
		return instance;	
	}
	
	@Override
	public List<UserDTO> getAllUser() {
		// TODO: validation
		return this.userDAO.getData();
	}

	@Override
	public UserDTO find(UserDTO user) {
		// TODO: validation
		return this.userDAO.find(user);
	}

	@Override
	public int insert(UserDTO user) {
		
		return this.userDAO.insert(user);
	}

	@Override
	public int insertAll(List<UserDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(UserDTO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(List<UserDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(UserDTO user) {
		
		return userDAO.update(user);
	}

	@Override
	public UserDTO findByEmail(UserDTO user) {
		// TODO Auto-generated method stub
		return this.userDAO.findByEmail(user);
	}

	@Override
	public UserDTO login(UserDTO user) {
		// TODO Auto-generated method stub
		return this.userDAO.login(user);
	}

	@Override
	public int updateAvatar(UserDTO user) {
		// TODO Auto-generated method stub
		return this.userDAO.updateAvatar(user);
	}

	@Override
	public int updatePassword(String user_id, String newPassword) {
		// TODO Auto-generated method stub
		return this.userDAO.updatePassword(user_id, newPassword);
	}
	
}
