package com.baohc.app.model;

import java.sql.Date;

public class BookDTO {
	private String id;
	private CateBookDTO cateBook;
	private AuthorDTO author;
	private PromotionDTO promotion;
	private String name;
	private double price; 
	private int amount;
	private String description;
	private Date createAt;
	public BookDTO() {
		super();
	}
	public BookDTO(String id, CateBookDTO cateBook, AuthorDTO author, PromotionDTO promotion, String name, double price,
			int amount, String description, Date createAt) {
		super();
		this.id = id;
		this.cateBook = cateBook;
		this.author = author;
		this.promotion = promotion;
		this.name = name;
		this.price = price;
		this.amount = amount;
		this.description = description;
		this.createAt = createAt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public CateBookDTO getCateBook() {
		return cateBook;
	}
	public void setCateBook(CateBookDTO cateBook) {
		this.cateBook = cateBook;
	}
	public AuthorDTO getAuthor() {
		return author;
	}
	public void setAuthor(AuthorDTO author) {
		this.author = author;
	}
	public PromotionDTO getPromotion() {
		return promotion;
	}
	public void setPromotion(PromotionDTO promotion) {
		this.promotion = promotion;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	@Override
	public String toString() {
		return "BookDTO [id=" + id + ", cateBook=" + cateBook + ", author=" + author + ", promotion=" + promotion
				+ ", name=" + name + ", price=" + price + ", amount=" + amount + ", description=" + description
				+ ", createAt=" + createAt + "]";
	}
	
	
}
