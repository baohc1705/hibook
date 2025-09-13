package com.baohc.app.service.bill;

import java.util.List;

import com.baohc.app.dao.bill.BillDAO;
import com.baohc.app.dao.bill.BillDAOImpl;
import com.baohc.app.model.BillDTO;
import com.baohc.core.utils.BillCriteria;

public class BillServiceImpl implements BillService {
	private static BillServiceImpl instance = null;
	private BillDAO billDAO;
	
	private BillServiceImpl() {
		billDAO = BillDAOImpl.getInstance();
	}

	public static synchronized BillServiceImpl getInstance() {
		if (instance == null)
			instance = new BillServiceImpl();
		return instance;
	}
	@Override
	public List<BillDTO> getAll() {
		// TODO Auto-generated method stub
		return billDAO.getAll();
	}

	@Override
	public BillDTO findById(String id) {
		// TODO Auto-generated method stub
		return billDAO.findById(id);
	}

	@Override
	public int insert(BillDTO bill) {
		// TODO Auto-generated method stub
		return billDAO.insert(bill);
	}

	@Override
	public int insertAll(List<BillDTO> arr) {
		// TODO Auto-generated method stub
		return billDAO.insertAll(arr);
	}

	@Override
	public int delete(BillDTO bill) {
		// TODO Auto-generated method stub
		return billDAO.delete(bill);
	}

	@Override
	public int deleteAll(List<BillDTO> arr) {
		// TODO Auto-generated method stub
		return billDAO.deleteAll(arr);
	}
	
	@Override
	public int update(BillDTO bill) {
		
		return billDAO.update(bill);
	}
	
	@Override
	public List<BillDTO> getBillsByFilter(BillCriteria criteria) {
		// TODO Auto-generated method stub
		return billDAO.getBillsByFilter(criteria);
	}

	@Override
	public int countBillsByFilter(BillCriteria criteria) {
		// TODO Auto-generated method stub
		return billDAO.countBillsByFilter(criteria);
	}
	
	@Override
	public List<BillDTO> getBillsCriteria(BillCriteria criteria) {
		// TODO Auto-generated method stub
		return billDAO.getBillsCriteria(criteria);
	}

}
