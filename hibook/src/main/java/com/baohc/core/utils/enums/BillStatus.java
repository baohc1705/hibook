package com.baohc.core.utils.enums;

public enum BillStatus {

	CHO_XAC_NHAN("Chờ xác nhận"),
	
	DA_XAC_NHAN("Đã xác nhận"),
	
	DANG_CHUAN_BI_HANG("Đang chuẩn bị hàng"),
	
	DANG_VAN_CHUYEN("Đang vận chuyển"),
	
	DA_NHAN_HANG("Đã nhận hàng");
	
	private final String displayName;
	
	BillStatus(String displayName) {
		this.displayName = displayName;
	}
	
	public String getDisplayName() {
		return displayName;
	}
	
}
