package com.baohc.app.service.delivery;

import java.util.List;

import com.baohc.app.model.DeliveryDTO;

public interface DeliveryService {
	public List<DeliveryDTO> getAll();
	
	public DeliveryDTO findById(int id);
}
