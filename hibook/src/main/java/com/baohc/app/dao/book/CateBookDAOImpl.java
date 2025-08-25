package com.baohc.app.dao.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.model.CateBookDTO;
import com.baohc.core.utils.ConnectionKit;

public class CateBookDAOImpl implements CateBookDAO {
	
	private static CateBookDAOImpl instance = null;
	private CateBookDAOImpl() {}
	public static synchronized CateBookDAOImpl getInstance() {
		if (instance == null) instance = new CateBookDAOImpl();
		return instance;
	}

	@Override
	public List<CateBookDTO> getAllCateBook() {
		List<CateBookDTO> list = new ArrayList<CateBookDTO>();
		
		try {
			Connection con = ConnectionKit.getConnection();
			if( con == null) 
				return list;
			String query = "SELECT * FROM cate_book";
			PreparedStatement pmt = con.prepareStatement(query);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				CateBookDTO cate = new CateBookDTO();
				cate.setId(rs.getInt("id"));
				cate.setName(rs.getString("name"));
				list.add(cate);
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

	@Override
	public CateBookDTO findById(int id) {
		CateBookDTO res = null;
		
		try {
			Connection con = ConnectionKit.getConnection();
			if( con == null) 
				return res;
			String query = "SELECT * FROM cate_book WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, id);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				CateBookDTO cate = new CateBookDTO();
				cate.setId(rs.getInt("id"));
				cate.setName(rs.getString("name"));
				res = cate;
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
	public int insert(CateBookDTO catebook) {
		int res = 0;
		
		try {
			Connection con = ConnectionKit.getConnection();
			if( con == null) 
				return res;
			String query = "INSERT INTO cate_book (id,name) VALUES (?,?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, catebook.getId());
			pmt.setString(2, catebook.getName());
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
	public int insertAll(List<CateBookDTO> arr) {
		int dem = 0;
		for (CateBookDTO item : arr) {
			dem += insert(item);
		}
		return dem;
	}

	@Override
	public int delete(CateBookDTO catebook) {
		int res = 0;
		
		try {
			Connection con = ConnectionKit.getConnection();
			if( con == null) 
				return res;
			String query = "DELETE FROM cate_book WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, catebook.getId());
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
	public int deleteAll(List<CateBookDTO> arr) {
		int dem = 0;
		for(CateBookDTO item : arr) {
			dem += delete(item);
		}
		return dem;
	}

	@Override
	public int update(CateBookDTO catebook) {
		int res = 0;
		
		try {
			Connection con = ConnectionKit.getConnection();
			if( con == null) 
				return res;
			String query = "UPDATE cate_book SET name=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, catebook.getName());
			pmt.setInt(2, catebook.getId());
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
