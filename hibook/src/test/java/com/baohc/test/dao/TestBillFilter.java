package com.baohc.test.dao;

import com.baohc.app.model.BillDTO;
import com.baohc.app.service.bill.BillService;
import com.baohc.app.service.bill.BillServiceImpl;
import com.baohc.core.utils.BillCriteria;

public class TestBillFilter {
	public static void main(String[] args) {
		BillCriteria criteria = new BillCriteria();
		criteria.setUserId("202509091358599289");
		criteria.setPage(2);
		criteria.setPageSize(4);
		System.out.println(criteria);
		BillService service = BillServiceImpl.getInstance();
		for (BillDTO b : service.getBillsByFilter(criteria)) {
			System.out.println(b);
		}
	}
}
