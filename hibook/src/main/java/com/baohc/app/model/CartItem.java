package com.baohc.app.model;

public class CartItem {
	private BookDTO book;
	private int quantity;

	public CartItem() {
		super();
	}

	public CartItem(BookDTO book, int quantity) {
		super();
		this.book = book;
		this.quantity = quantity;
	}

	public BookDTO getBook() {
		return book;
	}

	public void setBook(BookDTO book) {
		this.book = book;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSubtotal() {
		return book.getPrice() * quantity;
	}
}
