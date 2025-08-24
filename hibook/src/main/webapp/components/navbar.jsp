<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- navbar -->
<%
	String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css">
    <div class="wrapper-navbar container-fluid bg_dark-blue-50 my-1 py-2">
        <nav class="container ">
                <div class="row justify-content-between align-items-center">
                    <!-- logo -->
                    <div class="logo col-md-2 d-flex justify-content-center align-items-center">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/assets/images/logos/logo.png" alt="" width="50"></a>
                        <div class="wrapper-text">
                            <p class="font-Chango text_dark-blue-950 fs-large">HiBook</p>
                            <p class="text_dark-blue-600 fs-small">Book Store Webstie</p>
                        </div>                       
                    </div> 
                    <!-- end logo -->

                    <div class="col-md-7 row d-flex justify-content-between align-items-center">    
                        <!-- Category -->
                        <div class="dropdown col-2 m-0 p-0 text-center">
                            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M3 4C3 3.44772 3.44772 3 4 3H9.5C10.0523 3 10.5 3.44772 10.5 4V9.5C10.5 10.0523 10.0523 10.5 9.5 10.5H4C3.44772 10.5 3 10.0523 3 9.5V4Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linejoin="round"></path>
                                    <path d="M3 14.5C3 13.9477 3.44772 13.5 4 13.5H9.5C10.0523 13.5 10.5 13.9477 10.5 14.5V20C10.5 20.5523 10.0523 21 9.5 21H4C3.44772 21 3 20.5523 3 20V14.5Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linejoin="round"></path>
                                    <path d="M21 4.75V4C21 3.44772 20.5523 3 20 3H14.5C13.9477 3 13.5 3.44772 13.5 4V9.5C13.5 10.0523 13.9477 10.5 14.5 10.5H20C20.5523 10.5 21 10.0523 21 9.5V8.75" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M13.5 14.5C13.5 13.9477 13.9477 13.5 14.5 13.5H20C20.5523 13.5 21 13.9477 21 14.5V20C21 20.5523 20.5523 21 20 21H14.5C13.9477 21 13.5 20.5523 13.5 20V14.5Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linejoin="round"></path>
                                </svg>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </div>
                        <!-- end Category -->
                        
                        <form class="d-flex col-10 m-0 p-0" method="">
                            <div class="nav-search input-group custom-input-group w-100 m-0 p-0">
                                <input type="text" name="searchBar" id="searchBar" class="form-control" placeholder="Bạn tìm kiếm gì?">
                                <button class="p-0 px-2 m-0 input-group-text" type="submit">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M21 21L17.5967 17.5963M20.0385 11.5202C20.0385 16.2258 16.2243 20.0405 11.5192 20.0405C6.8142 20.0405 3 16.2258 3 11.5202C3 6.81464 6.8142 3 11.5192 3C16.2243 3 20.0385 6.81464 20.0385 11.5202Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round"></path>
                                    </svg>
                                </button>
                            </div>
                        </form> 
                    </div>

                    <!-- navbar link -->
                    <div class="col-md-3 navbar-link">
                       <ul class="d-flex justify-content-between p-0 m-0">
                            <li class="list-group-item">
                                <span class="icon">
                                    <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M10 6L9.9998 5.0004C9.99958 3.89567 10.8951 3 11.9998 3V3C13.1042 3 13.9996 3.89519 13.9998 4.9996L14 6M13.9994 18.5H17.4333C19.0267 18.5 19.8833 16.6282 18.8418 15.4224L18.1296 14.5978C17.2486 13.5777 16.8256 12.2404 16.9598 10.8992V10.8992C17.249 8.00848 14.979 5.5 12.0738 5.5H11.9264C9.02099 5.5 6.7507 8.00849 7.03964 10.8995V10.8995C7.17366 12.2405 6.7507 13.5777 5.86986 14.5977L5.15791 15.4221C4.11645 16.6282 4.9732 18.5 6.56666 18.5H9.9994M13.9994 18.5V19C13.9994 20.1046 13.104 21 11.9994 21V21C10.8948 21 9.9994 20.1046 9.9994 19V18.5M13.9994 18.5H9.9994" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linejoin="round"></path>
                                    </svg>
                                </span>
                                <a href="" class="nav-link text_dark-blue-800 fs-small">Thông báo</a>
                            </li>

                            <li class="list-group-item wrapper-cart">
                                <div class="overlap-group d-flex">
                                    <span class="icon">
                                        <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                        <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                        <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-800)"></path>
                                        </svg>  
                                    </span>
                                    <div class="total-quantity m-0 p-0 bg_dark-blue-950 text-center rounded-circle">
                                        <p class="p-0 m-0 text_dark-blue-50 fs-small" id="total-quantity">3</p>
                                    </div>
                                </div>
                                <a href="cart.html" class="nav-link text_dark-blue-800 fs-small">Giỏ hàng</a>
                            </li>
							<c:if test="${empty sessionScope.USER_ACC }">
							
							
								<li class="list-group-item">
	                                <a href="${pageContext.request.contextPath}/register" class="btn nav-link px-3 py-2 bg_dark-blue-200 text_dark-blue-800 rounded-pill fs-base">Đăng ký</a>
	                            </li>
	
	                            <li class="list-group-item ">
	                                <a href="${pageContext.request.contextPath}/login" class="btn nav-link px-3 py-2 bg_dark-blue-800 text_dark-blue-50 rounded-pill fs-base">Đăng nhập</a>
	                            </li>
							</c:if>
								
							<c:if test="${not empty sessionScope.USER_ACC }">
								<li class="list-group-item">
	                                <span class="fs-small text_dark-blue-950">${sessionScope.USER_ACC.fullname }</span>
	                            </li>
	
								<li class="list-group-item">
	                            	<div class="dropdown">
									  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
									   	<span>
									   		<c:if test="${ empty sessionScope.USER_ACC.avatar }">
									   		<img alt="avatar" src="${pageContext.request.contextPath}/assets/images/avatars/invalid-avatar.png"  
									   				width="32" height="32" class="object-fit-cover d-block rounded-circle">
									   		</c:if>
									   		
									   		<c:if test="${not empty sessionScope.USER_ACC.avatar }">
									   		<img alt="avatar" src="${pageContext.request.contextPath}/assets/images/avatars/${sessionScope.USER_ACC.avatar}"  
									   				width="32" height="32" class="object-fit-cover d-block rounded-circle">
									   		</c:if>
									   	</span>
									  </button>
									  <ul class="dropdown-menu">
									    <li class="d-flex flex-row border-bottom mb-3">
											<span class="nav-photo p-2">
											<c:if test="${empty sessionScope.USER_ACC.avatar }">
												<img alt="avatar" src="${pageContext.request.contextPath}/assets/images/avatars/invalid-avatar.png" 
								   						width="24" height="24" class="object-fit-cover d-block rounded-circle">
								   			</c:if>
								   			
											<c:if test="${not empty sessionScope.USER_ACC.avatar }">
												<img alt="avatar" src="${pageContext.request.contextPath}/assets/images/avatars/${sessionScope.USER_ACC.avatar}" 
								   						width="24" height="24" class="object-fit-cover d-block rounded-circle">
								   			</c:if>
								   			</span>
								   			<span class="nav-label p-2 text-start">
								   				${sessionScope.USER_ACC.fullname }
								   			</span>
									    </li>
									    <li class="mb-3">
									    	<a class="dropdown-item" href="${pageContext.request.contextPath }/user/show-info"><i class="fa-solid fa-user me-2"></i>Tài khoản của tôi</a>
									    </li>
									    <li class="mb-3">
									    	<a class="dropdown-item" href="#"><i class="fa-solid fa-gear me-2"></i>Cài đặt</a>
									    </li>
									    <li class="mb-3">
									    	<a class="dropdown-item" href="${pageContext.request.contextPath }/logout"><i class="fa-solid fa-right-from-bracket me-2"></i>Thoát</a>
									    </li>
									  </ul>
									</div>
								</li>
							</c:if>
                            
                            
                       </ul>
                    </div>
                    <!-- end navbar link -->
            </div>  
        </nav>   
    </div>       
<!-- end navbar -->
