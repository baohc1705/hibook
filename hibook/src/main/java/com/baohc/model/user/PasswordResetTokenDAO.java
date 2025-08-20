package com.baohc.model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.baohc.utils.ConnectionKit;

public class PasswordResetTokenDAO {
	private static PasswordResetTokenDAO instance = null;
	private PasswordResetTokenDAO () {}
	public static synchronized PasswordResetTokenDAO getInstance() {
		if (instance == null)
			instance = new PasswordResetTokenDAO();
		return instance;
	}
	// save token in db
	public int saveToken(PasswordResetTokenDTO t) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			
			String query = "INSERT INTO password_reset_token(user_id, token, expiry_time, salt, used) VALUES(?,?,?,?,?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, t.getUser_id());
			pmt.setString(2, t.getToken());
			pmt.setTimestamp(3, t.getExpiry());
			pmt.setString(4, t.getSalt());
			pmt.setInt(5, t.isUsed() ? 1 : 0);
			
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
	
	public String getSaltByUserID(String user_id) {
		String res = "";
		try {
			Connection con = ConnectionKit.getConnection();
			if (con==null) return res;
			String query = "SELECT salt FROM password_reset_token WHERE user_id=? ORDER BY createAt DESC LIMIT 1";
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
	
	public PasswordResetTokenDTO findValidToken(String user_id, String hashedToken) {
		PasswordResetTokenDTO res = null;
		
		try {
			Connection con = ConnectionKit.getConnection();
			if (con==null) return res;
			
			String query = "SELECT * FROM password_reset_token WHERE user_id=? AND token=? AND used=0 AND expiry_time > NOW() ORDER BY createAt DESC";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user_id);
			pmt.setString(2, hashedToken);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				PasswordResetTokenDTO prt = new PasswordResetTokenDTO();
				prt.setId(rs.getInt("id"));
				prt.setUser_id(rs.getString("user_id"));
				prt.setToken(rs.getString("token"));
				prt.setExpiry(rs.getTimestamp("expiry_time"));
				prt.setSalt(rs.getString("salt"));
				prt.setUsed(rs.getInt("used") == 1 ? true : false);
				prt.setCreateAt(rs.getTimestamp("createAt"));
				
				res = prt;
			}
			
			if (rs != null) rs.close();
			if (pmt != null) pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}
	
	public void markAsUsed(int token_id) {
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return;
			String query = "UPDATE password_reset_token SET used=1 WHERE id=?";
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
}
