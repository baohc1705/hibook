package com.baohc.app.service.delivery;

import java.util.List;

import com.baohc.app.dao.delivery.DeliveryDAO;
import com.baohc.app.dao.delivery.DeliveryDAOImpl;
import com.baohc.app.model.DeliveryDTO;

public class DeliveryServiceImpl implements DeliveryService {
	private static DeliveryServiceImpl instance = null;
	private DeliveryDAO deliveryDAO;

	private DeliveryServiceImpl() {
		deliveryDAO = DeliveryDAOImpl.getInstance();
	}

	public static synchronized DeliveryServiceImpl getInstance() {
		if (instance == null)
			instance = new DeliveryServiceImpl();
		return instance;
	}

	@Override
	public List<DeliveryDTO> getAll() {
		// TODO Auto-generated method stub
		return deliveryDAO.getAll();
	}

	@Override
	public DeliveryDTO findById(int id) {
		// TODO Auto-generated method stub
		return deliveryDAO.findById(id);
	}
}
