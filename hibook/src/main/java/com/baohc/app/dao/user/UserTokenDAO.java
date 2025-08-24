package com.baohc.app.dao.user;

import com.baohc.app.model.UserTokenDTO;

public interface UserTokenDAO {
	public int saveToken(UserTokenDTO token);
	public String getSaltByUserId(String user_id);
	public UserTokenDTO findValidToken(String user_id, String token);
	public void maskUsed(int token_id);
	public String getUserNotVerify(String id);
}
