<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>

</head>
<body>
	<%
	String url1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>

	<!-- Navigation bar -->
	<%@include file="/components/navbar.jsp"%>

	<!-- Main body -->
	<c:set var="USER_ACC" scope="session" value="${sessionScope.USER_ACC }"></c:set>
	<c:if test="${not empty USER_ACC }">
		<main class="container">
			<div class="row justify-content-center my-3">
				<div class="col-md-8 p-3 bg_dark-blue-50 rounded-3">
					<div class="wrapper">
						<p class="fs-large text_dark-blue-950 mb-0">Hồ sơ của tôi</p>
						<p class="fs-base text_dark-blue-800">Quản lý thông tin hồ sơ
							để bảo mật tài khoản</p>

						<form action="${pageContext.request.contextPath }/user/edit-info" 
							method="post"
							enctype="multipart/form-data" 
							class="form d-flex w-100"
							id="formEdit">
							<div class="profile-form pe-3 w-50">
								<div class="form-row">
									<span class="label">Email</span> 
									<div class="form-input d-flex justify-content-between">
										<input id="input-email" type="email" value="${USER_ACC.email}" name="email" readonly="readonly">
										<button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="fs-small ms-auto">Thay đổi</span></button>
									</div>
								</div>

								<div class="form-row">
									<span class="label">Họ tên</span> 
									<input type="text" class="form-input" value="${USER_ACC.fullname}" name="fullname">
								</div>

								<div class="form-row">
									<span class="label">Ngày sinh</span> 
									<input type="date" class="form-input" value="${USER_ACC.birthDate}" name="birthDate">
								</div>

								<div class="form-row">
									<button type="submit" class="button-fill">Lưu</button>
								</div>
							</div>

							<div class="d-flex flex-column align-items-center justify-content-center w-50">
								<c:if test="${empty USER_ACC.avatar }">
									<img alt="avatar"
										src="<%=url1 %>/assets/images/avatars/invalid-avatar.png"
										width="128" height="128"
										class="object-fit-cover rounded-circle my-2"
										id="preview-avatar"> 
								</c:if>
								<c:if test="${not empty USER_ACC.avatar }">
								<img alt="avatar"
									src="<%=url1 %>/assets/images/avatars/${USER_ACC.avatar}"
									width="128" height="128"
									class="object-fit-cover rounded-circle my-2"
									id="preview-avatar"> 
								</c:if>
								<input class="form-control form-control-sm w-50 d-none" id="input-uploadfile" type="file" name="avatar-path" accept=".jpg,.png">
									
								<button type="button" class="button-border"id="btn-trigger_upload">Chọn ảnh</button>
								<p class="fs-small mb-0">Dung lượng tối đa 1MB</p>
								<p class="fs-small">Định dạng: .JPG, .PNG</p>
							</div>
						</form>
					</div>
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

	<script type="text/javascript">
		const buttonTrigger = document.getElementById('btn-trigger_upload');
		const inputUpload = document.getElementById('input-uploadfile');
		const previewAvatar = document.getElementById('preview-avatar');
	
		buttonTrigger.addEventListener ('click', () => {
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