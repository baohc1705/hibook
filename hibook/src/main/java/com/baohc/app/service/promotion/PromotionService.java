package com.baohc.app.service.promotion;

import java.util.List;
import com.baohc.app.model.PromotionDTO;

public interface PromotionService {
	public List<PromotionDTO> getAllPromotions();

	public PromotionDTO findById(int id);

	public int insert(PromotionDTO promotion);

	public int insertAll(List<PromotionDTO> arr);

	public int delete(PromotionDTO promotion);

	public int deleteAll(List<PromotionDTO> arr);

	public int update(PromotionDTO promotion);

	public PromotionDTO findByName(String name);
}
