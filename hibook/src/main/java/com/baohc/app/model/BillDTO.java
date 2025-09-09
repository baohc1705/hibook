package com.baohc.app.model;

import java.sql.Timestamp;

public class BillDTO {
	private String id;
	private UserDTO user;
	private DeliveryDTO delivery;
	private boolean isDisable;
	private double totalPrice;
	private String fullname;
	private String email;
	private String phone;
	private String city;
	private String district;
	private String ward;
	private String shipAddress;
	private String note;
	private Timestamp createAt;
	private String status;
	private String payMethod;
	public BillDTO() {
		super();
	}
	
	
	public BillDTO(String id, UserDTO user, DeliveryDTO delivery, boolean isDisable, double totalPrice, String fullname,
			String email, String phone, String city, String district, String ward, String shipAddress, String note,
			Timestamp createAt, String status, String payMethod) {
		super();
		this.id = id;
		this.user = user;
		this.delivery = delivery;
		this.isDisable = isDisable;
		this.totalPrice = totalPrice;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.city = city;
		this.district = district;
		this.ward = ward;
		this.shipAddress = shipAddress;
		this.note = note;
		this.createAt = createAt;
		this.status = status;
		this.payMethod = payMethod;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
	}
	public DeliveryDTO getDelivery() {
		return delivery;
	}
	public void setDelivery(DeliveryDTO delivery) {
		this.delivery = delivery;
	}
	public boolean isDisable() {
		return isDisable;
	}
	public void setDisable(boolean isDisable) {
		this.isDisable = isDisable;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getWard() {
		return ward;
	}
	public void setWard(String ward) {
		this.ward = ward;
	}
	public String getShipAddress() {
		return shipAddress;
	}
	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Timestamp getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	public String getPayMethod() {
		return payMethod;
	}


	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}


	@Override
	public String toString() {
		return "BillDTO [id=" + id + ", user=" + (user!=null ? user.getFullname() : "GUEST")  + ", delivery=" + (delivery!=null ? delivery.getName() :"null" ) + ", isDisable=" + isDisable
				+ ", totalPrice=" + totalPrice + ", fullname=" + fullname + ", email=" + email + ", phone=" + phone
				+ ", city=" + city + ", district=" + district + ", ward=" + ward + ", shipAddress=" + shipAddress
				+ ", note=" + note + ", createAt=" + createAt + ", status=" + status + ", payMethod=" + payMethod
				+ "]";
	}
	
	
	
}
	