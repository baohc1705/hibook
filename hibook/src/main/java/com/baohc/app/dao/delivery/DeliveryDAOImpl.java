package com.baohc.app.dao.delivery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.dao.bill.BillDAOImpl;
import com.baohc.app.model.DeliveryDTO;
import com.baohc.core.utils.ConnectionKit;

public class DeliveryDAOImpl implements DeliveryDAO {
	private static DeliveryDAOImpl instance = null;

	private DeliveryDAOImpl() {
	}

	public static synchronized DeliveryDAOImpl getInstance() {
		if (instance == null)
			instance = new DeliveryDAOImpl();
		return instance;
	}

	@Override
	public List<DeliveryDTO> getAll() {
		List<DeliveryDTO> deliveries = new ArrayList<DeliveryDTO>();
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "SELECT * FROM delivery ";
			PreparedStatement pmt = conn.prepareStatement(sql);
			ResultSet rs = pmt.executeQuery();

			while (rs.next()) {
				DeliveryDTO deliveryDTO = new DeliveryDTO();
				deliveryDTO.setId(rs.getInt("id"));
				deliveryDTO.setName(rs.getString("name"));
				deliveryDTO.setPrice(rs.getDouble("price"));
				deliveries.add(deliveryDTO);
			}

			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deliveries;
	}

	@Override
	public DeliveryDTO findById(int id) {
		DeliveryDTO res = null;
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "SELECT * FROM delivery WHERE id=? ";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setInt(1, id);
			ResultSet rs = pmt.executeQuery();

			while (rs.next()) {
				DeliveryDTO deliveryDTO = new DeliveryDTO();
				deliveryDTO.setId(rs.getInt("id"));
				deliveryDTO.setName(rs.getString("name"));
				deliveryDTO.setPrice(rs.getDouble("price"));
				res = deliveryDTO;
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

}
