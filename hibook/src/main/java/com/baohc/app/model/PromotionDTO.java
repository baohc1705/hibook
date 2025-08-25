package com.baohc.app.model;

import java.sql.Date;

public class PromotionDTO {
	private int id;
	private String name;
	private int discountPercent;
	private Date startDate;
	private Date endDate;
	public PromotionDTO() {
		super();
	}
	public PromotionDTO(int id, String name, int discountPercent, Date startDate, Date endDate) {
		super();
		this.id = id;
		this.name = name;
		this.discountPercent = discountPercent;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public PromotionDTO(String name, int discountPercent, Date startDate, Date endDate) {
		super();
		this.name = name;
		this.discountPercent = discountPercent;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(int discountPercent) {
		this.discountPercent = discountPercent;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "PromotionDTO [id=" + id + ", name=" + name + ", discountPercent=" + discountPercent + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}
	
	
}
