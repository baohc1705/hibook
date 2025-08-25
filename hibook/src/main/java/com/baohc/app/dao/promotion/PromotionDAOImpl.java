package com.baohc.app.dao.promotion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.model.PromotionDTO;
import com.baohc.core.utils.ConnectionKit;

public class PromotionDAOImpl implements PromotionDAO {

	private static PromotionDAOImpl instance = null;

	private PromotionDAOImpl() {}

	public static synchronized PromotionDAOImpl getInstance() {
		if (instance == null) instance = new PromotionDAOImpl();
		return instance;
	}

	@Override
	public List<PromotionDTO> getAllPromotions() {
		List<PromotionDTO> list = new ArrayList<>();

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return list;

			String query = "SELECT * FROM promotion";
			PreparedStatement pmt = con.prepareStatement(query);
			ResultSet rs = pmt.executeQuery();

			while (rs.next()) {
				PromotionDTO promo = new PromotionDTO();
				promo.setId(rs.getInt("id"));
				promo.setName(rs.getString("name"));
				promo.setDiscountPercent(rs.getInt("discountPercent"));
				promo.setStartDate(rs.getDate("startDate"));
				promo.setEndDate(rs.getDate("endDate"));
				list.add(promo);
			}

			if (rs != null) rs.close();
			if (pmt != null) pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public PromotionDTO findById(int id) {
		PromotionDTO res = null;

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;

			String query = "SELECT * FROM promotion WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, id);
			ResultSet rs = pmt.executeQuery();

			while (rs.next()) {
				PromotionDTO promo = new PromotionDTO();
				promo.setId(rs.getInt("id"));
				promo.setName(rs.getString("name"));
				promo.setDiscountPercent(rs.getInt("discountPercent"));
				promo.setStartDate(rs.getDate("startDate"));
				promo.setEndDate(rs.getDate("endDate"));
				res = promo;
			}

			if (rs != null) rs.close();
			if (pmt != null) pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int insert(PromotionDTO promotion) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;

			String query = "INSERT INTO promotion (id, name, discountPercent, startDate, endDate) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, promotion.getId());
			pmt.setString(2, promotion.getName());
			pmt.setInt(3, promotion.getDiscountPercent());
			pmt.setDate(4, promotion.getStartDate());
			pmt.setDate(5, promotion.getEndDate());

			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;

			if (pmt != null) pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int insertAll(List<PromotionDTO> arr) {
		int dem = 0;
		for (PromotionDTO item : arr) {
			dem += insert(item);
		}
		return dem;
	}

	@Override
	public int delete(PromotionDTO promotion) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;

			String query = "DELETE FROM promotion WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, promotion.getId());

			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;

			if (pmt != null) pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int deleteAll(List<PromotionDTO> arr) {
		int dem = 0;
		for (PromotionDTO item : arr) {
			dem += delete(item);
		}
		return dem;
	}

	@Override
	public int update(PromotionDTO promotion) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null) return res;

			String query = "UPDATE promotion SET name=?, discountPercent=?, startDate=?, endDate=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, promotion.getName());
			pmt.setInt(2, promotion.getDiscountPercent());
			pmt.setDate(3, promotion.getStartDate());
			pmt.setDate(4, promotion.getEndDate());
			pmt.setInt(5, promotion.getId());

			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;

			if (pmt != null) pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
