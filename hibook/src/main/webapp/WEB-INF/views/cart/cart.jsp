<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

	<title>HiBook: Cart</title>
	<%@include file="/assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart.css">
	<style type="text/css">
		#btn-send-checkout:disabled {
			background-color: var(--dark-blue-200);
			transition: all 300ms ease;
			cursor: not-allowed;
		}
		#btn-send-checkout {
			transition: all 300ms ease;
		}
	</style>

</head>
<body>
	<!-- Navigation bar -->
	<%@include file="/components/navbar.jsp" %>
	
	<!-- Main body -->
	<main class="container mb-3"> 
	<p class="h4 text_dark-blue-950 font-PaytoneOne mt-3 ms-3">GIỎ HÀNG</p> 
        <div class="row justify-content-center">
            <div class="col-md-8 p-3">
                <div class="wrapper-table bg_dark-blue-50 rounded-4 p-3">
                	<c:choose>
                		<c:when test="${empty cartItems}">
                			<div class="alert alert-info" role="alert">
							 	<h2 class="">Giỏ hàng của bạn trống</h2>
							 	<p class="fs-base">Bắt đầu thêm sản phẩm vào giỏ hàng!</p>
							 	<a href="${pageContext.request.contextPath}/" class="nav-link">Xem sản phẩm</a>
							</div>
                		</c:when>
                		<c:otherwise>
		                    <table>
		                        <thead>
		                            <tr>
		                                <th><input id="check-all-book" name="checkAllBooks" type="checkbox" class=""></th>
		                                <th>Chọn tất cả ( <span>${itemCount}</span> )</th>
		                                <th></th>
		                                <th>Số lượng</th>
		                                <th>Thành tiền</th>
		                                <th></th>
		                            </tr>
		                        </thead>
					
		                        <tbody>
		                        	<c:forEach var="item" items="${cartItems }">
			                            <tr>
			                                <td class="text-center">
				                                <input 	type="checkbox" 
						                                name="bookCheck" 
						                                id="bookCheck_${item.book.id}" 
						                                value="${item.book.id}"
						                                data-subtotal="${item.subtotal}">
						                    </td>
											<td><img
												src="${pageContext.request.contextPath}/assets/images/books/${mapCoverPhoto[item.book.id]}"
												alt="${mapCoverPhoto[item.book.id]}"
												class="cover-photo object-fit-contain " height="100" onclick="window.location.href='${pageContext.request.contextPath}/books/view?bookId=${item.book.id}'"></td>
											<td class="">
			                                	<p class="truncate-muitiline" style="height: 3rem;">${item.book.name}</p>
			                                	<p class="m-0 text-danger fw-semibold">
				                                	<fmt:setLocale value="vi_VN"/>
				                                	<fmt:formatNumber value="${item.book.price}" type="number"/> đ
				                                </p>
			                                </td>
			                                <td>
			                                	<form action="${pageContext.request.contextPath}/cart" method="post" class="form-update-quantity" data-bookid="${item.book.id}">
			                                		<input type="hidden" name="action" value="update">
			                                		<input id="bookId_${item.book.id}" type="hidden" name="bookId" value="${item.book.id}">
				                                    <div class="amount">
				                                        <span class="btn-minus small" data-id="${item.book.id}"><i class="fa-solid fa-minus"></i></span>
				                                        <input type="text" name="quantity" id="quantity_${item.book.id}" 
                                               				value="${item.quantity}" class="quantity-input" readonly="readonly">
				                                        <span class="btn-plus small" data-id="${item.book.id}" data-bookamount="${item.book.amount}"><i class="fa-solid fa-plus"></i></span>
				                                    </div>
				                                    <button id="button_${item.book.id}" type="submit" class="d-none btn btn-primary btn-sm">Update</button>
			                                    </form>
			                                </td>
			                                <td class="text-danger fw-semibold">
			                                	<fmt:setLocale value="vi_VN"/>
			                                	<fmt:formatNumber value="${item.subtotal}" type="number"/> đ
			                                </td>
			                                <td>
			                                	<form action="${pageContext.request.contextPath}/cart" method="post" class="form-remove">
			                                		<input type="hidden" name="action" value="remove">
			                                		<input type="hidden" name="bookId" value="${item.book.id}">
			                                		<button type="submit" class="btn-remove button-link" id="btn-remove-${item.book.id}">
			                                		<!-- <i class="fa-solid fa-trash"></i> -->
				                                    <span>
				                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
				                                        <path d="M5 6L5 14C5 15.8613 5 16.7919 5.24472 17.5451C5.73931 19.0673 6.93273 20.2607 8.45492 20.7553C9.20808 21 10.1387 21 12 21V21C13.8613 21 14.7919 21 15.5451 20.7553C17.0673 20.2607 18.2607 19.0673 18.7553 17.5451C19 16.7919 19 15.8613 19 14V14M5 6H3M5 6L9 6M19 6H21M19 6H15M19 6V10M9 6V6C9 5.06812 9 4.60218 9.15224 4.23463C9.35523 3.74458 9.74458 3.35523 10.2346 3.15224C10.6022 3 11.0681 3 12 3V3C12.9319 3 13.3978 3 13.7654 3.15224C14.2554 3.35523 14.6448 3.74458 14.8478 4.23463C15 4.60218 15 5.06812 15 6V6M9 6L15 6M9.5 9.5L9.5 16.5M14.5 9.5L14.5 16.5" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				                                        </svg>
				                                    </span>
				                                    </button>
			                                    </form>
			                                    
			                                    <%-- <a href="${pageContext.request.contextPath}/cart?action=remove&bookId=${item.book.id}"><i class="fa-solid fa-trash"></i></a> --%>
			                                </td>
			                            </tr>
		                            </c:forEach>
		                        </tbody>
		                    </table>
                    	</c:otherwise>
                	</c:choose>
                </div>
            </div>
            <c:if test="${not empty cartItems}">
            	<div class="col-md-4 p-3">
	                <div class="wrapper-price bg_dark-blue-50 rounded-4 p-3">
	                    <div class="d-flex justify-content-between">
	                        <p>Thành tiền</p>
	                        <p class="fw-semibold">
	                        	<span class="cart-total-selected">0 đ</span>
	                        </p>
	                    </div>
	                    <hr>
	                    <div class="d-flex justify-content-between">
	                        <p class="fw-bold fs-5">Tổng tiền (+VAT)</p>
	                        <p class="fw-bold fs-5 text-danger">
	                        	<span class="cart-total-selected">0 đ</span>
	                        </p>
	                    </div>
	                    <button id="btn-send-checkout" type="button" class=" p-2 button-fill fw-semibold w-100">THANH TOÁN</button>
	                </div>
            	</div>
            </c:if>
            
        </div>
    </main>
    
	<!-- Footer -->
	<%@include file="/components/footer.jsp" %>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/homepage.js"></script>
</body>
</html>