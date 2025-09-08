package com.baohc.app.service.bill;

import java.util.List;

import com.baohc.app.dao.bill.BillDetailDAO;
import com.baohc.app.dao.bill.BillDetailDAOImpl;
import com.baohc.app.model.BillDTO;
import com.baohc.app.model.BillDetailDTO;
import com.baohc.app.model.BookDTO;

public class BillDetailServiceImpl implements BillDetailService{
	private static BillDetailServiceImpl instance = null;
	private BillDetailDAO billDetailDAO;
	private BillDetailServiceImpl() {
		billDetailDAO = BillDetailDAOImpl.getInstance();
	}

	public static synchronized BillDetailServiceImpl getInstance() {
		if (instance == null)
			instance = new BillDetailServiceImpl();
		return instance;
	}

	@Override
	public List<BillDetailDTO> getAll() {
		// TODO Auto-generated method stub
		return billDetailDAO.getAll();
	}

	@Override
	public BillDetailDTO find(String billId, String bookId) {
		// TODO Auto-generated method stub
		return billDetailDAO.find(billId, bookId);
	}

	@Override
	public BillDetailDTO findByBill(BillDTO bill) {
		// TODO Auto-generated method stub
		return billDetailDAO.findByBill(bill);
	}

	@Override
	public BillDetailDTO findByBook(BookDTO book) {
		// TODO Auto-generated method stub
		return billDetailDAO.findByBook(book);
	}

	@Override
	public int insert(BillDetailDTO billDetail) {
		// TODO Auto-generated method stub
		return billDetailDAO.insert(billDetail);
	}

	@Override
	public int delete(BillDetailDTO billDetail) {
		// TODO Auto-generated method stub
		return billDetailDAO.delete(billDetail);
	}

	@Override
	public int update(BillDetailDTO billDetail) {
		// TODO Auto-generated method stub
		return update(billDetail);
	}

}
