<%@page import="com.baohc.core.utils.enums.PayMethodEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>HiBook: Checkout</title>
	<%@include file="/assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css">
    <style type="text/css">
    	table.preview-cart {
    		width: 100%;
    	}
    	
    	table.preview-cart td {
    		
    		padding: 1rem;
    	}
    	
    	table.preview-cart td:nth-child(2) {
    		
			height: 3rem;
			vertical-align: top ;
			overflow: hidden !important;
			text-overflow: ellipsis !important;
			
			display: -webkit-box !important;
			-webkit-box-orient: vertical !important;
			-webkit-line-clamp: 1 !important;
			line-clamp: 1 !important;
		}
		
		table.preview-cart td:nth-child(1), 
		td:nth-child(3), 
		td:nth-child(4) {
			width: 10%;
		}
		
		table.preview-cart td:nth-child(1), 
		td:nth-child(3) {
			text-align: center;
			align-items: start;
		}
		
		table.preview-cart td:nth-child(4) {
			text-align: right !important;
			
		}
			
    </style>
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
                    <form action="" method="post" class="form" id="form-checkout">
                    	<div class="row mb-3">
                    		<p class="fs-base">Thông tin cá nhân người nhận</p>
                    		<div class="col-md-6">
		                        <label for="name" class="form-label">Họ tên người nhận</label>
		                        <input 	type="text" 
				                        class="form-control bg-white" 
				                        id="name" 
				                        value="${USER_ACC.fullname}" ${not empty USER_ACC ? 'readonly' : ''}
				                        required="required"
				                        onkeyup="checkFullName()">
									    <div class="invalid-feedback">
									        Nhập vào họ tên người nhận
									    </div>
		                    </div>
		                    <div class="col-md-6">
		                    	<label for="phone" class="form-label">Số điện thoại</label>
		                        <input 	type="text" 
				                        class="form-control bg-white" 
				                        id="phone"
				                        required="required"
				                        onkeyup="checkPhone()">
								<div class="invalid-feedback">Số điện thoại không hợp lệ!</div>
							</div>
                    	</div>
                    	
                    	<div class="row mb-3">
                    		<div class="col-md-6">
                    			<label for="email" class="form-label w-25">Email</label>
		                        <input 	type="email" 
				                        class="form-control bg-white" 
				                        id="email" 
				                        value="${USER_ACC.email}" ${not empty USER_ACC ? 'readonly' : ''}
				                        required="required"
				                       	onkeyup="checkEmail()">
				                        <div class="invalid-feedback">Email không hợp lệ! (Rỗng hoặc không đúng dạng)</div>
				        
				                <c:if test="${empty USER_ACC}">
				                	<input type="hidden" name="csrfToken" value="${csrfToken}" id="csrfTokenEmail">
			                 		<input type="hidden" name="code_OTP" value="${code_OTP}" id="code_OTP">
			                 		<input type="hidden" name="code_OTP_Time" value="${code_OTP_Time}" id="code_OTP_Time">
			                 		<button id="btn-get-otp" type="button" class="fs-base button-fill mt-3 d-flex align-items-center justify-content-center">
									    <span id="btn-text">Gửi xác minh</span>
									    <span class="d-none ms-2" id="loading-spinner">
									        <div class="spinner-border spinner-border-sm" role="status">
									            <span class="visually-hidden">Loading...</span>
									        </div>
									        <span> Đang gửi</span>
									    </span>
									</button>
			                 	</c:if>
			                 	
                    		</div>
                    		
                    		<div class="col-md-6">
                    			<c:if test="${empty USER_ACC}">
			                        <label for="email" class="form-label">Nhập vào OTP</label>
			                        <input 	type="text" 
					                        class="form-control bg-white" 
					                        id="checkOTP"
					                        required="required"
					                        name="checkOTP">
					                 <div class="invalid-feedback">Mã OTP không hợp lệ!!</div>
					               	<input type="hidden" name="csrfToken" value="${csrfToken}" id="csrfTokenVerify">	
					                 <button id="btn-verify-otp" type="button" class="fs-base button-fill mt-3">Xác minh</button>
			                    </c:if>
			                    
                    		</div>
                    	</div>
                    	<hr class="mb-3">
                    	<p class="fs-base">Thông tin địa chỉ nhận hàng</p>
                    	<div class="row mb-3">
                    		<div class="col-md-4 px-2">
                    			<label for="city" class="form-label">Tỉnh/Thành phố</label>
		                        <select name="city" 
		                        id="city" 
		                        class="form-select bg-white" 
		                        required="required"
		                        onchange="checkCity()">
		                        	<option selected disabled value="">--Chọn tỉnh/thành phố--</option>
		                            <c:if test="${not empty requestScope.citysEnum}">
		                            	${requestScope.citysEnum}
		                            </c:if> 
		                        </select>
		                        <div class="invalid-feedback">Vui lòng chọn tỉnh/thành phố!!</div>
                    		</div>
                    		
                    		<div class="col-md-4 px-2">
                    			<label for="city" class="form-label">Huyện/Quận</label>
		                        <select name="district" id="district" class="form-select bg-white" required="required" onchange="checkDistrict()">
		                            <option selected disabled value="">--Chọn Huyện/Quận--</option>
		                            <option value="QUAN_8">Quận 8</option>
		                            <option value="QUAN_9">Quận 9</option>
		                            <option value="TAN_HONG">Tân Hồng</option>
		                            <option value="THONG_BINH">Thông Bình</option>
		                        </select>
		                        <div class="invalid-feedback">Vui lòng chọn Huyện/Quận!!</div>
                    		</div>
                    		
                    		<div class="col-md-4 px-2">
                    			<label for="city" class="form-label w-25">Xã/Phường</label>
		                        <select name="ward" id="ward" class="form-select bg-white" required="required" onchange="checkWard()">
		                            <option selected disabled value="">--Chọn Xã/Phường</option>
		                            <option value="PHUONG_4">Phường 4</option>
		                            <option value="PHUONG_5">Phường 5</option>
		                            <option value="TAN_HO_CO">Tân Hộ Cơ</option>
		                            <option value="CHO_TROI">Chợ Trời</option>
		                        </select>
		                        <div class="invalid-feedback">Vui lòng chọn Xã/Phường!!</div>
                    		</div>	
                    	</div>
                    	<div class="row mb-3">
                    		<div class="col-md-2 px-2">
                    			<label for="address" class="form-label">Ấp/Đường</label>
                    		</div>
	                        <div class="col-md-10 px-2">
	                        	<input type="text" name="address" id="address" class="form-control bg-white" required="required" onkeyup="checkAddress()">
	                        	<div class="invalid-feedback">Vui lòng nhập đầy đủ địa chỉ!</div>
	                        </div>
	                        
	                    </div>
	                    
	                    <div class="row">
	                    	<div class="col">
	                    		<label for="note" class="form-label">Ghi chú</label>
  								<textarea class="form-control" id="note" rows="3" name="note"></textarea>
	                    	</div>
	                    </div>
                	</form>
                </div>
               
            </div>
            
            <div class="col-md-4 p-3">
                <div class="wrapper p-4 rounded-4 bg-white mb-3">
                    <p class="fs-5 text_dark-blue-950 mb-3">PHƯƠNG THỨC VẬN CHUYỂN</p>
                    <c:choose>
                    	<c:when test="${not empty deliveries}">
                    		<c:forEach var="delivery" items="${deliveries}">
                    			<div class="form-check mb-3">
			                        <input class="form-check-input" 
					                        type="radio" 
					                        name="delivery" 
					                        id="delivery-${delivery.id}"
					                        value="${delivery.id}"
					                        required="required"
					                        data-price="${delivery.price}">
			                        <label class="form-check-label d-flex align-items-center" for="delivery-${delivery.id}">
			                            <span class="fs-base">${delivery.name}</span>
			                        </label>
			                    </div>
                    		</c:forEach>
                    	</c:when>
                    	<c:otherwise>
                    		<p class="fs-small text_clr-gray-100">Hãy nhập địa chỉ để chọn phương thức vận chuyển</p>
                    	</c:otherwise>
                    </c:choose>  
                </div>
                
                <div class="wrapper p-4 rounded-4 bg-white mt-3">
                    <p class="fs-5 text_dark-blue-950 mb-3">PHƯƠNG THỨC THANH TOÁN</p>
                    <div class="form-check mb-3">
                        <input 	class="form-check-input" 
		                        type="radio" 
		                        name="payMethod" 
		                        id="pay-VNPAY" 
		                        value="VNPAY"
		                        required="required">
                        <label class="form-check-label d-flex align-items-center" for="pay-VNPAY">
                            <img src="${pageContext.request.contextPath}/assets/images/icons/momo-icon.png" alt="" width="32" height="32"> 
                            <span class="ms-2"><%= PayMethodEnum.VNPAY.getDisplayName() %></span>
                        </label>
                    </div>
                    <div class="form-check mb-3">
                        <input 	class="form-check-input" 
		                        type="radio" 
		                        name="payMethod" 
		                        id="pay-COD" 
		                        value="COD" 
		                        checked="checked"
		                        required="required">
                        <label class="form-check-label d-flex  align-items-center" for="pay-COD">
                            <i class="fa-solid fa-money-bill fs-3"></i>
                            <span class="ms-2"><%= PayMethodEnum.COD.getDisplayName() %></span>
                        </label>
                    </div>
                    
                </div>
            </div>
        </div>

        <div class="wrapper-table p-3 rounded-4 bg-white mb-3">
            <p class="fs-5 text_dark-blue-950 mb-3">KIỂM TRA LẠI ĐƠN HÀNG</p>
            <c:choose>
            	<c:when test="${not empty sessionScope.cartItemsSelected}">
            		
            		<table class="preview-cart">
		                <tbody>
		                    <c:forEach var="cartItem" items="${sessionScope.cartItemsSelected}">
		            			<tr>           
			                        <td>
			                            <img src="${pageContext.request.contextPath}/assets/images/books/${mapCoverPhoto[cartItem.book.id]}" 
			                            	 alt="${mapCoverPhoto[cartItem.book.id]}" class="object-fit-contain " height="100">
			                        </td>
			                        <td class="">${cartItem.book.name}</td>
			                        <td>
			                           ${cartItem.quantity}
			                        </td>
			                        
			                        <td class="text-danger fw-semibold ">
			                        <span>
			                        	<fmt:setLocale value="vi_VN"/>
	                                	<fmt:formatNumber value="${cartItem.subtotal}" type="number"/> đ
			                        </span>
	                       				
	                                </td>
			                    </tr> 
		            		</c:forEach>  
		                </tbody>
		            </table>
            	</c:when>
            	
            	<c:otherwise>
            		<div class="alert alert-info" role="alert">
					 	<h2 class="">Giỏ hàng của bạn trống</h2>
					 	<p class="fs-base">Bắt đầu thêm sản phẩm vào giỏ hàng!</p>
					 	<a href="${pageContext.request.contextPath}/" class="nav-link">Xem sản phẩm</a>
					</div>
            	</c:otherwise>
            </c:choose>
            
        </div>

        <div class="checkout-footer p-3 rounded-4 bg-white d-flex justify-content-between">
            <div class="wrapper-argeerment">
                <input type="checkbox" name="" id="" class="" checked> 
                <span>Đồng ý với điều khoản thanh toán của hiBook.com</span>
                
            </div>

            <div class="wrapper-price w-50">
                 <div class="d-flex justify-content-between">
                        <p class="">Thành tiền</p>
                        <p>
	                        <fmt:setLocale value="vi_VN"/>
		                    <fmt:formatNumber value="${cartTotal}" type="number"/> đ
	                    </p>
                    </div>
                    <div class="d-flex justify-content-between">
                        <p class="">Phí vận chuyển</p>
                        <p id="price-delivery" class="">
	                        
		                </p>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold fs-5">Tổng tiền</p>
                        
                        <p class="fw-bold fs-5 text-danger">
                        	<span id="totalPriceDisplay">
                        		<fmt:setLocale value="vi_VN"/>
		                    	<fmt:formatNumber value="${cartTotal}" type="number"/> đ
                        	</span>
                        	
		                    <input type="hidden" value="${cartTotal}" id="totalPrice" readonly="readonly">
                        	<input type="hidden" value="${cartTotal}" id="totalPriceTmp" readonly="readonly">
                        </p>
                    </div>
                   
                    <button id="btn-checkout" type="submit" class=" p-2 button-fill fw-semibold w-100">XÁC NHẬN THANH TOÁN</button>
            </div>
        </div>
    </main>
	
	<!-- Footer -->
	<%@include file="/components/footer.jsp" %>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/checkout.js"></script>
</body>
</html>