<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Admin: Dashboard</title>
	<%@include file="../../assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <script src="${pageContext.request.contextPath}/assets/js/admin.js" defer></script>
</head>
<body>
	<!-- Sidebar navagition -->
	<%@include file="../../components/sidebar.jsp" %>
	<!-- Main body -->
	<main class="px-3">
		<!-- Admin navigation bar-->
		<%@include file="../../components/adminNavbar.jsp" %>
		
		<!-- Dashboard overall-->
		<section class="body container mb-2">
            <!-- chart -->
            <div class="row wrapper-chart">
                <div class="col-md-7 p-3">
                    <p class="h4 mb-3">Thống kê doanh thu</p>
                    <div class="line-chart glass-border glass rounded-3">
                        <img src="${pageContext.request.contextPath}/assets/images/line-chart.png" alt="" class="img-fluid object-fit-contain">
                    </div>
                </div>

                <div class="col-md-5 p-3">
                    <p class="h4 mb-3">Top sách bán chạy</p>
                    <div class="circle-chart d-flex justify-content-center align-items-center glass-border glass rounded-3">
                        <img src="${pageContext.request.contextPath}/assets/images/circle-chart.png" alt="" class="img-fluid">
                    </div>
                </div>
            </div>

            <!-- finance & message -->
            <div class="row wrapper-secondary">
                <!-- Tổng dữ liệu kho và ngân sách -->
                <div class="col-md-7 p-3">
                    <div class="row m-0">
                        <div class="col-md-4 ">
                            <div class="wrapper-content bg_dark-blue-950-o50 p-2 rounded-3">
                                <span class="nav-icon material-symbols-rounded p-2 h1 bg_dark-blue-950 text_dark-blue-200 rounded-3 glass-border glass">account_balance</span>
                                <p class="fs-6">Tổng doanh thu</p>
                                <p class="fs-4">17.500.000 đ</p>
                            </div>
                        </div>
                        <div class="col-md-4 ">
                            <div class="wrapper-content bg_dark-blue-950-o50 p-2 rounded-3">
                                <span class="nav-icon material-symbols-rounded p-2 h1 bg_dark-blue-950 text_dark-blue-200 rounded-3 glass-border glass">library_books</span>
                                <p class="fs-6">Kho sách</p>
                                <p class="fs-4">1.750</p>
                            </div>
                        </div>
                        <div class="col-md-4 ">
                            <div class="wrapper-content bg_dark-blue-950-o50 p-2 rounded-3">
                                <span class="nav-icon material-symbols-rounded p-2 h1 bg_dark-blue-950 text_dark-blue-200 rounded-3 glass-border glass">account_balance</span>
                                <p class="fs-6">Tổng doanh thu</p>
                                <p class="fs-4">17.500.000 đ</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Message Float -->
                <div class="col-md-5 p-3">
                    <ul class="wrapper-message p-0">
                        <li class="wrapper-message_item list-group-item mb-2">
                            <div class="message glass-border glass p-2 d-flex align-items-center bg_dark-blue-950-o50 rounded-3">
                                <span class="avatar-profile">
                                    <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar.jpg" alt="" width="36" height="36" class="object-fit-cover rounded-circle">
                                </span>
                                <span class="message d-flex flex-column w-75 ms-2" >
                                    <span class="messager-name">Như Hoa Ngọc Anh</span>
                                    <span class="text small d-inline-block text-truncate w-100">
                                        Xin chào shop!! Shop có thể hỗ trợ em được không ạ
                                        Xin chào shop!! Shop có thể hỗ trợ em được không ạ
                                    </span>
                                </span>
                                <span class="message-time small ms-auto">
                                    Bây giờ
                                </span>
                            </div>  
                        </li>
                        <li class="wrapper-message_item list-group-item mb-2 ">
                            <div class="message glass-border glass p-2 d-flex align-items-center bg_dark-blue-950-o50 rounded-3">
                                <span class="avatar-profile">
                                    <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar1.jpg" alt="" width="36" height="36" class="object-fit-cover rounded-circle">
                                </span>
                                <span class="message d-flex flex-column w-75 ms-2" >
                                    <span class="messager-name">Hoa Hải Đường</span>
                                    <span class="text small d-inline-block text-truncate w-100">
                                        Xin chào shop!! Shop khỏe không
                                       
                                    </span>
                                </span>
                                <span class="message-time small ms-auto">
                                    1p
                                </span>
                            </div>  
                        </li>
                        <li class="wrapper-message_item list-group-item mb-2">
                            <div class="message glass-border glass p-2 d-flex align-items-center bg_dark-blue-950-o50 rounded-3">
                                <span class="avatar-profile">
                                    <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar2.jpg" alt="" width="36" height="36" class="object-fit-cover rounded-circle">
                                </span>
                                <span class="message d-flex flex-column w-75 ms-2" >
                                    <span class="messager-name">Điêu Thuyền</span>
                                    <span class="text small d-inline-block text-truncate w-100">
                                        Anh ơi? Cho em hỏi sách Doraemon còn không
                                    </span>
                                </span>
                                <span class="message-time small ms-auto">
                                    17:50
                                </span>
                            </div>  
                        </li>
                    </ul>
                </div>
            </div>
            
           
       	</section>   
       	
       	<!-- Chat box -->
		<%@include file="../../components/chatbox.jsp" %>
	</main>
</body>
</html>