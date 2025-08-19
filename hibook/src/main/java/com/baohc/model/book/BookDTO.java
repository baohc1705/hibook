package com.baohc.model.book;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.baohc.model.author.AuthorDTO;
import com.baohc.model.promotion.PromotionDTO;

public class BookDTO {	
	private String id;
	private CateBookDTO cate_book;
	private AuthorDTO author;
	private PromotionDTO promotion;
	private String name;
	private double price;
	private int amount;
	private String description;
	private Date createDate;
	private List<PhotoDTO> photoList;
	
	public BookDTO() {
		super();
		this.id = "";
		this.cate_book = new CateBookDTO();
		this.author = new AuthorDTO();
		this.promotion = new PromotionDTO();
		this.name = "";
		this.price = 0;
		this.amount = 0;
		this.description = "";
		this.createDate = null;
		this.photoList = new ArrayList<PhotoDTO>();
	}
	
	public BookDTO(String id, CateBookDTO cate_book, AuthorDTO author, PromotionDTO promotion, String name,
			double price, int amount, String description, Date createDate, List<PhotoDTO> photoList) {
		super();
		this.id = id;
		this.cate_book = cate_book;
		this.author = author;
		this.promotion = promotion;
		this.name = name;
		this.price = price;
		this.amount = amount;
		this.description = description;
		this.createDate = createDate;
		this.photoList = photoList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public CateBookDTO getCate_book() {
		return cate_book;
	}
	public void setCate_book(CateBookDTO cate_book) {
		this.cate_book = cate_book;
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public List<PhotoDTO> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<PhotoDTO> photoList) {
		this.photoList = photoList;
	}

	@Override
	public String toString() {
		return "BookDTO [id=" + id + ", cate_book=" + cate_book + ", author=" + author + ", promotion=" + promotion
				+ ", name=" + name + ", price=" + price + ", amount=" + amount + ", description=" + description
				+ ", createDate=" + createDate + "]";
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookDTO other = (BookDTO) obj;
		return Objects.equals(id, other.id);
	}
}
