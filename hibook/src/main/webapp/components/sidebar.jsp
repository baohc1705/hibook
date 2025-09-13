<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="sidebar collapsed"> 
        <!-- header sidebar -->
        <header class="sidebar-header">
            <a href="${pageContext.request.contextPath}/admin" class="nav-link header-logo d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/assets/images/logos/logo-admin.png" alt="logo">
                <div class="wrapper-text-logo d-flex flex-column ms-2">
                    <span class="font-Chango fs-5">HiBook</span>
                    <span class="small">Book Store</span>
                </div>
            </a>
            <button class="toggler-sidebar">
                <span class="material-symbols-rounded">keyboard_double_arrow_left</span>
            </button>
        </header>   
        <!-- end header sidebar -->

        <!-- navigation sidebar -->
        <nav class="sidebar-nav scrollbox">
            <ul class="list-group primary-nav scrollbox-inner">
                <li class="nav-item ">
                    <a href="${pageContext.request.contextPath}/admin" class="nav-link active">
                        <span class="nav-icon material-symbols-rounded">dashboard</span>
                        <span class="nav-label">Trang chủ</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <span class="nav-icon material-symbols-rounded">bar_chart_4_bars</span>
                        <span class="nav-label">Thống kê tài chính</span>
                    </a>
                    
                </li>

                <li class="nav-item">
                    <button onclick="toggleSubmenu(this)" id="toggle-submenu" class="nav-link" >
                        <span class="nav-icon material-symbols-rounded">group</span>
                        <span class="nav-label">Người dùng</span>
                        <span class="nav-icon material-symbols-rounded">keyboard_arrow_down</span>
                    </button>
                     
                    <ul class="list-group" id="submenu">
                        <div class="wrapper">
                            <li id="submenu-item">
                                <a href="" class="nav-link" id="submenu-link">Cấp quyền</a>
                            </li>
                            <li id="submenu-item">
                                <a href="" class="nav-link" id="submenu-link">Phân loại người dùng</a>
                            </li>
                            <li id="submenu-item">
                                <a href="" class="nav-link" id="submenu-link">Thông tin người dùng</a>
                            </li>
                        </div>
                    </ul>
                </li>

                <li class="nav-item">
                    <button onclick="toggleSubmenu(this)" id="toggle-submenu" class="nav-link toggle-submenu">
                        <span class="nav-icon material-symbols-rounded">menu_book</span>
                        <span class="nav-label">Sách</span>
                        <span class="nav-icon material-symbols-rounded">keyboard_arrow_down</span>
                    </button>
                    
                    <ul class="list-group" id="submenu">
                        <div class="wrapper">
                            <li id="submenu-item">
                                <a href="${pageContext.request.contextPath}/admin/books/show" class="nav-link" id="submenu-link">Thông tin sách</a>
                            </li>
                            <li id="submenu-item">
                                <a href="" class="nav-link" id="submenu-link">Thông tin tác giả</a>
                            </li>
                        </div>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/admin/bills?action=view-all" class="nav-link">
                        <span class="nav-icon material-symbols-rounded">receipt_long</span>
                        <span class="nav-label">Đơn hàng</span>
                    </a>
                   
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <span class="nav-icon material-symbols-rounded">comment</span>
                        <span class="nav-label">Bình luận</span>
                    </a>
                  
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <span class="nav-icon material-symbols-rounded">settings</span>
                        <span class="nav-label">Cài đặt</span>
                    </a>                 
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <span class="nav-icon material-symbols-rounded">help</span>
                        <span class="nav-label">Hỗ trợ</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <span class="nav-icon material-symbols-rounded">forum</span>
                        <span class="nav-label">Chat</span>
                    </a>
                    
                </li>
            </ul>   
        </nav> 
        <!-- end navigation sidebar -->
    </aside>