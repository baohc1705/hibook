package com.baohc.app.service.user;

import com.baohc.app.dao.user.UserTokenDAO;
import com.baohc.app.dao.user.UserTokenDAOImpl;
import com.baohc.app.model.UserTokenDTO;

public class UserTokenServiceImpl implements UserTokenService{
	
	private static UserTokenServiceImpl instance = null;
	
	private UserTokenDAO userTokenDAO;
	
	private UserTokenServiceImpl() {
		userTokenDAO = UserTokenDAOImpl.getInstance();
	}
	
	public static synchronized UserTokenServiceImpl getInstance() {
		if (instance == null) instance = new UserTokenServiceImpl();
		return instance;
	}
	
	@Override
	public int saveToken(UserTokenDTO token) {
		//TODO: tạo các validate
		return userTokenDAO.saveToken(token);
	}
	
	@Override
	public String getSaltByUserId(String user_id) {
		// TODO Auto-generated method stub
		return userTokenDAO.getSaltByUserId(user_id);
	}
	@Override
	public UserTokenDTO findValidToken(String user_id, String token) {
		// TODO Auto-generated method stub
		return userTokenDAO.findValidToken(user_id, token);
	}
	
	@Override
	public void maskUsed(int token_id) {
		userTokenDAO.maskUsed(token_id);
		
	}
	@Override
	public String getUserNotVerify(String id) {
		
		return userTokenDAO.getUserNotVerify(id);
	}
}
