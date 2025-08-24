package com.baohc.app.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.baohc.app.model.UserTokenDTO;
import com.baohc.core.utils.ConnectionKit;


public class UserTokenDAOImpl implements UserTokenDAO {

	private static UserTokenDAOImpl instance = null;

	private UserTokenDAOImpl() {
	}

	public static synchronized UserTokenDAOImpl getInstance() {
		if (instance == null)
			instance = new UserTokenDAOImpl();
		return instance;
	}

	@Override
	public int saveToken(UserTokenDTO token) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "INSERT INTO user_token(user_id, token, expiry_time, salt, used) VALUES(?,?,?,?,?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, token.getUser_id());
			pmt.setString(2, token.getToken());
			pmt.setTimestamp(3, token.getExpiry());
			pmt.setString(4, token.getSalt());
			pmt.setInt(5, token.isUsed() ? 1 : 0);

			int row = pmt.executeUpdate();

			res = row > 0 ? 1 : 0;

			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public String getSaltByUserId(String user_id) {
		String res = "";
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "SELECT salt FROM user_token WHERE user_id=? ORDER BY createAt DESC LIMIT 1";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user_id);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				res = rs.getString("salt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public UserTokenDTO findValidToken(String user_id, String token) {
		UserTokenDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;

			String query = "SELECT * FROM user_token WHERE user_id=? AND token=? AND used=0 AND expiry_time > NOW() ORDER BY createAt DESC";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user_id);
			pmt.setString(2, token);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				UserTokenDTO utmp = new UserTokenDTO();
				utmp.setId(rs.getInt("id"));
				utmp.setUser_id(rs.getString("user_id"));
				utmp.setToken(rs.getString("token"));
				utmp.setExpiry(rs.getTimestamp("expiry_time"));
				utmp.setSalt(rs.getString("salt"));
				utmp.setUsed(rs.getInt("used") == 1 ? true : false);
				utmp.setCreateAt(rs.getTimestamp("createAt"));

				res = utmp;
			}

			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public void maskUsed(int token_id) {
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return;
			String query = "UPDATE user_token SET used=1 WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, token_id);
			int row = pmt.executeUpdate();
			pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@Override
	public String getUserNotVerify(String id) {
		String res = "";
		
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			String query = "SELECT user_id FROM user_token WHERE user_id=? AND used=0 AND expiry_time > NOW() ORDER BY createAt DESC LIMIT 1";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, id);
			ResultSet rs = pmt.executeQuery();
			if (rs.next())
				res = rs.getString("user_id");
			if(rs != null)
				rs.close();
			if(pmt != null) 
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return res;
	}
}
