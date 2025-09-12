package com.baohc.app.dao.bill;

import java.util.List;

import com.baohc.app.model.BillDTO;
import com.baohc.core.utils.BillCriteria;

public interface BillDAO {
	public List<BillDTO> getAll();
	
	public BillDTO findById(String id);
	
	public int insert(BillDTO bill);
	
	public int insertAll(List<BillDTO> arr);
	
	public int delete(BillDTO bill);
	
	public int deleteAll(List<BillDTO> arr);
	
	public List<BillDTO> getBillsByFilter(BillCriteria criteria);
	
	public int countBillsByFilter(BillCriteria criteria);
	
	public List<BillDTO> getBillsCriteria(BillCriteria criteria);
}
