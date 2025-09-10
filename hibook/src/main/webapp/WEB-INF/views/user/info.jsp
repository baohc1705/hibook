<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String url1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>
<div class="wrapper bg_dark-blue-50 rounded-3 p-3" >
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
		
		
		<c:if test="${empty USER_ACC.avatar}">
			<img alt="avatar"
				src="<%=url1 %>/assets/images/avatars/invalid-avatar.png"
				width="128" height="128"
				class="object-fit-cover rounded-circle my-2"
				id="preview-avatar"> 
		</c:if>
		<c:if test="${not empty USER_ACC.avatar}">
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