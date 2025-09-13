<%@page import="com.baohc.core.utils.enums.BillStatus"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin: Bill management</title>
	<%@include file="/assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/view-all.css">
    <script src="${pageContext.request.contextPath}/assets/js/admin.js" defer></script>
</head>
<body>
	<!-- Sidebar navagition -->
	<%@include file="/components/sidebar.jsp" %>
	
	<!-- Main body -->
	<main class="bill px-3">
		<!-- Admin navigation bar-->
		<%@include file="/components/adminNavbar.jsp" %>
		<c:set var="hibook" value="${pageContext.request.contextPath }"></c:set>
		<section class="tool">
			<form action="">
				<select name="filter-status" class="filter-status" data-bill-id="${bill.id}">
					<option value=""selected="selected">--Chọn trạng thái đơn hàng--</option>
					<option value="<%= BillStatus.CHO_XAC_NHAN.getDisplayName()%>">
						    <%= BillStatus.CHO_XAC_NHAN.getDisplayName()%>
					</option>
					<option value="<%= BillStatus.DA_XAC_NHAN.getDisplayName()%>">
						    <%= BillStatus.DA_XAC_NHAN.getDisplayName()%>
					</option>
					<option value="<%= BillStatus.DANG_CHUAN_BI_HANG.getDisplayName()%>">
						    <%= BillStatus.DANG_CHUAN_BI_HANG.getDisplayName()%>
					</option>
					<option value="<%= BillStatus.DANG_VAN_CHUYEN.getDisplayName()%>">
						    <%= BillStatus.DANG_VAN_CHUYEN.getDisplayName()%>
					</option>
					<option value="<%= BillStatus.DA_NHAN_HANG.getDisplayName()%>">
						    <%= BillStatus.DA_NHAN_HANG.getDisplayName()%>
					</option>
				</select>
			</form>
		</section>
		<section class="main-body">
			<div class="bill-table">
				<div class="">
					<table class="">
						<thead>
							<tr>
							    <th>
							        <input type="checkbox" name="checkBill">
							    </th>
							    <th>
							        <span>Mã đơn hàng</span>
							    </th>
							    <th>
							        <span>Loại khách hàng</span>
							    </th>
							    <th>
							        <span>Họ tên</span>
							    </th>
							    <th>
							        <span>Email</span>
							    </th>
							    <th>
							        <span>Điện thoại</span>
							    </th>
							    <th>
							        <span>Địa chỉ</span>
							    </th>
							    <th>
							        <span>Tổng tiền</span>
							    </th>
							    <th>
							        <span>Vận chuyển</span>
							    </th>
							    <th>
							        <span>Thanh toán</span>
							    </th>
							    <th>
							        <span>Trạng thái</span>
							    </th>
							    <th></th>
							</tr>

						</thead>
						<tbody>
							<c:forEach var="bill" items="${bills}">
								<tr>
									<td>
										<input type="checkbox" name="checkBill">
									</td>
									<td>
										<span>${bill.id}</span>
									</td>
									<td>
										<span>${bill.user == null ? 'Guest': 'Member'}</span>
									</td>
									<td>
										<span>${bill.fullname}</span>
									</td>
									<td>
										<span>${bill.email}</span>
									</td>
									<td>
										<span>${bill.phone}</span>
									</td>
									<td>
										<span>${bill.shipAddress}, ${bill.ward}, ${bill.district}, ${bill.city}</span>
									</td>
									<td>
										<span class="text-danger">đ 
											<fmt:setLocale value="vi-VN"/>
											<fmt:formatNumber value="${bill.totalPrice}"/>
										</span>
									</td>
									<td>
										<span>${bill.delivery.name}</span>
									</td>
									<td>
										<span>${bill.payMethod}</span>
									</td>
									<td>
										<select name="status" class="status" data-bill-id="${bill.id}">
											<option value="<%= BillStatus.CHO_XAC_NHAN.getDisplayName()%>"
												    ${bill.status == BillStatus.CHO_XAC_NHAN.getDisplayName() ? 'selected' : ''}>
												    <%= BillStatus.CHO_XAC_NHAN.getDisplayName()%>
											</option>
											<option value="<%= BillStatus.DA_XAC_NHAN.getDisplayName()%>"
												    ${bill.status == BillStatus.DA_XAC_NHAN.getDisplayName() ? 'selected' : ''}>
												    <%= BillStatus.DA_XAC_NHAN.getDisplayName()%>
											</option>
											<option value="<%= BillStatus.DANG_CHUAN_BI_HANG.getDisplayName()%>"
												    ${bill.status == BillStatus.DANG_CHUAN_BI_HANG.getDisplayName() ? 'selected' : ''}>
												    <%= BillStatus.DANG_CHUAN_BI_HANG.getDisplayName()%>
											</option>
											<option value="<%= BillStatus.DANG_VAN_CHUYEN.getDisplayName()%>"
												    ${bill.status == BillStatus.DANG_VAN_CHUYEN.getDisplayName() ? 'selected' : ''}>
												    <%= BillStatus.DANG_VAN_CHUYEN.getDisplayName()%>
											</option>
											<option value="<%= BillStatus.DA_NHAN_HANG.getDisplayName()%>"
												    ${bill.status == BillStatus.DA_NHAN_HANG.getDisplayName() ? 'selected' : ''}>
												    <%= BillStatus.DA_NHAN_HANG.getDisplayName()%>
											</option>
										</select>
									</td>
									<td>
										<span>${bill.disable?'Đã thanh toán':'Chưa thanh toán'}</span>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						
					</table>
				</div>
			</div>
		</section>
		
		 <!-- Chat box -->
		<%@include file="/components/chatbox.jsp" %>
	</main>
	<script type="text/javascript" src="${hibook}/assets/js/bill-management.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".status").on("change", function() {
				let txtBillId = $(this).data("bill-id");
				let txtStatus = $(this).val();
				
				$.ajax({
	                url: "${hibook}/admin/bills",
	                type: "POST",
	                data: {
	                    action: "update-status",
	                    billId: txtBillId,
	                    status: txtStatus
	                },
	                success: function(res) {
	                    // Có thể show toast hoặc alert thành công
	                    console.log("Update status success for bill: " + txtBillId);
	                    if (res.status === "success") {
	                    	Swal.fire({
                    		  position: "top-end",
                    		  icon: "success",
                    		  title: res.message,
                    		  showConfirmButton: false,
                    		  timer: 1500
                    		});
	    				}
	    				else {
	    					Swal.fire({
	    						icon: "error",
	    						title: "Thất bại",
	    						text: res.message
	    					});
	    				}
	                },
	                error: function(xhr, status, error) {
	                    console.error("Error update status: " + error);
	                    alert("Cập nhật trạng thái thất bại!");
	                }
	            });
			});
		});
	</script>
</body>
</html>