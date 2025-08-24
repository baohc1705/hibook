<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>HiBook: Checkout</title>
	<%@include file="/assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css">
</head>
<body>
	<!-- Navigation bar -->
	<%@include file="/components/navbar.jsp" %>
	
	<!-- Main body -->
	<main class="container mb-3">
        <div class="row">      
            <div class="col-md-8 p-3">
                <div class="wrapper bg-white rounded-4 p-4">
                    <p class="fs-5 text_dark-blue-950 pb-3">ĐỊA CHỈ GIAO HÀNG</p>
                    <form action="" class="form">
                    <div class="mb-3 d-flex align-items-center">
                        <label for="name" class="form-label w-25">Họ tên người nhận</label>
                        <input type="text" class="form-control bg-white" id="name">  
                    </div>

                    <div class="mb-3 d-flex align-items-center">
                        <label for="email" class="form-label w-25">Email</label>
                        <input type="email" class="form-control bg-white" id="email">  
                    </div>

                    <div class="mb-3 d-flex align-items-center">
                        <label for="phone" class="form-label w-25">Số điện thoại</label>
                        <input type="text" class="form-control bg-white" id="phone">  
                    </div>

                    <div class="mb-3 d-flex align-items-center">
                        <label for="city" class="form-label w-25">Tỉnh/Thành phố</label>
                        <select name="city" id="" class="form-select bg-white">
                            <option value=""></option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                        </select> 
                    </div>

                    <div class="mb-3 d-flex align-items-center">
                        <label for="city" class="form-label w-25">Huyện/Quận</label>
                        <select name="city" id="" class="form-select bg-white">
                            <option value=""></option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                        </select> 
                    </div>

                    <div class="mb-3 d-flex align-items-center">
                        <label for="city" class="form-label w-25">Xã/Phường</label>
                        <select name="city" id="" class="form-select bg-white">
                            <option value=""></option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                            <option value="HCM">Thành phố Hồ Chí Minh</option>
                        </select> 
                    </div>

                    <div class="mb-3 d-flex align-items-center">
                        <label for="address" class="form-label w-25">Địa chỉ nhận hàng</label>
                        <input type="text" name="address" id="address" class="form-control bg-white">
                    </div>
                </form>
                </div>
               
            </div>
            
            <div class="col-md-4 p-3">
                <div class="wrapper p-4 rounded-4 bg-white">
                    <p class="fs-5 text_dark-blue-950 mb-3">PHƯƠNG THỨC THANH TOÁN</p>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="radio" name="payMethod" id="pay-momo">
                        <label class="form-check-label d-flex align-items-center" for="pay-momo">
                            <img src="${pageContext.request.contextPath}/assets/images/icons/momo-icon.png" alt="" width="32" height="32"> 
                            <span class="ms-2">Ví MOMO</span>
                        </label>
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="radio" name="payMethod" id="pay-cod" checked>
                        <label class="form-check-label d-flex  align-items-center" for="pay-cod">
                            <i class="fa-solid fa-money-bill fs-3"></i>
                            <span class="ms-2">Thanh toán khi nhận hàng</span>
                        </label>
                    </div>
                </div>
            </div>
        </div>

        <div class="wrapper-table p-3 rounded-4 bg-white mb-3">
            <p class="fs-5 text_dark-blue-950 mb-3">KIỂM TRA LẠI ĐƠN HÀNG</p>
            <table class="table">
                <tbody>
                    <tr>           
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="object-fit-contain " height="100">
                        </td>
                        <td class="text-wrap">Biết khi nào mới gặp lại nhau</td>
                        <td>
                           1
                        </td>
                        <td class="text-danger fw-semibold ">80.000 đ</td>
                    </tr>
                    <tr>           
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="object-fit-contain " height="100">
                        </td>
                        <td class="text-wrap">Biết khi nào mới gặp lại nhau</td>
                        <td>
                           1
                        </td>
                        <td class="text-danger fw-semibold ">80.000 đ</td>
                    </tr>
                    <tr>           
                        <td>
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="object-fit-contain " height="100">
                        </td>
                        <td class="text-wrap">Biết khi nào mới gặp lại nhau</td>
                        <td>
                           1
                        </td>
                        <td class="text-danger fw-semibold ">80.000 đ</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="checkout-footer p-3 rounded-4 bg-white d-flex justify-content-between">
            <div class="wrapper-argeerment">
                <input type="checkbox" name="" id="" class="" checked> 
                <span>Đồng ý với điều khoản thanh toán của hiBook.com</span>
            </div>

            <div class="wrapper-price w-50">
                 <div class="d-flex justify-content-between">
                        <p class="">Thành tiền</p>
                        <p>80.000đ</p>
                    </div>
                    <div class="d-flex justify-content-between">
                        <p class="">Phí vận chuyển</p>
                        <p>20.000đ</p>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold fs-5">Tổng tiền</p>
                        <p class="fw-bold fs-5 text-danger">100.000đ</p>
                    </div>
                    <a href="" class="nav-link p-2 button-fill fw-semibold">XÁC NHẬN THANH TOÁN</a>
            </div>
        </div>
    </main>
	
	<!-- Footer -->
	<%@include file="/components/footer.jsp" %>
</body>
</html>