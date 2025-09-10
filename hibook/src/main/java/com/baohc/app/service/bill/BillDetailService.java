package com.baohc.app.service.bill;

import java.util.List;

import com.baohc.app.model.BillDTO;
import com.baohc.app.model.BillDetailDTO;
import com.baohc.app.model.BookDTO;

public interface BillDetailService {
	public List<BillDetailDTO> getAll();
	
	public List<BillDetailDTO> getAllbyBill(String billId);
	
	public BillDetailDTO find(String billId, String bookId);

	public BillDetailDTO findByBill(BillDTO bill);

	public BillDetailDTO findByBook(BookDTO book);

	public int insert(BillDetailDTO billDetail);

	public int delete(BillDetailDTO billDetail);

	public int update(BillDetailDTO billDetail);
}
