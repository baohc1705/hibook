package com.baohc.model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.baohc.model.DAOInterface;
import com.baohc.utils.ConnectionKit;

public class UserDAO implements DAOInterface<UserDTO> {
	private static UserDAO instance = null;
	private UserDAO() {}
	public static synchronized UserDAO getInstance() {
		if (instance == null)
			instance = new UserDAO();
		return instance;
	}
	
	@Override
	public List<UserDTO> getData() {
		List<UserDTO> list = new ArrayList<UserDTO>();
		
		try {
			Connection con = ConnectionKit.getConnection();
			
			if (con == null) return list;
			
			String query = "SELECT * FROM user";
			
			PreparedStatement pmt = con.prepareStatement(query);
			ResultSet rs = pmt.executeQuery();
			
			while (rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("id"));
				CateUserDTO tmp = CateUserDAO.getInstance().find(new CateUserDTO(rs.getInt("cateUser_id"), ""));
				user.setCateUser(tmp);
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setFullname(rs.getString("fullname"));
				user.setBirthDate(rs.getDate("birthDate"));
				
				list.add(user);
			}
			
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
		
	}

	@Override
	public UserDTO find(UserDTO o) {
		UserDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			
			String query = "SELECT * FROM user WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, o.getId());
			ResultSet rs = pmt.executeQuery();
			
			while (rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("id"));
				CateUserDTO tmp = CateUserDAO.getInstance().find(new CateUserDTO(rs.getInt("cateUser_id"), ""));
				user.setCateUser(tmp);
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setFullname(rs.getString("fullname"));
				user.setBirthDate(rs.getDate("birthDate"));
				user.setAvatar(rs.getString("avatar"));
				res = user;
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
	 
	public UserDTO findByEmail(UserDTO o) {
		UserDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			
			String query = "SELECT * FROM user WHERE email=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, o.getEmail());
			ResultSet rs = pmt.executeQuery();
			
			while (rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("id"));
				CateUserDTO tmp = CateUserDAO.getInstance().find(new CateUserDTO(rs.getInt("cateUser_id"), ""));
				user.setCateUser(tmp);
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setFullname(rs.getString("fullname"));
				user.setBirthDate(rs.getDate("birthDate"));
				
				res = user;
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
	
	public UserDTO login(UserDTO u) {
		UserDTO res = null;
		
		try {
			Connection con = ConnectionKit.getConnection();
			
			if(con == null)
				return res;
			
			String query = "SELECT * FROM user WHERE email=? and password=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, u.getEmail());
			pmt.setString(2, u.getPassword());
			ResultSet rs = pmt.executeQuery();
			while(rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("id"));
				CateUserDTO tmp = CateUserDAO.getInstance().find(new CateUserDTO(rs.getInt("cateUser_id"), ""));
				user.setCateUser(tmp);
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setFullname(rs.getString("fullname"));
				user.setBirthDate(rs.getDate("birthDate"));
				user.setAvatar(rs.getString("avatar"));
				res = user;
			}
			
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insert(UserDTO o) {
		int res = 0;
		
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			
			String query = "INSERT INTO user(id, cateUser_id, email, password, fullname, birthDate) VALUES(?,?,?,?,?,?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, o.getId());
			pmt.setInt(2, o.getCateUser().getId());
			pmt.setString(3, o.getEmail());
			pmt.setString(4, o.getPassword());
			pmt.setString(5, o.getFullname());
			pmt.setDate(6, o.getBirthDate());
			
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
	public int insertAll(List<UserDTO> arr) {
		int dem = 0;
		for (UserDTO item : arr) {
			dem += this.insert(item);
		}
		return dem;
	}

	@Override
	public int delete(UserDTO o) {
		
		return 0;
	}

	@Override
	public int deleteAll(List<UserDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int update(UserDTO o) {
		int res = 0;
		
		try {
			Connection con = ConnectionKit.getConnection();
			
			if (con == null) return res;
			String query = "UPDATE user SET email=?, fullname=?, birthDate=?, avatar=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, o.getEmail());
			pmt.setString(2, o.getFullname());
			pmt.setDate(3, o.getBirthDate());
			pmt.setString(4, o.getAvatar());
			pmt.setString(5, o.getId());
			
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int updateAvatar(UserDTO o) {
		int res = 0;
		
		try {
			Connection con = ConnectionKit.getConnection();
			
			if (con == null) return res;
			
			String query = "UPDATE user SET avatar=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, o.getAvatar());
			pmt.setString(2, o.getId());
			
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
	
	public int saveResetToken(String user_id, String token, Timestamp expiry) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "INSERT INTO password_reset_token(user_id, token, expiry) VALUES (?,?,?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user_id);
			pmt.setString(2, token);
			pmt.setTimestamp(3, expiry);
			
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public UserDTO findUserByToken(PasswordResetTokenDTO token) {
		UserDTO res = null;
		
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			
			String query = "SELECT * FROM user u JOIN password_reset_token t on u.id = t.user_id WHERE t.token=? AND t.expiry > NOW()";	
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, token.getToken());
			ResultSet rs = pmt.executeQuery();
			
			while(rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("id"));
				CateUserDTO tmp = CateUserDAO.getInstance().find(new CateUserDTO(rs.getInt("cateUser_id"), ""));
				user.setCateUser(tmp);
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setFullname(rs.getString("fullname"));
				user.setBirthDate(rs.getDate("birthDate"));
				user.setAvatar(rs.getString("avatar"));
				res = user;
			}
			
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int updatePasswordByToken(String user_id, String newPassword) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			String query = "UPDATE user SET password=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, newPassword);
			pmt.setString(2, user_id);
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}
