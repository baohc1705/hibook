package com.baohc.app.model;

public class DeliveryDTO {
	private int id;
	private String name;
	private double price;
	public DeliveryDTO() {
		super();
	}
	public DeliveryDTO(int id, String name, double price) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
	}
	public DeliveryDTO(String name, double price) {
		super();
		this.name = name;
		this.price = price;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "DeliveryDTO [id=" + id + ", name=" + name + ", price=" + price + "]";
	}
	
	
}
