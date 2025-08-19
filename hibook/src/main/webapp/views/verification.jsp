<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
                            Chúng tôi đã gửi mã xác thực đến email: ${sessionScope.user_verification_otp.email }
                        </p>
                        <p class="fs-base text-center text-dark-blue-50 font-roboto">
                        	Mã OTP sẽ hết hạn sau: <span id="countdown"></span>
                        </p>
                    </div>
                    
					<c:if test="${not empty requestScope.errMsg }">
						<p class="text-danger h4">${requestScope.errMsg}</p>
						<c:remove var="errMsg" scope="request"/>
					</c:if>
					
                    <form id="form-verify" action="${pageContext.request.contextPath }/verification-email" method="post" class="form px-5" >
                        <div class="mb-3">
	                        <input type="text" class="border-0 form-control" id="otp_user" name="otp_user"
	                                  placeholder="Nhập vào mã OTP 6 số..." required="required"/>
                        </div>
                        
                        <div class="mb-3">
                            <button id="btnVerify" type="submit" class="btn btn-login font-roboto text-dark-blue-50 fs-5 fw-bold mt-3">
                                XÁC MINH
                            </button>
                        </div>
                    </form>
                    
                   <form action="${pageContext.request.contextPath }/resend-otp" method="post" class="text-center">
                        <button id="btnResend" type="submit" class="btn btn-outline-secondary mt-2" disabled>Gửi lại OTP</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        const expireTime = ${sessionScope.code_OTP_Time};
        const countdownEl = document.getElementById("countdown");
        const btnVerify = document.getElementById("btnVerify");
        const btnResend = document.getElementById("btnResend");

        function updateCountdown() {
            const now = new Date().getTime();
            const distance = expireTime - now;

            if (distance <= 0) {
                countdownEl.innerHTML = "Đã hết hạn!";
                btnVerify.disabled = true;
                btnResend.disabled = false;
                clearInterval(timer);
                return;
            }

            /* const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)); */
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);
            countdownEl.innerHTML = seconds + "s ";
        }

        updateCountdown(); // chạy lần đầu
        const timer = setInterval(updateCountdown, 1000);
        
        $(document).ready(function() {
        	$('#form-verify').on('submit', function(e) {
        		e.preventDefault();

        		$.ajax ({
        			url: '${pageContext.request.contextPath }/verification-email',
        			method: 'POST',
        			data: {otp_user : $('#otp_user').val()},
        			success: function(response) {
        				if (response.status === 'success') {
        					Swal.fire({
    	                        icon: "success",
    	                        title: "Thành công!",
    	                     	text: response.message,
    	                        confirmButtonText: "OK"
    	                    }).then(() => {
    	                    	window.location.href = "${pageContext.request.contextPath }/views/login.jsp";
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