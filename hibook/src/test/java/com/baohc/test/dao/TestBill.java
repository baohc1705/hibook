package com.baohc.test.dao;

import java.util.Random;

import com.baohc.app.model.BillDTO;
import com.baohc.app.model.BillDetailDTO;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.DeliveryDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.service.bill.BillDetailService;
import com.baohc.app.service.bill.BillDetailServiceImpl;
import com.baohc.app.service.bill.BillService;
import com.baohc.app.service.bill.BillServiceImpl;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.app.service.delivery.DeliveryService;
import com.baohc.app.service.delivery.DeliveryServiceImpl;
import com.baohc.app.service.user.UserService;
import com.baohc.app.service.user.UserServiceImpl;

public class TestBill {
	public static void main(String[] args) {
		BillService billService = BillServiceImpl.getInstance();
		// get all bill
		for (BillDTO b : billService.getAll()) {
			System.out.println(b);
		}

		BillDetailService billDetailService = BillDetailServiceImpl.getInstance();

		for (BillDetailDTO bd : billDetailService.getAll()) {
			System.out.println(bd);
		}

		DeliveryService deliveryService = DeliveryServiceImpl.getInstance();
		DeliveryDTO dtemp = new DeliveryDTO();
		dtemp.setId(1);

		// Bill 1
		BillDTO bill1 = new BillDTO();
		bill1.setId("B001");
		bill1.setUser(null);
		bill1.setDelivery(deliveryService.findById(1));
		bill1.setDisable(false);
		bill1.setTotalPrice(250000);
		bill1.setFullname("Alice Nguyen");
		bill1.setEmail("alice@gmail.com");
		bill1.setPhone("0909009001");
		bill1.setCity("Ho Chi Minh");
		bill1.setDistrict("District 1");
		bill1.setWard("Ben Nghe");
		bill1.setShipAddress("123 Le Loi");
		bill1.setNote("Please call before delivery");
		bill1.setCreateAt(new java.sql.Timestamp(System.currentTimeMillis()));
		bill1.setStatus("PENDING");

		// Bill 2
		UserService userService = UserServiceImpl.getInstance();
		UserDTO utemp = new UserDTO();
		utemp.setId("HB202508231257284920");

		BillDTO bill2 = new BillDTO();
		bill2.setId("B002");
		bill2.setUser(userService.find(utemp));
		bill2.setDelivery(deliveryService.findById(2));
		bill2.setDisable(false);
		bill2.setTotalPrice(420000);
		bill2.setFullname("Bob Tran");
		bill2.setEmail("bob@gmail.com");
		bill2.setPhone("0909888777");
		bill2.setCity("Ha Noi");
		bill2.setDistrict("Cau Giay");
		bill2.setWard("Dich Vong");
		bill2.setShipAddress("456 Hoang Quoc Viet");
		bill2.setNote("Deliver in the morning");
		bill2.setCreateAt(new java.sql.Timestamp(System.currentTimeMillis()));
		bill2.setStatus("CONFIRMED");

		billService.insert(bill1);
		billService.insert(bill2);

		BookService bookService = BookServiceImpl.getInstance();
		
		BookDTO book1 = bookService.findById("B250827104050");

		BookDTO book2 = bookService.findById("B250827104714");
		System.out.println("BOOK BEFORE ADD BILL: ");
		System.out.println(book1);
		System.out.println(book2);

		BillDetailDTO bd1 = new BillDetailDTO();
		bd1.setBill(bill1);
		bd1.setBook(book1);
		bd1.setQuantity(2);
		bd1.setPrice(book1.getPrice() * bd1.getQuantity());
		book1.setAmount(book1.getAmount() - bd1.getQuantity());
		billDetailService.insert(bd1);
		bookService.update(book1);
		
		BillDetailDTO bd2 = new BillDetailDTO();
		bd2.setBill(bill1);
		bd2.setBook(book2);
		bd2.setQuantity(3);
		bd2.setPrice(book2.getPrice() * bd2.getQuantity());
		book2.setAmount(book2.getAmount() - bd2.getQuantity());
		billDetailService.insert(bd2);
		bookService.update(book2);
		
		BillDetailDTO bd3 = new BillDetailDTO();
		bd3.setBill(bill2);
		bd3.setBook(book2);
		bd3.setQuantity(1);
		bd3.setPrice(book2.getPrice() * bd3.getQuantity());
		book2.setAmount(book2.getAmount() - bd3.getQuantity());
		billDetailService.insert(bd3);
		bookService.update(book2);
		
		
		System.out.println("AFTER insert: ");
		// get all bill
		for (BillDTO b : billService.getAll()) {
			System.out.println(b);
		}

		for (BillDetailDTO bd : billDetailService.getAll()) {
			System.out.println(bd);
		}

		
		
		
		System.out.println("BOOK AFTER ADD BILL: ");
		System.out.println(book1);
		System.out.println(book2);
		
//		billDetailService.delete(bd1);
//		billDetailService.delete(bd2);
//		billDetailService.delete(bd3);
//		
//		billService.delete(bill1);
//		billService.delete(bill2);
//		System.out.println("AFTER delete: ");
//		// get all bill
//		for (BillDTO b : billService.getAll()) {
//			System.out.println(b);
//		}
//
//		for (BillDetailDTO bd : billDetailService.getAll()) {
//			System.out.println(bd);
//		}
		
	}
}
