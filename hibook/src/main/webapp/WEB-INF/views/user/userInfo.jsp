<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/assets/allLibary.jsp"%>

<title>Welcome to HiBOOK</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/component.css">

<style type="text/css">
	.profile-form {
		border-right: 1px var(--dark-blue-800) solid;
	}
	
	.form-row {
		display: flex;
		align-items: center;
		padding: 0.75rem 0;
	}
	
	.label {
		width: 25%;
		flex: 1;
	}
	
	.form-input {
		width: 70%;
		outline: none;
		border: 1px var(--dark-blue-800) solid;
		border-radius: .5rem;
		background: transparent;
		padding: .25rem;
		font-size: var(--fs-base);
	}
	
	#input-email {
		outline: none;
		border: none;
		background: transparent;
		font-size: var(--fs-base);
	}
	
	.menu-item {
		cursor: pointer;
	}
	
	.sidebar {
		position: sticky;
		top: 6rem; /* navbar 3rem + khoảng cách 3rem */
	}
	
	ul.navbar-order {
		background-color: white;
	}
	
	ul.navbar-order li {
		color: var(--clr-gray-100);
		padding: .75em 1em;
		transition: all 300ms ease;
		cursor: pointer;
	}
	
	ul.navbar-order li:hover {
		color: var(--dark-blue-800);
	}
	
	ul.navbar-order li.active {
		color: var(--dark-blue-800);
		font-weight: bold;
		border-bottom: 2px var(--dark-blue-800) solid;
		
	}
	
	table.table-order-item {
		width: 100%;
		background: white;
		box-shadow: 0 0 5px rgba(61, 82, 160,.25);
		border-radius: .5rem;
	}
	
	table.table-order-item td {
		padding: 1rem;
		border-bottom: 1px var(--dark-blue-200) solid;
	}
	
	.text-overflow-oneline{
		overflow: hidden !important;
		text-overflow: ellipsis !important;
		
		display: -webkit-box !important;
		-webkit-box-orient: vertical !important;
		-webkit-line-clamp: 1 !important;
		line-clamp: 1 !important;
	}
	
	.form-search-order input::placeholder {
		color: var(--clr-gray-100);
		font-size: var(--fs-base);
	}
	
	.sidebar-menu {
		padding: 0;
	}
	
	.sidebar-menu li.menu-item,#btn-toggle-submenu {
		padding: .5rem;
		display: flex;
		align-items: center;
		transition: 300ms ease-in-out;
	}
	
	.sidebar-menu li.menu-item:not(.active):hover,
	#btn-toggle-submenu:not(.active):hover {
   		background: rgba(203, 219, 242,.5);
	}
	
	.sidebar-menu li.active {
		background: var(--dark-blue-800);
		color: var(--dark-blue-50);
	}
	
	.sidebar-menu li span:nth-child(2) {
		margin-left: .5rem;
	}
	
	.sidebar-submenu {
		display: grid;
		grid-template-rows: 0fr;
		transition: 300ms ease-in-out;
	}
	.sidebar-submenu > .wrapper {
		overflow: hidden;
	}
	.sidebar-submenu.show {
		grid-template-rows: 1fr;
	}
	
	#btn-toggle-submenu span:last-child {
		transition: 300ms ease-in-out;
	}
	.rotate span:last-child {
	    transform: rotate(180deg); 
	}
</style>

