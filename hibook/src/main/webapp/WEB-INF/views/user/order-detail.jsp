<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<div class="wrapper-order-detail">
	<div class="order-detail_header bg_dark-blue-50 d-flex align-item-center p-3">
		<button id="btn-back-order" class="button-link d-flex align-items-center ">
			<span class="material-symbols-rounded">chevron_backward</span>
			<span>Trở về</span>
		</button>
		<div class="ms-auto fs-base">
			<span class="text-uppercase">Mã đơn hàng: ${bill.id}</span> 
			<span class="mx-2">|</span> 
			<span class="text-uppercase text-danger">${bill.status}</span>
		</div>
	</div>
	<div class="wrapper-order-detail_log">
		<div class="order-detail_log">
			<div>
				<div class="icon-log active">
					<span><i class="fa-solid fa-receipt"></i></span>
				</div>
				<div class="log-text text-center fs-base mb-2">
					Đơn hàng đã đặt
				</div>
				<div class="log-time text-center fs-small text_gray-100">
					<fmt:formatDate pattern="HH:mm dd-MM-yyyy" value="${bill.createAt}"/>
				</div>
			</div>
			<div>
				<div class="icon-log">
					<span><i class="fa-solid fa-money-bills"></i></span>
				</div>
				<div class="log-text text-center fs-base mb-2">
					Đơn hàng đã xác nhận
				</div>
				<div class="log-time text-center fs-small text_gray-100">
					<fmt:formatDate pattern="HH:mm dd-MM-yyyy" value="${bill.createAt}"/>
				</div>
			</div>
			<div>
				<div class="icon-log">
					<span><i class="fa-solid fa-truck-fast"></i></span>
				</div>
				<div class="log-text text-center fs-base mb-2">
					Đơn hàng đã giao cho ĐVVC
				</div>
				<div class="log-time text-center fs-small text_gray-100">
					<fmt:formatDate pattern="HH:mm dd-MM-yyyy" value="${bill.createAt}"/>
				</div>
			</div>
			<div>
				<div class="icon-log">
					<span><i class="fas fa-check"></i></span>
				</div>
				<div class="log-text text-center fs-base mb-2" >
					Đã lấy hàng thành công
				</div>
				<div class="log-time text-center fs-small text_gray-100">
					<fmt:formatDate pattern="HH:mm dd-MM-yyyy" value="${bill.createAt}"/>
				</div>
			</div>
			<div>
				<div class="icon-log">
					<span><i class="fa-solid fa-star"></i></span>
				</div>
				<div class="log-text text-center fs-base mb-2">
					Đánh giá
				</div>
				<div class="log-time text-center fs-small text_gray-100">
					<fmt:formatDate pattern="HH:mm dd-MM-yyyy" value="${bill.createAt}"/>
				</div>
			</div>
			<div class="line-log">
				<div class="line"></div>
			</div>
		</div>
	</div>
	<!-- <div class="py-1">
		<div class="line-shape"
			style="background-image: repeating-linear-gradient(45deg, #6fa6d6, #6fa6d6 33px, transparent 0, transparent 41px, #f18d9b 0, #f18d9b 74px, transparent 0, transparent 82px); background-position-x: -1.875rem; background-size: 7.25rem .1875rem; height: .1875rem; width: 100%"></div>
	</div> -->
	<div class="wrapper-order-detail_address">
		<div class="order-detail_address">
			<p class="fs-large">Địa Chỉ Nhận Hàng</p>
			<div class="row">
				<div class="info col-md-4">
					<span class="fs-base">${bill.fullname}</span><br>
					<span class="fs-small text-clr-black-o50">${bill.phone}</span><br>
					<span class="fs-small text-clr-black-o50">${bill.shipAddress}, ${bill.ward}, ${bill.district}, ${bill.city}</span>
				</div>
				<div class="col-md-4">
					Thông tin vận chuyển
				</div>
			</div>
		</div>
	</div>
	
	<div class="wrapper-order-detail_book">
		<c:if test="${not empty orderDetail}">
			<table class="order-detail_book">
				<c:forEach var="item" items="${orderDetail}">
					<tr class="book-item">
						<td class="text-center">
							<img alt="${sessionScope.mapCoverPhotoOrder[item.book.id]}" 
								 src="${pageContext.request.contextPath}/assets/images/books/${sessionScope.mapCoverPhotoOrder[item.book.id]}"
								 class="object-fit-contain"
								 height="100">
						</td>
						<td class="align-top">
							<span class="d-block mb-1 text-overflow-oneline">
								${item.book.name}
							</span >
							<span class="d-block mb-2 fs-small text_gray-100">
								Tác giả: ${item.book.author.fullname}
							</span>
							<span class="d-block mb-2">
								x${item.quantity}
							</span>
						</td>
						<td class="text-end">
							<span class="text-danger">
								<fmt:setLocale value="vi-vn"/>
								<fmt:formatNumber value="${item.price}"/> đ
							</span>
						</td>
					</tr>
				</c:forEach>
				<tr class="fs-base">
					<td colspan="2" class="text-end text-clr-black-o50">Tổng tiền hàng</td>
					<td class="text-end">
						<span>
							<fmt:setLocale value="vi-vn"/>
							<fmt:formatNumber value="${totalPriceBill}"/> đ
						</span>
					</td>
				</tr>
				<tr class="fs-base">
					<td colspan="2" class="text-end text-clr-black-o50">Phí vận chuyển</td>
					<td class="text-end">
						<span>+ 
							<fmt:setLocale value="vi-vn"/>
							<fmt:formatNumber value="${bill.delivery.price}"/> đ
						</span>
					</td>
				</tr>
				<tr class="fs-base">
					<td colspan="2" class="text-end text-clr-black-o50">Tổng tiền cần thanh toán</td>
					<td class="text-end fs-large">
						<span class="text-danger">
							<fmt:setLocale value="vi-vn"/>
							<fmt:formatNumber value="${bill.totalPrice}"/> đ
						</span>
					</td>
				</tr>
				<tr class="fs-base">
					<td colspan="2" class="text-end text-clr-black-o50">Phương thức thanh toán</td>
					<td class="text-end"> ${bill.payMethod}</td>
				</tr>
				
			</table>
		</c:if>
	</div>
	
</div>

	
</html>