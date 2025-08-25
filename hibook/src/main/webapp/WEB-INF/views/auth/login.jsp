<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBook: Login</title>
<%@include file="/assets/allLibary.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" />
</head>
<body>
	<div class="container">
        <div class="row justify-content-center align-items-center">
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
                            Hãy đăng nhập để bắt đầu chuyến mua sắm
                        </p>
                    </div>

                    <form action="${pageContext.request.contextPath}/login" method="post" class="form px-5">
                        <div class="mb-3">
                            <label for="inputEmail" class="form-label text-dark-blue-50 font-roboto fw-bold">Email</label>
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
                                <input type="email" class="border-0 form-control" id="inputEmail" name="email" value='<c:if test="${not empty sessionScope.existed_email }">${sessionScope.existed_email }</c:if>'
                                    placeholder="Nhập vào email..." />
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label for="inputPassword" class="form-label text-dark-blue-50 font-roboto fw-bold">Mật
                                    khẩu</label>
                                <label for="inputPassword" class="form-label text-dark-blue-50 font-roboto">
	                                <a href="${pageContext.request.contextPath}/forgot-password/show" tabindex="-1" class="nav-link">
									  Quên mật khẩu ?
									</a>
								</label>
                            </div>
                            <div class="input-group custom-input-group">
                                <span class="input-group-text">
                                    <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M17 8V8C17 5.23858 14.7614 3 12 3V3C9.23858 3 7 5.23858 7 8V8M12 15.5V15.5C13.1046 15.5 14 14.6046 14 13.5V13.5C14 12.3954 13.1046 11.5 12 11.5V11.5C10.8954 11.5 10 12.3954 10 13.5V13.5C10 14.6046 10.8954 15.5 12 15.5V15.5ZM12 15.5V18M9.5 21H14.5C16.8346 21 18.0019 21 18.8856 20.5277C19.5833 20.1548 20.1548 19.5833 20.5277 18.8856C21 18.0019 21 16.8346 21 14.5V14.5C21 12.1654 21 10.9981 20.5277 10.1144C20.1548 9.4167 19.5833 8.84525 18.8856 8.47231C18.0019 8 16.8346 8 14.5 8H9.5C7.16537 8 5.99805 8 5.11441 8.47231C4.4167 8.84525 3.84525 9.4167 3.47231 10.1144C3 10.9981 3 12.1654 3 14.5V14.5C3 16.8346 3 18.0019 3.47231 18.8856C3.84525 19.5833 4.4167 20.1548 5.11441 20.5277C5.99805 21 7.16537 21 9.5 21Z" stroke="#a6c4ea" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </span>
                                <input type="password" class="border-0 form-control" id="inputPassword" name="password"
                                    placeholder="Nhập vào mật khẩu..." />
                            </div>
                        </div>

                        <div class="mb-3">
                            <button type="submit" class="btn btn-login font-roboto text-dark-blue-50 fs-5 fw-bold mt-3">
                                ĐĂNG NHẬP
                            </button>
                        </div>
                    </form>

                    <div class="group_other-login-method">
                        <p class="fs-6 font-roboto text-dark-blue-50 text-center">
                            Hoặc tiếp tục với
                        </p>
                        <ul class="group-icon d-flex justify-content-center">
                            <li>
                                <a href="" class="fs-3"><i class="fa-brands fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="" class="fs-3"><i class="fa-brands fa-google"></i></a>
                            </li>
                            <li>
                                <a href="" class="fs-3"><i class="fa-brands fa-github"></i></a>
                            </li>
                        </ul>
                    </div>

                    <div class="group_logup text-center">
                        <p class="text-dark-blue-50 fs-6">
                            Bạn chưa phải thành viên? <a href="${pageContext.request.contextPath}/register" class="text-decoration-none ">Đăng ký tại đây</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    $(document).ready(function() {
    	console.log("jquery ready");
	    <c:if test="${not empty sessionScope.errMsg_Login}">
	    console.log('${errMsg_Login}');
			Swal.fire({
				icon: 'error',
				title: 'Đăng nhập không thành công',
				text: 'Kiểm tra lại email hoặc mật khẩu'
			});
			<c:remove var="errMsg_Login" scope="session"/>
		</c:if> 
	});
    </script>
    
    
</body>
</html>