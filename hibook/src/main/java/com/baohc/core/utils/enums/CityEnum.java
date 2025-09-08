package com.baohc.core.utils.enums;

public enum CityEnum {
    HANOI("Hà Nội"),
    HUE("Thừa Thiên Huế"),
    HAIPHONG("Hải Phòng"),
    DANANG("Đà Nẵng"),
    CANTHO("Cần Thơ"),
    HO_CHI_MINH("TP. Hồ Chí Minh"),
    LAI_CHAU("Lai Châu"),
    DIEN_BIEN("Điện Biên"),
    SON_LA("Sơn La"),
    LANG_SON("Lạng Sơn"),
    QUANG_NINH("Quảng Ninh"),
    THANH_HOA("Thanh Hóa"),
    NGHE_AN("Nghệ An"),
    HA_TINH("Hà Tĩnh"),
    CAO_BANG("Cao Bằng"),
    TUYEN_QUANG("Tuyên Quang"),
    LAO_CAI("Lào Cai"),
    THAI_NGUYEN("Thái Nguyên"),
    PHU_THO("Phú Thọ"),
    BAC_NINH("Bắc Ninh"),
    HUNG_YEN("Hưng Yên"),
    NINH_BINH("Ninh Bình"),
    QUANG_TRI("Quảng Trị"),
    QUANG_NGAI("Quảng Ngãi"),
    GIA_LAI("Gia Lai"),
    KHANH_HOA("Khánh Hòa"),
    LAM_DONG("Lâm Đồng"),
    DAK_LAK("Đắk Lắk"),
    DONG_NAI("Đồng Nai"),
    TAY_NINH("Tây Ninh"),
    VINH_LONG("Vĩnh Long"),
    DONG_THAP("Đồng Tháp"),
    CA_MAU("Cà Mau"),
    AN_GIANG("An Giang");
	
    private final String displayName;

    CityEnum(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
    
    public static void main(String[] args) {

    	System.out.println(CityEnum.AN_GIANG.displayName);
		
	}
}
