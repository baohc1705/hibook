<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>HiBook: Register</title>
   	<%@include file="/assets/allLibary.jsp" %>
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
<body style="height: 100vh !important;">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 group_main p-5">
                <div class="logo-home">
                    <img src="${pageContext.request.contextPath}/assets/images/logos/logo-home.png" alt="" height="50px" />
                </div>
                <div class="group_form mt-3">
                    <div class="group-header">   
                        <p class="fs-large text-center text-dark-blue-50 font-roboto">
                            Xác thực email
                        </p>
                        <p class="fs-base text-center text-dark-blue-50 font-roboto">
                            Vui lòng chọn gửi xác thực để tạo tài khoản
                        </p>
                    </div>
                    
					<c:if test="${not empty sessionScope.errMsg }">
						<p class="text-danger h4">${sessionScope.errMsg}</p>
						<c:remove var="errMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty msg }">
						<p class="text-danger h4">${msg}</p>
						<c:remove var="errMsg" scope="request"/>
					</c:if>
					
					<form id="form-sendOtpMail" action="${pageContext.request.contextPath}/verify/email" method="post" class="form px-5 mb-3">
                        <input type="text" name="csrfToken" value="${csrfToken}" id="csrfTokenSend">
                        <div class="wrapper-input mb-2">
	                        <input type="text" class="w-input" id="email" name="email"
	                               placeholder="Nhập vào email..." required="required"
	                               value="${sessionScope.userDeliveried.email }" readonly="readonly"/>
	                        <button id="btnSendEmail" type="submit" class="w-icon button-link fs-base">
	                           
	                        </button> 
	                    </div>
	                         	
                        <div class="d-flex justify-content-between">
                            <div id="progress-running" style="display: none;">
                                <span class="fs-base text_dark-blue-200 me-2">Đang gửi xác thực đến email của bạn</span>
                                <div class="spinner-border spinner-border-sm text_dark-blue-200 ms-auto" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
								
                            <span id="progress-complete" class="fs-base text-success-ct" style="display: none;">
                                <i class="fa-solid fa-circle-check"></i> Đã gửi thông tin xác nhận đến email của bạn
                            </span>
	                         	
                            <c:if test="${not empty requestScope.msgSuccessToken}">
                                <span class="fs-base text-success-ct">
                                    <i class="fa-solid fa-circle-check"></i> ${requestScope.msgSuccessToken }
                                </span>
                            </c:if>
	                         	
                            <c:if test="${not empty requestScope.msgErrorToken}">
                                <span class="fs-small text-danger-ct">
                                    <i class="fa-solid fa-triangle-exclamation"></i> ${requestScope.msgErrorToken }
                                </span>
                            </c:if>
	                         	
                            <span id="errMsg-email" class="fs-small text-danger-ct"></span>
                        </div> 
                    </form>  
					
                    <form id="form-verify" action="${pageContext.request.contextPath }/verify/email" method="post" class="form px-5">
                        <input type="text" name="csrfToken" value="${csrfToken}" id="csrfTokenVerify">
                        <div class="wrapper-input mb-3">
	                        <input type="text" class="w-input" id="otp_user" name="otp_user"
	                               placeholder="Nhập vào mã OTP 6 số..." required="required"/>
                        </div>
                        
                        <div class="mb-3">
                            <button id="btnVerify" type="submit" class="btn btn-login font-roboto text-dark-blue-50 fs-5 fw-bold mt-3">
                                XÁC MINH
                            </button>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
 
        function startOtpCountdown(expireTime) {
          	const btnsend = document.getElementById("btnSendEmail"); 
           
            let timer = null;

            function updateCountdown() {
                const now = new Date().getTime();
                const distance = expireTime - now;

                if (!expireTime || distance <= 0) {
                	btnsend.innerHTML = "Gửi xác minh";
                	btnsend.disabled = false;
                    if (timer) clearInterval(timer);
                    return;
                }

                const seconds = Math.floor((distance % (1000 * 60)) / 1000);
                btnsend.innerHTML = "Gửi lại sau: "+ seconds + "s ";
                btnsend.disabled = true;
            }
            
            if (timer) clearInterval(timer);
            updateCountdown();
            timer = setInterval(updateCountdown, 1000);
        }

        $(document).ready(function() {
            console.log("jQuery loaded!");
            <% 
		    Long expireTime = (Long) session.getAttribute("code_OTP_Time"); 
		    if (expireTime != null) { 
		    %>
		        startOtpCountdown(<%= expireTime %>);
		    <% } else { %>
		        startOtpCountdown(null);
		    <% } %>
		    
            // form verify OTP
            $('#form-verify').on('submit', function(e) {
                e.preventDefault();
                console.log("form-verify loaded!");
                let csrfToken = $("#csrfTokenVerify").val();
                console.log('csrf: ' + csrfToken);
                console.log('otp: ' + $('#otp_user').val());
                $.ajax({
                    url: '${pageContext.request.contextPath}/verify/email',
                    method: 'POST',
                    data: { 
                    	otp_user : $('#otp_user').val(),
                    	action: 'verify-otp'
                    },
                    headers: {
                    	"X-CSRF-Token": csrfToken
                    },
                    dataType: "json",
                    success: function(response) {
                        if (response.status === 'success') {
                            Swal.fire({
    	                        icon: "success",
    	                        title: "Thành công!",
    	                     	text: response.message,
    	                        confirmButtonText: "OK"
    	                    }).then(() => {
    	                    	window.location.href = "${pageContext.request.contextPath}/auth/login";
    	                    });
                        } else {
                            Swal.fire({
    	                        icon: "error",
    	                        title: "Thất bại",
    	                        text: response.message
    	                    });
                        }
                    },
                    error: function(xhr) {
                    	   console.error("AJAX error:", xhr.status, xhr.responseText);
                    	   Swal.fire({
                    	      icon: "error",
                    	      title: "Máy chủ bị lỗi",
                    	      text: "Status: " + xhr.status + " - " + xhr.responseText
                    	   });
                    	}
                });
            }); 
        	 
            // form gửi OTP mail
            $("#form-sendOtpMail").on("submit", function(e) {
                e.preventDefault();
                console.log("send otp mail loaded!");
                let txtemail = $("#email").val().trim();
                $("#progress-running").show();
                let csrfToken = $("#csrfTokenSend").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/verify/email",
                    method: "POST",
                    dataType: "json",
                    data: { 
                    	email: txtemail,
                    	action: 'otp'
                    },
                    headers: {
                    	"X-CSRF-Token": csrfToken
                    },
                    success: function(response) {
                        if (response.status === "success") {
                            Swal.fire({
                                icon: "success",
                                title: "Thành công!",
                                text: response.message,
                                confirmButtonText: "OK"
                            }).then(() => {
                                $("#progress-complete").show();

                                if (response.expireTime) {
                                    startOtpCountdown(parseInt(response.expireTime));
                                }
                            });
                        } else {
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
                    },
                    complete: function() {
                        $("#progress-running").hide();
                    }
                });
            });

           
        });
    </script>
</body>
</html>
