<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<div class="wrapper-orders" >
	<ul class="navbar-order d-flex justify-content-between align-items-center p-0 mb-2">
		<li class="navbar-order-item list-group-item active">
			<span>Tất cả</span>
		</li>
		<li class="navbar-order-item list-group-item" >
			<span>Chờ xác nhận</span>
		</li>
		<li class="navbar-order-item list-group-item">
			<span>Vận chuyển</span>
		</li>
		<li class="navbar-order-item list-group-item">
			<span>Chờ giao hàng</span>
		</li>
		<li class="navbar-order-item list-group-item">
			<span>Hoàn thành</span>
		</li>
		<li class="navbar-order-item list-group-item">
			<span>Đã hủy</span>
		</li>
		<li class="navbar-order-item list-group-item">
			<span>Trả hàng/Hoàn tiền</span>
		</li>
	</ul>
	
	<div class="row">
		<div class="col">
			<form action="" method="get" class="form-search-order">
				<div class="input-group mb-2">
				  <span class="input-group-text" id="basic-addon1">
				  	<button class="button-link d-flex justify-content-center align-items-center" type="submit">
				  		<span class="material-symbols-rounded text_gray-100">search</span>
				  	</button>
				  </span>
				  <input type="text" 
						  class="form-control" 
						  placeholder="Bạn có thể tìm kiếm theo tên sách, tác giả, id đơn hàng" 
						  aria-label="Username" 
						  aria-describedby="basic-addon1">
				</div>
			</form>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${empty bills}">
			<div class="bg-white text-center p-3">
				<img alt="empty-cart.png" 
					 src="${pageContext.request.contextPath}/assets/images/icons/empty-cart.png"
					 class="img-fluid object-fit-contain"
					 width="200">
				<p class="fs-base mt-3 fs-large">Bạn chưa có đơn hàng nào!</p>
				
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="bill" items="${bills}">
					<div class="wrapper-bill p-3 bg_dark-blue-50 mb-3">	
						<div class="d-flex justify-content-between align-items-center p-0 mb-3">
							<div>
								<span class="d-block fs-base">Mã đơn hàng: ${bill.id}</span>
								<span class="d-block fs-small text_gray-100">
									<i class="fa-regular fa-clock"></i> 
									<fmt:formatDate value="${bill.createAt}" pattern="HH:mm dd/MM/yyyy"/>
								</span>
							</div>
							<div>
								<span class="fs-base text-success">
									<i class="fa-regular fa-truck"></i>
									Đang vận chuyển 
								</span>
									|
								<span class="text-uppercase text_dark-blue-800">
									${bill.status}
								</span>
							</div>
						</div>

						<c:if test="${not empty sessionScope.mapBillDetails[bill.id]}">
							<table class="table-order-item bg-white" data-bill-id="${bill.id}">
								<c:forEach var="item" items="${sessionScope.mapBillDetails[bill.id]}">
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
							</table>
						</c:if>
						
							
						<p class="text-end mt-3">Thành tiền:  
							<span class="fs-xlarge text-danger">
								<fmt:setLocale value="vi-vn"/>
								<fmt:formatNumber value="${bill.totalPrice}"/> đ
							</span>
						</p>
						<div class="ms-auto d-flex justify-content-between align-items-center" style="width: fit-content">
							<button type="button" class="button-fill">Hủy đơn hàng</button>
							<button type="button" class="button-border ms-3">Liên hệ shop</button>
						</div>
					</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		let prevContent = ""; // biến lưu html trước đó
		
		$(".wrapper-orders").on("click",".table-order-item", function() {
	        let txtBillId = $(this).data("bill-id");
	        
	    	 // Lưu lại html danh sách cũ trước khi load chi tiết
	        prevContent = $(".wrapper-orders").html();
	    	 
	        $.ajax({
	            url: "<%=request.getContextPath()%>/user-information",
	            method: "GET",
	            data: {
	                page: "order-detail",
	                billId : txtBillId
	            },
	            success: function(res) { 
	            	$(".wrapper-orders").empty();
	                $(".wrapper-orders").html(res);
	            },
	            error: function(xhr, status, error) {
	                console.error("AJAX error:", status, error);
	                console.error("Response text:", xhr.responseText);
	                Swal.fire("Lỗi", "Không thể kết nối đến server", "error");
	            }
	        });
	    });
		 
	 // Khi click nút Trở về
	    $(document).on("click", "#btn-back-order", function(e) {
	        e.preventDefault(); // tránh reload trang
	        $(".wrapper-orders").html(prevContent);
	    });
	});
</script>
</html>