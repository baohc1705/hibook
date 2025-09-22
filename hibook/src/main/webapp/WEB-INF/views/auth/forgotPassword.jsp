<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>HiBook: Forgot Password</title>
   	<%@include file="/assets/allLibary.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" />
</head>
<body style="height: 100vh !important;">
	<%
		String url1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 group_main p-5">
                <div class="logo-home">
                    <img src="${pageContext.request.contextPath}/assets/images/logos/logo-home.png" alt="" height="50px" />
                </div>
                <div class="group_form mt-3">
                    <div class="group-header">   
                        <p class="fs-xlarge text-center text-dark-blue-50 font-roboto">
                            QUÊN MẬT KHẨU
                        </p>
                        <p class="fs-base text-center text-dark-blue-50 font-roboto">
                            Nhập vào email để chúng tôi xác nhận email của bạn
                        </p>  
                    </div>

                    <form id="form-sendEmail" action="${pageContext.request.contextPath}/verify/email" method="post" class="form px-5 mb-3" >
                       	<input type="hidden" name="csrfToken" value="${csrfToken}" id="csrfToken">
                       	<input type="hidden" name="action" value="token">
                       	<div class="wrapper-input mb-2">
	                        <input type="text" class="w-input" id="email" name="email"
	                                  placeholder="Nhập vào email..." required="required" onkeyup="checkEmail()"/>
	                         <button type="submit" class="w-icon button-link">
	                         	Gửi xác minh
	                         </button> 
                         </div>
                         
                         <div class="d-flex justify-content-between">
                         
                   			<div id="progress-running" style="display: none;">
                   				<span class="fs-base text_dark-blue-200 me-2">Đang gửi xác thực đến email của bạn</span>
	                   			<div class="spinner-border spinner-border-sm text_dark-blue-200 ms-auto" role="status">
							  		<span class="visually-hidden">Loading...</span>
								</div>
                   			</div>
							
                         	<span id="progress-complete" class="fs-base text-success-ct" style="display: none;"><i class="fa-solid fa-circle-check"></i> Đã gửi thông tin xác nhận đến email của bạn</span>
                         	
                         	<c:if test="${not empty sessionScope.msgSuccessToken}">
                         		<span class="fs-base text-success-ct">
                         			<i class="fa-solid fa-circle-check"></i> ${sessionScope.msgSuccessToken }
                         		</span>
                         		<c:remove var="msgSuccessToken" scope="session"/>
                         	</c:if>
                         	
                         	<c:if test="${not empty sessionScope.msgErrorToken}">
                         		<span class="fs-small text-danger-ct">
                         			<i class="fa-solid fa-triangle-exclamation"></i> ${sessionScope.msgErrorToken }
                         		</span>
                         		<c:remove var="msgErrorToken" scope="session"/>
                         	</c:if>
                         	
                         	<span id="errMsg-email" class="fs-small text-danger-ct"></span>
                         </div> 
                    </form>       
                    
                    <form id="form-resetPassword" action="${pageContext.request.contextPath}/auth/forgot-password" method="post" class="form px-5" >
	                    <input type="hidden" name="csrfToken" value="${csrfToken}" id="csrfTokenResetPass">
	                    <input type="hidden" id="userid" name="userid" value="${user_id}" readonly="readonly">
	    				<input type="hidden" id="token_id" name="token_id" value="${token_id}" readonly="readonly">
                    	<div class="mb-3">
	                        <input type="password" class="input-custom_border" id="password" name="password"
	                                  placeholder="Nhập vào mật khẩu mới..." required="required" 
	                                  <c:if test="${!token_IsValid }">disabled="disabled"</c:if>/>
                        </div>
                        
                        <div class="mb-3">
	                        <input type="password" class="input-custom_border" id="confirmPassword" name="confirmPassword"
	                                  placeholder="Nhập lại mật khẩu..." required="required" 
	                                  <c:if test="${!token_IsValid }">disabled="disabled"</c:if> onkeyup="checkPassword()" />
                        </div>
                        <span id="error-msg-password" class="fs-small text-danger-ct"></span>
                        <div class="mb-3">
                            <button id="btnVerify" type="submit" class="btn btn-login font-roboto text-dark-blue-50 fs-5 fw-bold mt-3"
                             <c:if test="${!token_IsValid }">disabled="disabled"</c:if>>
                                XÁC NHẬN
                            </button>
                            <button id="btnVerify" type="submit" class="btn btn-login font-roboto text-dark-blue-50 fs-5 fw-bold mt-3"
                            	onclick="window.location.href = '${pageContext.request.contextPath}/auth/login'">
                    			TRỞ VỀ
                    		</button>
                        </div>
                    </form>
                                                
                </div>
            </div>
        </div>
    </div>
	
    <script type="text/javascript">
	    const validateEmail = (email) => {
			return email.match(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
			); // stackoverflow
		};
	    checkEmail = () => {
			let txtEmail = document.getElementById('email').value;
			var flag = false;
			if (txtEmail.trim().length == 0) {
				document.getElementById('errMsg-email').innerHTML = `<i class="fa-solid fa-triangle-exclamation"></i> Hãy điền vào email.`;
				return false;
			} 
			else if (!validateEmail(txtEmail)) {
				document.getElementById('errMsg-email').innerHTML = `<i class="fa-solid fa-triangle-exclamation"></i> Email không đúng dạng.`;
				return false;
			}
			document.getElementById('errMsg-email').innerHTML = "";
			return true;
		}
		
		checkPassword = () => {
			txtpassword = document.getElementById('password').value;
			txtpasswordCheck = document.getElementById('confirmPassword').value;
			if (txtpassword != txtpasswordCheck) {
				document.getElementById('error-msg-password').innerHTML = `<i class="fa-solid fa-triangle-exclamation"></i> Mật khẩu không khớp.`;
				return false;
			} else {
				document.getElementById('error-msg-password').innerHTML = "";
				return true;
			}
		}
		
		validateFormResetPass = () => {
			if (!checkPassword()) {
				document.getElementById('confirmPassword').focus();			
				return false;
			}
			return true;
		}
    
    	$(document).ready(function() {
    		$("#form-sendEmail").on("submit", function(e) {
    			e.preventDefault();
    			
    			let txtEmail = $("#email").val().trim();
    			let progRunning = $("#progress-running");
    			let progComplete = $("#progress-complete");
    			let csrfToken = $("#csrfToken").val().trim();
    			
    			if (!txtEmail) {
    				$("#errMsg-email").text("Email đã lỗi. Kiểm tra lại");
    				return;
    			}

    			progRunning.show();
    			progComplete.hide();
    			
    			$.ajax({
    				url: "${pageContext.request.contextPath}/verify/email",
    			    method: "POST",
    			    data: {
    			        email: txtEmail, 
    			        action: "token"
    			    },
    			    headers: {
    			        "X-CSRF-Token": csrfToken
    			    },
    			    dataType: "json",
    				success: function(response) {
    					if (response.status === "success") {
    						Swal.fire({
		                        icon: "success",
		                        title: "Thành công!",
		                     	text: response.message,
		                        confirmButtonText: "OK"
	                    	}).then (() => {
	                    		progComplete.show();
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
    	                    title: "Thất bại",
    	                    text: "Mất kết nối server"
    	                });
    				},
    				complete: function() {
    					progRunning.hide();	
    				}
    			});
    		});
    		
    		$("#form-resetPassword").on("submit", function(e) {
    			e.preventDefault();
    			
    			if (!checkPassword()) {
    				return;
    			}
    			
    			let txtuid = $("#userid").val();
    			let txtTokenID = $("#token_id").val();
    			let txtPass = $("#password").val();
    			let txtConfirmPass = $("#confirmPassword").val();
    			let csrfToken = $("#csrfTokenResetPass").val().trim();
    			
    			$.ajax({
    				url: "${pageContext.request.contextPath}/auth/forgot-password",
    				method: "POST",
    				data: {	
    					userid: txtuid, 
    					token_id: txtTokenID,
    					password: txtPass
    				},
    				headers: {
    					"X-CSRF-Token": csrfToken
    				},
    				dataType: "json",
    				success: function(response) {
    					if (response.status === "success") {
    						Swal.fire({
    							  icon: "success",
    							  title: "Thành công",
    							  text: response.message,
    							  showCancelButton: true,
    							  confirmButtonText: "Đi đến đăng nhập",
								  cancelButtonText: "Hủy"
    							}).then((result) => {
    							  
    							  if (result.isConfirmed) {
    								  window.location.href = "${pageContext.request.contextPath}/auth/login";
    							  }
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
						    title: "Thất bại",
						    text: "Mất kết nối với server"
						});
    				}		
    			});
    		});

    	});
    </script>
</body>
</html>