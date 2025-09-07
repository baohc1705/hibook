package com.baohc.app.service.promotion;

import java.util.List;

import com.baohc.app.dao.promotion.PromotionDAO;
import com.baohc.app.dao.promotion.PromotionDAOImpl;
import com.baohc.app.model.PromotionDTO;

public class PromotionServiceImpl implements PromotionService {
    private PromotionDAO promotionDAO;
    private static PromotionServiceImpl instance = null;

    private PromotionServiceImpl() {
        promotionDAO = PromotionDAOImpl.getInstance();
    }

    public static synchronized PromotionServiceImpl getInstance() {
        if (instance == null) instance = new PromotionServiceImpl();
        return instance;
    }

    @Override
    public List<PromotionDTO> getAllPromotions() {
        return promotionDAO.getAllPromotions();
    }

    @Override
    public PromotionDTO findById(int id) {
        return promotionDAO.findById(id);
    }

    @Override
    public int insert(PromotionDTO promotion) {
        return promotionDAO.insert(promotion);
    }

    @Override
    public int insertAll(List<PromotionDTO> arr) {
        return promotionDAO.insertAll(arr);
    }

    @Override
    public int delete(PromotionDTO promotion) {
        return promotionDAO.delete(promotion);
    }

    @Override
    public int deleteAll(List<PromotionDTO> arr) {
        return promotionDAO.deleteAll(arr);
    }

    @Override
    public int update(PromotionDTO promotion) {
        return promotionDAO.update(promotion);
    }
    
    @Override
    public PromotionDTO findByName(String name) {
    	
    	return promotionDAO.findByName(name);
    }
}
