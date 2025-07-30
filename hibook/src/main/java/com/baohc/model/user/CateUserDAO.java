package com.baohc.model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.baohc.utils.ConnectionKit;

public class CateUserDAO {
	private static CateUserDAO instance = null;
	private CateUserDAO() {}
	public static synchronized CateUserDAO getInstance() {
		if (instance == null)
			instance = new CateUserDAO();
		return instance;
	}
	
	public List<CateUserDTO> getAll() {
		List<CateUserDTO> list = new ArrayList<CateUserDTO>();
		try {
			Connection con = ConnectionKit.getConnection();
			
			if (con == null) return list;
			
			String query = "SELECT * FROM cate_user";
			PreparedStatement pmt = con.prepareStatement(query);
			ResultSet rs = pmt.executeQuery();
			
			while(rs.next()) {
				CateUserDTO dto = new CateUserDTO();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				
				list.add(dto);
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
			
		return list;
	}
}
