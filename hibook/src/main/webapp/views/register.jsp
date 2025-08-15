<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HiBook: Register</title>
   	<%@include file="../assets/allLibary.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" />
    <style type="text/css">
    	.errMsg {
    		color: var(--clr-danger);
    	}
    	
    	.successIcon {
    		background-color: rgba(0, 255, 0, 0.08);
    		padding: 0.1rem;
    		display: none;
    	}
    </style>
</head>
<body style="height: auto !important;">
    <div class="container">
        <div class="row justify-content-center align-items-center my-5" style="height: auto !important;">
            <div class="col-md-6 group_main p-5">
                <div class="logo-home">
                    <img src="${pageContext.request.contextPath}/assets/images/logos/logo-home.png" alt="" height="50px" />
                </div>
                <div class="group_form mt-3">
                    <div class="group-header">
                        <p class="h2 text-center text-dark-blue-50 font-paytone-one">
                            WELCOME BACK
                        </p>
                        <p class="fs-6 text-center text-dark-blue-50 font-roboto">
                            Hãy tạo tài khoản để bắt đầu chuyến mua sắm
                        </p>
                    </div>
                    
					<c:if test="${not empty requestScope.errMsg }">
						<p class="text-danger h4">${requestScope.errMsg}</p>
						<c:remove var="errMsg" scope="request"/>
					</c:if>
					
                    <form action="${pageContext.request.contextPath }/register" method="post" class="form px-5" >
                        <div class="mb-3">
                        	<div class="d-flex justify-content-between">
	                            <label for="inputEmail" class="form-label text-dark-blue-50 font-roboto fw-bold">Email</label>
	                            <span id="errMsg-email" class="errMsg"></span>
	                            <svg class="rounded-pill successIcon successEmail" width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M4 12L8.8 17L20 7" stroke="var(--clr-success)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
								</svg>
                            </div>
                            <div class="input-group custom-input-group">
                                <span class="input-group-text">
                                    <svg width="30" height="30" viewBox="0 0 24 24" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M3 12C3 9.67029 3 8.50544 3.3806 7.58658C3.88807 6.36144 4.86144 5.38807 6.08658 4.8806C7.00544 4.5 8.17029 4.5 10.5 4.5H13.5C15.8297 4.5 16.9946 4.5 17.9134 4.8806C19.1386 5.38807 20.1119 6.36144 20.6194 7.58658C21 8.50544 21 9.67029 21 12V12C21 14.3297 21 15.4946 20.6194 16.4134C20.1119 17.6386 19.1386 18.6119 17.9134 19.1194C16.9946 19.5 15.8297 19.5 13.5 19.5H10.5C8.17029 19.5 7.00544 19.5 6.08658 19.1194C4.86144 18.6119 3.88807 17.6386 3.3806 16.4134C3 15.4946 3 14.3297 3 12V12Z"
                                            stroke="#a6c4ea" stroke-width="1.5" stroke-linejoin="round"></path>
                                        <path
                                            d="M3 8L6.47486 10.7025C8.82448 12.5299 9.99929 13.4436 11.3413 13.6221C11.7788 13.6802 12.222 13.6802 12.6595 13.622C14.0015 13.4436 15.1762 12.5298 17.5258 10.7023L21 8"
                                            stroke="#a6c4ea" stroke-width="1.5" stroke-linejoin="round"></path>
                                    </svg>
                                </span>
                                <input type="email" class="border-0 form-control" id="email" name="email"
                                    placeholder="Nhập vào email..." required="required" onkeyup="checkEmail()"/>
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label for="password" class="form-label text-dark-blue-50 font-roboto fw-bold">Mật khẩu</label>
                                <span id="errMsg-pass" class="errMsg"></span>
                                <svg class="rounded-pill successIcon successPassword" width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M4 12L8.8 17L20 7" stroke="var(--clr-success)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
								</svg>
                            </div>
                            <div class="input-group custom-input-group">
                                <span class="input-group-text">
                                    <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M17 8V8C17 5.23858 14.7614 3 12 3V3C9.23858 3 7 5.23858 7 8V8M12 15.5V15.5C13.1046 15.5 14 14.6046 14 13.5V13.5C14 12.3954 13.1046 11.5 12 11.5V11.5C10.8954 11.5 10 12.3954 10 13.5V13.5C10 14.6046 10.8954 15.5 12 15.5V15.5ZM12 15.5V18M9.5 21H14.5C16.8346 21 18.0019 21 18.8856 20.5277C19.5833 20.1548 20.1548 19.5833 20.5277 18.8856C21 18.0019 21 16.8346 21 14.5V14.5C21 12.1654 21 10.9981 20.5277 10.1144C20.1548 9.4167 19.5833 8.84525 18.8856 8.47231C18.0019 8 16.8346 8 14.5 8H9.5C7.16537 8 5.99805 8 5.11441 8.47231C4.4167 8.84525 3.84525 9.4167 3.47231 10.1144C3 10.9981 3 12.1654 3 14.5V14.5C3 16.8346 3 18.0019 3.47231 18.8856C3.84525 19.5833 4.4167 20.1548 5.11441 20.5277C5.99805 21 7.16537 21 9.5 21Z" stroke="#a6c4ea" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </span>
                                <input type="password" class="border-0 form-control" id="password" name="password" 
                                placeholder="Nhập vào mật khẩu..." required="required"  onkeyup="checkPass()"/>
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label for="inputPasswordAgain" class="form-label text-dark-blue-50 font-roboto fw-bold">Nhập lại mật khẩu</label>
                                <span id="error-msg-password" class="errMsg"></span>
                                <svg class="rounded-pill successIcon successConfirmPasswword" width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M4 12L8.8 17L20 7" stroke="var(--clr-success)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
								</svg>
                            </div>
                            <div class="input-group custom-input-group" id="wrapper-passwordCheck">
                                <span class="input-group-text">
                                    <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M17 8V8C17 5.23858 14.7614 3 12 3V3C9.23858 3 7 5.23858 7 8V8M12 15.5V15.5C13.1046 15.5 14 14.6046 14 13.5V13.5C14 12.3954 13.1046 11.5 12 11.5V11.5C10.8954 11.5 10 12.3954 10 13.5V13.5C10 14.6046 10.8954 15.5 12 15.5V15.5ZM12 15.5V18M9.5 21H14.5C16.8346 21 18.0019 21 18.8856 20.5277C19.5833 20.1548 20.1548 19.5833 20.5277 18.8856C21 18.0019 21 16.8346 21 14.5V14.5C21 12.1654 21 10.9981 20.5277 10.1144C20.1548 9.4167 19.5833 8.84525 18.8856 8.47231C18.0019 8 16.8346 8 14.5 8H9.5C7.16537 8 5.99805 8 5.11441 8.47231C4.4167 8.84525 3.84525 9.4167 3.47231 10.1144C3 10.9981 3 12.1654 3 14.5V14.5C3 16.8346 3 18.0019 3.47231 18.8856C3.84525 19.5833 4.4167 20.1548 5.11441 20.5277C5.99805 21 7.16537 21 9.5 21Z" stroke="#a6c4ea" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </span>
                                <input type="password" class="border-0 form-control" id="passwordCheck" name="passwordCheck" 
                                placeholder="Hãy nhập lại mật khẩu..." onkeyup="checkPassword()" required="required"/>
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label for="inputFullname" class="form-label text-dark-blue-50 font-roboto fw-bold">Họ tên</label>
                                <span id="errMsg-fullname" class="errMsg"></span>
                                <svg class="rounded-pill successIcon successFullname" width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M4 12L8.8 17L20 7" stroke="var(--clr-success)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
								</svg>
                            </div>
                            <div class="input-group custom-input-group">
                                <span class="input-group-text">
                                    <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M4.16841 16.1211C5.2822 13.615 7.76737 12 10.5098 12H13.4902C16.2326 12 18.7178 13.615 19.8316 16.1211V16.1211C20.8514 18.4156 19.1718 21 16.6609 21H7.33909C4.82819 21 3.14864 18.4156 4.16841 16.1211V16.1211Z" stroke="#a6c4ea" stroke-width="1.5" stroke-linejoin="round"></path>
                                    <path d="M9 6C9 4.34315 10.3431 3 12 3C13.6569 3 15 4.34315 15 6C15 7.65685 13.6569 9 12 9C10.3431 9 9 7.65685 9 6Z" stroke="#a6c4ea" stroke-width="1.5" stroke-linejoin="round"></path>
                                    </svg>
                                </span>
                                <input type="text" class="border-0 form-control" id="fullname" name="fullname"
                                    placeholder="Nhập vào họ tên..." required="required" onkeyup="checkFullname()"/>
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label for="inputBirthDate" class="form-label text-dark-blue-50 font-roboto fw-bold">Ngày sinh</label>
                            </div>
                            <div class="input-group custom-input-group">
                                <span class="input-group-text">
                                    <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9 5V5C8.07099 5 7.60649 5 7.21783 5.06156C5.07837 5.40042 3.40042 7.07837 3.06156 9.21783C3 9.60649 3 10.071 3 11V13C3 15.8003 3 17.2004 3.54497 18.27C4.02433 19.2108 4.78924 19.9757 5.73005 20.455C6.79961 21 8.19974 21 11 21H13C15.8003 21 17.2004 21 18.27 20.455C19.2108 19.9757 19.9757 19.2108 20.455 18.27C21 17.2004 21 15.8003 21 13V11C21 10.071 21 9.60649 20.9384 9.21783C20.5996 7.07837 18.9216 5.40042 16.7822 5.06156C16.3935 5 15.929 5 15 5V5M9 5V6.5M9 5V3M9 5H15M15 5V3M15 5V6.5" stroke="#a6c4ea" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </span>
                                <input type="date" class="border-0 form-control" id="inputBirthDate" name="birthDate" required="required"/>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="checkAgree">
                                <label class="form-check-label text-dark-blue-50" for="checkAgree">
                                   Đồng ý với các điều khoản của chúng tôi.
                                </label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-login font-roboto text-dark-blue-50 fs-5 fw-bold mt-3" data-id="">
                                ĐĂNG KÝ
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/register.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function () {
    	    $("form").on("submit", function (e) {
    	        e.preventDefault(); 
    	        if (!validateForm()) {
    	            return; 
    	        }

    	        $.ajax({
    	            url: "${pageContext.request.contextPath}/register",
    	            method: "POST",
    	            data: $(this).serialize(), // form data
    	            success: function(response) {
    	                if (response === "success") {
    	                    Swal.fire({
    	                        icon: "success",
    	                        title: "Đăng ký thành công!",
    	                     	text: "Hãy tiếp tục đăng nhập",
    	                        confirmButtonText: "Đăng nhập"
    	                    }).then(() => {
    	                        window.location.href = "login.jsp";
    	                    });
    	                } else if (response === "exists") {
    	                    Swal.fire({
    	                        title: "Email đã đăng ký!",
    	                        text: "Bạn có muốn đăng nhập không?",
    	                        icon: "warning",
    	                        showDenyButton: true,
    	                        confirmButtonText: "Đăng nhập",
    	                        denyButtonText: `Quay lại`
    	                    }).then((result) => {
    	                        if (result.isConfirmed) {
    	                            window.location.href = "login.jsp";
    	                        } else if (result.isDenied) {
    	                            $("#email").focus();
    	                        }
    	                    });
    	                } else {
    	                    Swal.fire({
    	                        icon: "error",
    	                        title: "Đăng ký thất bại",
    	                        text: "Vui lòng thử lại!"
    	                    });
    	                }
    	            },
    	            error: function() {
    	                Swal.fire({
    	                    icon: "error",
    	                    title: "Máy chủ bị lỗi",
    	                    text: "Vui lòng thử lại sau!"
    	                });
    	            }
    	        });
    	    });
    	});
    	
    </script>
    
</body>
</html>