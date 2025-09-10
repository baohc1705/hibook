package com.baohc.app.dao.bill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.model.BillDTO;
import com.baohc.app.model.DeliveryDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.service.delivery.DeliveryService;
import com.baohc.app.service.delivery.DeliveryServiceImpl;
import com.baohc.app.service.user.UserService;
import com.baohc.app.service.user.UserServiceImpl;
import com.baohc.core.utils.BillCriteria;
import com.baohc.core.utils.ConnectionKit;

public class BillDAOImpl implements BillDAO {

	private static BillDAOImpl instance = null;

	private BillDAOImpl() {
	}

	public static synchronized BillDAOImpl getInstance() {
		if (instance == null)
			instance = new BillDAOImpl();
		return instance;
	}

	@Override
	public List<BillDTO> getAll() {
		List<BillDTO> bills = new ArrayList<BillDTO>();
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "SELECT * FROM bill";
			PreparedStatement pmt = conn.prepareStatement(sql);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				BillDTO bill = mapToResultSet(rs);
				if (bill != null)
					bills.add(bill);
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bills;
	}

	@Override
	public BillDTO findById(String id) {
		BillDTO res = null;
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "SELECT * FROM bill WHERE id=? ";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setString(1, id);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				BillDTO bill = mapToResultSet(rs);
				if (bill != null)
					res = bill;
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int insert(BillDTO bill) {
		int res = 0;

		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "INSERT INTO bill ("
					+ "id, user_id, delivery_id, isDisable, totalPrice, fullname, email, phone, "
					+ "city, district, ward, shippingAddress, note, status, pay_method) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setString(1, bill.getId()); 
			if (bill.getUser() != null)
				pmt.setString(2, bill.getUser().getId());
			else
				pmt.setString(2, null);
			pmt.setInt(3, bill.getDelivery().getId());
			pmt.setBoolean(4, bill.isDisable());
			pmt.setDouble(5, bill.getTotalPrice());
			pmt.setString(6, bill.getFullname());
			pmt.setString(7, bill.getEmail());
			pmt.setString(8, bill.getPhone());
			pmt.setString(9, bill.getCity());
			pmt.setString(10, bill.getDistrict());
			pmt.setString(11, bill.getWard());
			pmt.setString(12, bill.getShipAddress());
			pmt.setString(13, bill.getNote());
			pmt.setString(14, bill.getStatus());
			pmt.setString(15, bill.getPayMethod());
			
			int row = pmt.executeUpdate();
			
			res = row > 0 ? 1: 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int insertAll(List<BillDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(BillDTO bill) {
		int res = 0;
		
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "DELETE FROM bill WHERE id=? ";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setString(1, bill.getId());
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteAll(List<BillDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BillDTO> getBillsByFilter(BillCriteria criteria) {
		List<BillDTO> bills = new ArrayList<BillDTO>();
		
		QueryBuilder builder = new QueryBuilder();
		
		builder.buildBillQueryWithFilter(criteria);
		
		String sql = builder.getSelectQuery();
		
		List<Object> params = builder.getParametersWithPagination(criteria);
		
		try {
			Connection conn = ConnectionKit.getConnection();
			PreparedStatement pmt = conn.prepareStatement(sql);
			
			for (int i = 0; i < params.size(); i++) {
				pmt.setObject(i + 1, params.get(i));
			}
			
			ResultSet rs = pmt.executeQuery();
			
			while (rs.next()) {
				BillDTO bill = mapToResultSet(rs);
				if (bill != null)
					bills.add(bill);
			}
			
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bills;
	}

	@Override
	public int countBillsByFilter(BillCriteria criteria) {
		// TODO Auto-generated method stub
		return 0;
	}

	private BillDTO mapToResultSet(ResultSet rs) throws SQLException {
		BillDTO bill = new BillDTO();
		UserService userService = UserServiceImpl.getInstance();
		DeliveryService deliveryService = DeliveryServiceImpl.getInstance();
		try {

			bill.setId(rs.getString("id"));

	        String userId = rs.getString("user_id");
	        if (userId == null || userId.trim().isEmpty()) {
	           
	            bill.setUser(null); 
	        } else {
	            UserDTO userTmp = new UserDTO();
	            userTmp.setId(userId);
	            bill.setUser(userService.find(userTmp));
	        }

	        DeliveryDTO deliveryTmp = deliveryService.findById(rs.getInt("delivery_id"));
	        if (deliveryTmp != null) {
	            bill.setDelivery(deliveryTmp);
	        } else {
	            bill.setDelivery(null);
	        }
			bill.setDisable(rs.getBoolean("isDisable"));
			bill.setTotalPrice(rs.getDouble("totalPrice"));
			bill.setFullname(rs.getString("fullname"));
			bill.setEmail(rs.getString("email"));
			bill.setPhone(rs.getString("phone"));
			bill.setCity(rs.getString("city"));
			bill.setDistrict(rs.getString("district"));
			bill.setWard(rs.getString("ward"));
			bill.setShipAddress(rs.getString("shippingAddress"));
			bill.setNote(rs.getString("note"));
			bill.setCreateAt(rs.getTimestamp("createAt"));
			bill.setStatus(rs.getString("status"));
			bill.setPayMethod(rs.getString("pay_method"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bill;
	}
}
