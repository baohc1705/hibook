<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../assets/allLibary.jsp"%>

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
</style>

</head>
<body>
	<%
	String url1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>

	<!-- Navigation bar -->
	<%@include file="../components/navbar.jsp"%>

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

						<form action="<%=url1%>/edit-account" 
							method="post"
							enctype="multipart/form-data" 
							class="form d-flex w-100">
							<div class="profile-form pe-3 w-50">
								<div class="form-row">
									<span class="label">Email</span> <input type="email"
										class="form-input" value="${USER_ACC.email}" name="email">
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
	<%@include file="../components/footer.jsp"%>

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
			$('form').on('submit', function(e) {
				e.preventDefault();
				
				var formData = new FormData(this);
				
				$.ajax ({
					url: '${pageContext.request.contextPath}/edit-account',
					method: 'POST',
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
    	                    }).then(() => {
    	                    	location.reload();
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