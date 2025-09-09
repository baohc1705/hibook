package com.baohc.core.utils.enums;

public enum PayMethodEnum {
	COD("Thanh toán khi nhận hàng"),
	VNPAY("Thanh toán online VNPay");
	
	
	private final String displayName;
	PayMethodEnum(String displayName) {
		this.displayName = displayName;
	}
	
	public String getDisplayName() {
		return displayName;
	}
}
