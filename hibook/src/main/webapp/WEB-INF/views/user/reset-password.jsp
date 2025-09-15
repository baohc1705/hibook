<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>

<style>
	.strength-bar{
		height: 10px;
		background-color: rgba(0,0,0,.05); 
	 	border-radius: 10px;
	}
	.password-strength {
		height: 10px;
		border-radius: 10px;
	}
	.strength-weak {
		background-color: red;
	}
	.strength-medium {
		background-color: yellow;
		
	}
	.strength-strong {
		background-color: green;
	}
	
</style>

</head>
	<div class="wrapper-reset-password bg_dark-blue-50 p-3 rounded-3">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<form action="${pageContext.request.contextPath}/user-information?page=reset-password&isUpdated=true" 
				method="post"
				id="form-reset-pass">
					<div class="mb-3"> 
						<label for="old-password">Mật khẩu cũ</label>
						<input type="password" 
								id="old-password" 
								name="old-password"
								class="form-control">
						
					</div>
					
					<div class="mb-3">
						<div class="row align-items-center">
							<div class="col-6">
								<label for="new-password">Mật khẩu mới</label>
							</div>
							<div class="col-6">
								<div id="strength-bar" class="">
									<div id="password-strength" class=""></div>
								</div>
								
							</div>
						</div> 
						
						<input type="password" 
								id="new-password" 
								name="new-password"
								class="form-control"
								onkeyup="validatePassword()">
						<small class="fs-small text-clr-black-o50">
							Mật khẩu: Có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặt biệt
						</small>
					</div>
					
					
					<div class="mb-3"> 
						<label for="confirm-password">Nhập lại mật khẩu</label>
						<input type="password" 
								id="confirm-password" 
								name="confirm-password"
								class="form-control" 
								onkeyup="validateConfirmPassword()">
						<div class="invalid-feedback"></div>
					</div>
					
					<button type="submit" class="button-fill w-100">Cập nhật</button>
				</form>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/user/reset-password.js"></script>
	</div>
	
</html>