</head>
<body>

	<c:if test="${empty USER_ACC}">
		<c:redirect url="/"></c:redirect>
	</c:if>
	
	<%
	String url1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>

	<!-- Navigation bar -->
	<%@include file="/components/navbar.jsp"%>

	<!-- Main body -->
	<c:set var="USER_ACC" scope="session" value="${sessionScope.USER_ACC}"></c:set>
	<c:if test="${not empty USER_ACC }">
		<main class="container">
			<div class="row justify-content-center my-3">
				<div class="col-md-3 p-3 ">
					<div class="sidebar bg_dark-blue-50 rounded-3 p-3">
						<div class="text-center">
							<img alt="${sessionScope.USER_ACC.avatar}" 
								 src="${pageContext.request.contextPath}/assets/images/avatars/${sessionScope.USER_ACC.avatar}"
								 width="150"
								 height="150"
								 class="object-fit-contain rounded-circle">
							<p class="text_dark-blue-800 my-2">${sessionScope.USER_ACC.fullname}</p>
						</div>

						<ul class="sidebar-menu">
							<li class="list-group-item">
								<button onclick="toggleSubmenu(this)" id="btn-toggle-submenu" class="button-link w-100">
									<span class="material-symbols-rounded">account_circle</span> 
									<span>Tài khoản của tôi</span>
									<span class="material-symbols-rounded ms-auto">keyboard_arrow_down</span>
								</button>
								<ul class="sidebar-submenu ${reqPage == 'info'?'show':''}">
									<div class="wrapper">
										
										<li class="menu-item list-group-item ${reqPage == 'info'?'active':''}"data-page="info">Hồ sơ</li>
										<li class="menu-item list-group-item">Đặt lại mật khẩu</li>
										<li class="menu-item list-group-item">Địa chỉ</li>
									</div>
								</ul>
							</li>

							
							<li class="menu-item list-group-item ${reqPage == 'orders'?'active':''}" data-page="orders">
								<span class="material-symbols-rounded">receipt</span> 
								<span>Đơn mua</span>
							</li>
							
							<li class="menu-item list-group-item">
								<span class="material-symbols-rounded">percent_discount</span> 
								<span>Kho voucher</span>
							</li>
							
							<li class="menu-item list-group-item">
								<span class="material-symbols-rounded">notifications</span> 
								<span>Thông báo</span>
							</li>
						</ul>
					</div>
				</div>
			
				<div class="col-md-9 p-3" id="main-content">	
					<!-- Mặc định là info -->
					<jsp:include page="/WEB-INF/views/user/info.jsp"></jsp:include>

				</div>
			</div>

		</main>
	</c:if>
	<!-- Footer -->
	<%@include file="/components/footer.jsp"%>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Thay đổi email</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <div class="modal-body">
	        <form id="formVerifyEmail" action="<%=url1%>/verify-email" method="post">
	        	 <div class="mb-3">
				    <label for="newEmail" class="form-label">Email</label>
				    <input type="email" class="form-control" id="newEmail" name="newEmail">
					<button id="btnGetOTP" type="button" class="btn btn-primary">
					  Gửi mã OTP
					</button>
				  </div>
				  
				 <div class="mb-3">
				    <label for="codeOTP" class="form-label">Mã xác nhận OTP</label>
				    <input type="text" class="form-control" id="otp_user" name="otp_user">
				 </div>
				 <button type="submit" class="btn btn-primary">Save changes</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript" src="<%=url1%>/assets/js/userInfo.js"></script>
	<script type="text/javascript">
		const buttonTrigger = document.getElementById('btn-trigger_upload');
		const inputUpload = document.getElementById('input-uploadfile');
		const previewAvatar = document.getElementById('preview-avatar');
	
		buttonTrigger.addEventListener('click', () => {
			document.getElementById('input-uploadfile').click();
		});
	

		inputUpload.addEventListener('change', (e) => {
			const file = e.target.files[0];
			if (file) {
				previewAvatar.src = URL.createObjectURL(file);
			}
		});
		
		
		
		$(document).ready(function() {
			console.log("document loaded!");
			
			$("#formEdit").on("submit", function(e) {
				e.preventDefault();
				let formData = new FormData(this);
				
				$.ajax({
					url: "${pageContext.request.contextPath }/user/edit-info",
					method: "POST",
					data: formData,
					processData: false,
					contentType: false,
					success: function(response) {
						if (response.status === "success") {
							Swal.fire({
		                        icon: "success",
		                        title: "Thành công!",
		                     	text: response.message,
		                        confirmButtonText: "OK"
	                    	});
						}
						else {
							Swal.fire({
	    	                    icon: "error",
	    	                    title: "Thất bại",
	    	                    text: response.message
	    	                });
						}
					},
					error: function() {
						Swal.fire({
    	                    icon: "error",
    	                    title: "Máy chủ bị lỗi",
    	                    text: "Không thể kết nối đến server!"
    	                });
					}
				});
			});
			
			$('#btnGetOTP').on('click', function(e) {
				let email = $("#newEmail").val().trim();
				let btn = $(this);
				
				if (!email) {
					Swal.fire({
	                    icon: "error",
	                    title: "Email lỗi",
	                    text: "Kiểm tra lại email!"
	                });
					return;
				}
				
				 // Bắt đầu loading
			    btn.prop("disabled", true);
			    btn.html(`
			        <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
			        <span role="status">Đang gửi...</span>
			    `);
				
				$.ajax({
					url: "${pageContext.request.contextPath }/verify-account/send-otp-mail",
					method: "POST",
					data: {email : email},
					success: function(response) {
						if (response.status === "success") {
							Swal.fire({
		                        icon: "success",
		                        title: "Thành công!",
		                     	text: response.message,
		                        confirmButtonText: "OK"
	                    	});
						}
						else {
							Swal.fire({
	    	                    icon: "error",
	    	                    title: "Thất bại",
	    	                    text: response.message
	    	                });
						}
						
					},
					error: function(response) {
						Swal.fire({
    	                    icon: "error",
    	                    title: "Máy chủ bị lỗi",
    	                    text: "Không thể kết nối đến server!"
    	                });
					},
					complete: function() {
						// Reset lại nút sau khi xong
			            btn.prop("disabled", false);
			            btn.html("Gửi OTP");
			        }
				});
			});
			
			$("#formVerifyEmail").on("submit", function(e) {
				e.preventDefault();
				
				let email = $("#newEmail").val().trim();
				let otp = $("#otp_user").val().trim();
				
				$.ajax({
					url: "${pageContext.request.contextPath }/verify-account/verify-otp-email",
					method: "POST",
					data: {
							newEmail: email, 
							otp_user: otp
						   },
					success: function(response) {
						if (response.status === "success") {
							Swal.fire({
		                        icon: "success",
		                        title: "Thành công!",
		                     	text: response.message,
		                        confirmButtonText: "OK"
	                    	}).then (() => {
	                    		$("#input-email").val(response.newEmail);
	                    		$("#exampleModal").modal("hide");
	                    	});
						}
						else {
							Swal.fire({
	    	                    icon: "error",
	    	                    title: "Thất bại",
	    	                    text: response.message
	    	                });
						}
					},
					error: function() {
						Swal.fire({
    	                    icon: "error",
    	                    title: "Máy chủ bị lỗi",
    	                    text: "Không thể kết nối đến server!"
    	                });
					}
				});
			});
		});
		
	</script>
</body>
</html>