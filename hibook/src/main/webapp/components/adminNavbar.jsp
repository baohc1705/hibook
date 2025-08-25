<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="main-nav glass-border glass">
            <ul class="nav-list">
                <div class="wrapper-title">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <span class="nav-label h3 font-PaytoneOne text_dark-blue-50">Trang chủ</span>
                        </a>
                    </li>
                </div>
                
                <div class="wrapper-tool">
                    <li class="nav-item">
                        <form action="" class="d-flex">
                            <input type="text" class="nav-search" placeholder="Tìm kiếm">
                            <a href="#" class="nav-search-icon d-flex justify-content-center align-items-center">
                                <span class="nav-icon material-symbols-rounded">search</span>
                            </a>
                        </form>
                    </li>

                    <li class="nav-item d-flex justify-content-center align-items-center">
                        <button class="toggle-mode-btn">
                            <span class="nav-icon material-symbols-rounded">light_mode</span>
                        </button>
                        <button class="toggle-mode-btn active">
                            <span class="nav-icon material-symbols-rounded">mode_night</span>
                        </button>
                    </li>

                    <li class="nav-item d-flex align-items-center">
                        <button class="notification-btn position-relative">
                            <span class="nav-icon material-symbols-rounded text_dark-blue-50 fs-2">notifications</span>
                             <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </button>  
                    </li>

                    <li class="nav-item dropdown">
                        <button class="dropdown-btn-profile dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="avatar-profile">
                            <c:if test="${not empty sessionScope.ADMIN_ACC }">
                                <img src="${pageContext.request.contextPath}/assets/images/avatars/${sessionScope.ADMIN_ACC.avatar}" alt="profile-img" width="48" height="48" class="object-fit-cover rounded-circle">
                            </c:if>
                            </span>
                        </button>

                         <ul class="dropdown-menu">
                            <div class="">
                            	<c:if test="${not empty sessionScope.ADMIN_ACC }">
                                <li class="list-group-item d-flex align-items-center ">
                                    <span>
                                    
                                            <img src="${pageContext.request.contextPath}/assets/images/avatars/${sessionScope.ADMIN_ACC.avatar}" alt="profile-img" width="32" height="32" class="object-fit-cover rounded-circle">
                                    </span>
                                    <span class="d-flex flex-column ms-2">
                                        <span class="name">${sessionScope.ADMIN_ACC.fullname}</span>
                                        <span class="role small">${sessionScope.ADMIN_ACC.cateUser.name}</span>
                                    </span>
                                </li>
                                </c:if>

                                <li class="list-group-item ">
                                    <a href="" class="submenu-link nav-link d-flex align-items-center">
                                        <span class="nav-icon material-symbols-rounded">account_circle</span>
                                        <span class="ms-2 small">Tài khoản của tôi</span>
                                    </a>
                                </li>

                                <li class="list-group-item">
                                    <a href="" class="submenu-link nav-link d-flex align-items-center">
                                        <span class="nav-icon material-symbols-rounded">settings</span>
                                        <span class="ms-2 small">Cài đặt</span>
                                    </a>
                                </li>

                                <li class="list-group-item">
                                    <a href="${pageContext.request.contextPath }/logout" class="submenu-link nav-link d-flex align-items-center">
                                        <span class="nav-icon material-symbols-rounded">logout</span>
                                        <span class="ms-2 small">Thoát</span>
                                    </a>
                                </li>
                            </div>
                        </ul>
                    </li>
                </div>
            </ul>   
        </nav>