package com.baohc.app.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.model.CateUserDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.service.user.CateUserService;
import com.baohc.app.service.user.CateUserServiceImpl;
import com.baohc.core.utils.ConnectionKit;

public class UserDAOImpl implements UserDAO{
	
	private CateUserService cateUserService = CateUserServiceImpl.getInstance();
	
	private static UserDAOImpl instance = null;
	
	private UserDAOImpl() {}
	
	public static synchronized UserDAOImpl getInstance() {
		if (instance == null)
			instance = new UserDAOImpl();
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
				CateUserDTO tmp = cateUserService.find(new CateUserDTO(rs.getInt("cateUser_id"), ""));
				user.setCateUser(tmp);
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setFullname(rs.getString("fullname"));
				user.setBirthDate(rs.getDate("birthDate"));
				user.setAvatar(rs.getString("avatar"));
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
	public UserDTO find(UserDTO user) {
		UserDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			
			String query = "SELECT * FROM user WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getId());
			ResultSet rs = pmt.executeQuery();
			
			while (rs.next()) {
				UserDTO userTmp = new UserDTO();
				userTmp.setId(rs.getString("id"));
				CateUserDTO tmp = cateUserService.find(new CateUserDTO(rs.getInt("cateUser_id"), ""));
				userTmp.setCateUser(tmp);
				userTmp.setEmail(rs.getString("email"));
				userTmp.setPassword(rs.getString("password"));
				userTmp.setFullname(rs.getString("fullname"));
				userTmp.setBirthDate(rs.getDate("birthDate"));
				userTmp.setAvatar(rs.getString("avatar"));
				res = userTmp;
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
	public int insert(UserDTO user) {
		int res = 0;
		
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			
			String query = "INSERT INTO user(id, cateUser_id, email, password, fullname, birthDate) VALUES(?,?,?,?,?,?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getId());
			pmt.setInt(2, user.getCateUser().getId());
			pmt.setString(3, user.getEmail());
			pmt.setString(4, user.getPassword());
			pmt.setString(5, user.getFullname());
			pmt.setDate(6, user.getBirthDate());
			
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
	@Override
	public int insertAll(List<UserDTO> arr) {
		int dem = 0;
		for (UserDTO item : arr) {
			dem += this.insert(item);
		}
		return dem;
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
		int res = 0;
		
		try {
			Connection con = ConnectionKit.getConnection();
			
			if (con == null) return res;
			String query = "UPDATE user SET email=?, fullname=?, birthDate=?, avatar=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getEmail());
			pmt.setString(2, user.getFullname());
			pmt.setDate(3, user.getBirthDate());
			pmt.setString(4, user.getAvatar());
			pmt.setString(5, user.getId());
			
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
	@Override
	public UserDTO findByEmail(UserDTO user) {
		UserDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			
			String query = "SELECT * FROM user WHERE email=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getEmail());
			ResultSet rs = pmt.executeQuery();
			
			while (rs.next()) {
				UserDTO userTmp = new UserDTO();
				userTmp.setId(rs.getString("id"));
				CateUserDTO tmp = cateUserService.find(new CateUserDTO(rs.getInt("cateUser_id"), ""));
				userTmp.setCateUser(tmp);
				userTmp.setEmail(rs.getString("email"));
				userTmp.setPassword(rs.getString("password"));
				userTmp.setFullname(rs.getString("fullname"));
				userTmp.setBirthDate(rs.getDate("birthDate"));
				userTmp.setAvatar(rs.getString("avatar"));

				res = userTmp;
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
	public UserDTO login(UserDTO user) {
		UserDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;
			
			String query = "SELECT * FROM user WHERE email=? and password=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getEmail());
			pmt.setString(2, user.getPassword());
			ResultSet rs = pmt.executeQuery();
			
			while (rs.next()) {
				UserDTO userTmp = new UserDTO();
				userTmp.setId(rs.getString("id"));
				CateUserDTO tmp = cateUserService.find(new CateUserDTO(rs.getInt("cateUser_id"), ""));
				userTmp.setCateUser(tmp);
				userTmp.setEmail(rs.getString("email"));
				userTmp.setPassword(rs.getString("password"));
				userTmp.setFullname(rs.getString("fullname"));
				userTmp.setBirthDate(rs.getDate("birthDate"));
				userTmp.setAvatar(rs.getString("avatar"));
				res = userTmp;
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
	public int updateAvatar(UserDTO user) {
		int res = 0;
		
		try {
			Connection con = ConnectionKit.getConnection();
			
			if (con == null) return res;
			
			String query = "UPDATE user SET avatar=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getAvatar());
			pmt.setString(2, user.getId());
			
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
	public int updatePassword(String user_id, String newPassword) {
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
