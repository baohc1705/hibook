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
	
	table.table-order-item tr:hover{
		cursor: pointer;
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
	.wrapper-order-detail .order-detail_header {
		border-bottom: 1px var(--dark-blue-200) dotted;
		border-bottom-left-radius: .5rem;
		border-bottom-right-radius: .5rem;
	}
	.wrapper-order-detail_log, .wrapper-order-detail_address, .wrapper-order-detail_book {
		padding: 1rem;
		background-color: var(--dark-blue-50);
		border-radius: .5rem;
		border-bottom: 1px var(--dark-blue-200) dotted;
	}
	.order-detail_log {
		display: flex;
		position: relative;
		justify-content: space-between;
	}
	
	.order-detail_log div {
		width: 140px;
		
		z-index: 1;
		
	}
	.order-detail_log div .icon-log {
		background-color: var(--dark-blue-50);
		margin: auto;
		width: 60px;
		height: 60px;
		border: 4px var(--dark-blue-800) solid;
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: var(--fs-xlarge);
		color: var(--dark-blue-800);
		border-radius: 50%;		
	}
	
	.order-detail_log div .icon-log.active {
		background-color: var(--dark-blue-800);
		color: var(--dark-blue-50);
	}
	
	.order-detail_log div .log-text {
		color: rgba(0,0,0,.8);
	    font-size: .875rem;
	    line-height: 1.25rem;
	    margin: 1.25rem 0 .25rem;
	    text-transform: capitalize
	}
	.order-detail_log div.line-log {
		height: 4px;
		position: absolute;
		width:100%;
		top: 30px;
		z-index: 0;
		
	}
	
	.order-detail_log div.line-log div.line {
		height: 4px;
		width: calc(100% - 140px);
		background-color: var(--dark-blue-800);
		margin: 0 70px;
	}
	
	table.order-detail_book {
		width: 100%;
	}
	
	table.order-detail_book td {
		padding: 1rem;
		border-bottom: 1px var(--dark-blue-200) dotted;
	}
	
	.order-detail_address .info {
		border-right: 1px var(--clr-black-o50) solid;
	}
	
	.wrapper-bill {
	    background-color: var(--dark-blue-50);
	    padding: 1rem;
	    margin-bottom: 1rem;
	}

	.wrapper-bill:last-child {
	    margin-bottom: 0 !important;
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
										<li class="menu-item list-group-item ${reqPage == 'reset-password'?'active':''}"data-page="reset-password">Đặt lại mật khẩu</li>
										<li class="menu-item list-group-item" data-page="address">Địa chỉ</li>
									</div>
								</ul>
							</li>

							
							<li class="menu-item list-group-item ${reqPage == 'orders'?'active':''}" data-page="orders">
								<span class="material-symbols-rounded">receipt</span> 
								<span>Đơn mua</span>
							</li>
							
							<li class="menu-item list-group-item" data-page="percent">
								<span class="material-symbols-rounded">percent_discount</span> 
								<span>Kho voucher</span>
							</li>
							
							<li class="menu-item list-group-item" data-page="notification">
								<span class="material-symbols-rounded">notifications</span> 
								<span>Thông báo</span>
							</li>
						</ul>
					</div>
				</div>
			
				<div class="col-md-9 p-3" id="main-content">
					<!-- <span class="loader"></span> -->
					<!-- Mặc định là info -->
					<jsp:include page="/WEB-INF/views/user/info.jsp"></jsp:include>

				</div>
			</div>
			<input type="hidden" name="csrfToken" value="${csrfToken}" id="csrfTokenEmail">
			<input type="hidden" name="csrfToken" value="${csrfToken}" id="csrfTokenVerify">
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
			<div class="mb-3">
				<label for="newEmail" class="form-label">Email</label>
				<div class="d-flex align-items-center">
					<input type="email" class="form-control" id="newEmail" name="email">
					<button id="btn-get-otp" type="button" class="ms-1 fs-base button-border p-1 d-flex align-items-center justify-content-center"
						style="max-width: fit-content; text-wrap: nowrap;">
					  	<span id="btn-text">Gửi xác minh</span>
					    	<span class="d-none ms-2" id="loading-spinner">
					        <div class="spinner-border spinner-border-sm" role="status">
					            <span class="visually-hidden">Loading...</span>
					        </div>
					        <span> Đang gửi</span>
					    </span>
					</button>
				</div>	
			</div>
			  
			<div class="mb-3">
				<label for="codeOTP" class="form-label">Mã xác nhận OTP</label>
				<input type="text" class="form-control" id="otp_user" name="otp_user">
				<button type="button" id="btn-verify-otp" class="w-100 button-fill mt-3 d-flex align-items-center justify-content-center">Xác nhận</button>
			</div>
			
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript" src="<%=url1%>/assets/js/userInfo.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			console.log("document loaded!");

			$("#btn-trigger_upload").on('click', () => {
				$('#input-uploadfile').click();
			});
		

			$("#input-uploadfile").on('change', (e) => {
				const file = e.target.files[0];
				if (file) {
					 $("#preview-avatar").attr("src", URL.createObjectURL(file));
				}
			});
			
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
			
			$('#btn-get-otp').on('click', function() {
				let txtEmail = $("#newEmail").val();
				let loader = $("#loading-spinner");
				let btnText = $("#btn-text");
				if (txtEmail === "") {
					Swal.fire("Lỗi", "Email rỗng!", "warning");
					return;
				}

				if (txtEmail === "" || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(txtEmail)) {
					Swal.fire("Lỗi", "Email không hợp lệ!", "warning");
					return;
				}
				loader.removeClass('d-none'); // show spinner
				btnText.empty();
				btnText.textContent = "Đang gửi...";
				$.ajax({
					url: "/hibook/verify/email",
					method: "POST",
					headers: {
						"X-CSRF-Token": $('#csrfTokenEmail').val()
					},
					data: {
						action: "otp",
						email: txtEmail
					},
					success: function(res) {
						if (res.status === "success") {
							
							Swal.fire({
								icon: "success",
								title: "Thành công!",
								text: res.message,
								confirmButtonText: "Tiếp tục"
							});
							if (res.expireTime) {
					           startOtpCountdown(res.expireTime);
					       	}					
						}
						else {
							Swal.fire({
								icon: "error",
								title: "Thất bại",
								text: res.message
							});
						}
					},
					error: function() {
						console.log("Không thể gửi đến server verify");
					},
					complete: function() {
						loader.addClass('d-none');
					}
				});
			});
			
			$("#btn-verify-otp").on("click", function() {
				let txtOTP = $("#otp_user").val();
				let txtEmail = $("#newEmail").val();
				if (txtOTP === "") {
					Swal.fire("Lỗi", "Nhập vào mã OTP!", "warning");
					return;
				}

				$.ajax({
					url: "/hibook/verify/email",
					method: "POST",
					headers: {
						"X-CSRF-Token": $('#csrfTokenVerify').val()
					},
					data: {
						action: "verify-otp-email",
						otp_user: txtOTP
					},
					success: function(res) {
						if (res.status === "success") {
							Swal.fire({
		                        icon: "success",
		                        title: "Thành công!",
		                     	text: res.message,
		                        confirmButtonText: "OK"
	                    	}).then (() => {
	                    		$("#input-email").val(txtEmail);
	                    		$("#exampleModal").modal("hide");
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
						console.error("AJAX error:", status, error);
						console.error("Response text:", xhr.responseText);
						Swal.fire("Lỗi", "Không thể kết nối đến server verify", "error");
					}
				});
				
				
			});
			
			startOtpCountdown(null);
		}); 
		
		function startOtpCountdown(expireTime) {
		    const btnsend = document.getElementById("btn-get-otp");
		    const btnText = document.getElementById("btn-text");
		    let timer = null;

		    function updateCountdown() {
		        const now = new Date().getTime();
		        const distance = expireTime - now;

		        if (!expireTime || distance <= 0) {
		            btnText.textContent = "Gửi xác minh";
		            btnsend.disabled = false;
		            if (timer) clearInterval(timer);
		            return;
		        }

		        const seconds = Math.floor((distance % (1000 * 60)) / 1000);
		        btnText.textContent = "Gửi lại sau: " + seconds + "s ";
		        btnsend.disabled = true;
		    }

		    if (timer) clearInterval(timer);
		    updateCountdown();
		    timer = setInterval(updateCountdown, 1000);
		}
	</script>
</body>
</html>