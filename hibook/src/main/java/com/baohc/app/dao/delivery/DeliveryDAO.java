package com.baohc.app.dao.delivery;

import java.util.List;

import com.baohc.app.model.DeliveryDTO;

public interface DeliveryDAO {
	public List<DeliveryDTO> getAll();
	
	public DeliveryDTO findById(int id);
}
