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
                    	
	                    <div class="mb-3 d-flex align-items-center">
	                        <label for="name" class="form-label w-25">Họ tên người nhận</label>
	                        <input type="text" class="form-control bg-white" id="name" value="${USER_ACC.fullname}" ${not empty USER_ACC ? 'readonly' : ''}>  
	                    </div>

	                    <div class="mb-3 d-flex align-items-center">
	                        <label for="email" class="form-label w-25">Email</label>
	                        <input type="email" class="form-control bg-white" id="email" value="${USER_ACC.email}" ${not empty USER_ACC ? 'readonly' : ''}>  
	                    </div>

	                    <div class="mb-3 d-flex align-items-center">
	                        <label for="phone" class="form-label w-25">Số điện thoại</label>
	                        <input type="text" class="form-control bg-white" id="phone">  
	                    </div>

	                    <div class="mb-3 d-flex align-items-center">
	                        <label for="city" class="form-label w-25">Tỉnh/Thành phố</label>
	                        <select name="city" id="city" class="form-select bg-white">
	                        	<option>--Chọn tỉnh/thành phố--</option>
	                            ${requestScope.citysEnum}
	                        </select> 
	                    </div>

	                    <div class="mb-3 d-flex align-items-center">
	                        <label for="city" class="form-label w-25">Huyện/Quận</label>
	                        <select name="district" id="district" class="form-select bg-white">
	                            <option>--Chọn Huyện/Quận--</option>
	                            <option value="QUAN_8">Quận 8</option>
	                            <option value="QUAN_9">Quận 9</option>
	                            <option value="TAN_HONG">Tân Hồng</option>
	                            <option value="THONG_BINH">Thông Bình</option>
	                        </select> 
	                    </div>

	                    <div class="mb-3 d-flex align-items-center">
	                        <label for="city" class="form-label w-25">Xã/Phường</label>
	                        <select name="ward" id="ward" class="form-select bg-white">
	                            <option >--Chọn Xã/Phường</option>
	                            <option value="PHUONG_4">Phường 4</option>
	                            <option value="PHUONG_5">Phường 5</option>
	                            <option value="TAN_HO_CO">Tân Hộ Cơ</option>
	                            <option value="CHO_TROI">Chợ Trời</option>
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
					                        value="${delivery.id}">
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
		                        value="VNPAY">
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
		                        checked="checked">
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
                        <p>
	                        <fmt:setLocale value="vi_VN"/>
			                <fmt:formatNumber value="${cartItem.subtotal}" type="number"/> đ
		                </p>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold fs-5">Tổng tiền</p>
                        <p class="fw-bold fs-5 text-danger">
                        	<fmt:setLocale value="vi_VN"/>
		                    <fmt:formatNumber value="${cartTotal}" type="number"/> đ
		                    <input type="hidden" value="${cartTotal}" id="totalPrice" readonly="readonly">
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