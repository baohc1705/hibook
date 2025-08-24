package com.baohc.app.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.model.CateUserDTO;
import com.baohc.core.utils.ConnectionKit;


public class CateUserDAOImpl implements CateUserDAO {
	private static CateUserDAOImpl instance = null;
	private CateUserDAOImpl() {}
	public static synchronized CateUserDAOImpl getInstance() {
		if (instance == null)
			instance = new CateUserDAOImpl();
		return instance;
	}
	
	@Override
	public List<CateUserDTO> getData() {
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
			e.printStackTrace();
		}
			
		return list;
	}

	@Override
	public CateUserDTO find(CateUserDTO cate) {
		CateUserDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			
			if (con == null) return res;
			
			String query = "SELECT * FROM cate_user WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, cate.getId());
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				CateUserDTO cateUserDTO = new CateUserDTO();
				cateUserDTO.setId(rs.getInt("id"));
				cateUserDTO.setName(rs.getString("name"));
				
				res = cateUserDTO;
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
	public int insert(CateUserDTO cate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(List<CateUserDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(CateUserDTO cate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(List<CateUserDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(CateUserDTO cate) {
		// TODO Auto-generated method stub
		return 0;
	}

}
