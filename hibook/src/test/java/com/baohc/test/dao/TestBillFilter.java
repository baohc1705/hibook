package com.baohc.test.dao;

import com.baohc.app.model.BillDTO;
import com.baohc.app.service.bill.BillService;
import com.baohc.app.service.bill.BillServiceImpl;
import com.baohc.core.utils.BillCriteria;

public class TestBillFilter {
	public static void main(String[] args) {
		BillCriteria criteria = new BillCriteria();
		criteria.setUserId("202509091358599289");
		BillService service = BillServiceImpl.getInstance();
		for (BillDTO b : service.getBillsByFilter(criteria)) {
			System.out.println(b);
		}
	}
}
