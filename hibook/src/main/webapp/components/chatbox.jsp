<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!-- Button toggle chat box -->
<button id="toggle-btn-message" class="message-fixed text_dark-blue-50 ms-auto p-3 border d-flex justify-content-between align-items-center" style="width: fit-content;" type="button">
    <span class="nav-icon material-symbols-rounded">3p</span>
    <span class="ms-2">Message</span>
    <span class="group-messager ms-3 d-flex">
        <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar.jpg" alt="" width="24" height="24" class="d-block object-fit-cover rounded-circle">
        <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar1.jpg" alt="" width="24" height="24" class="d-block object-fit-cover rounded-circle">
        <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar2.jpg" alt="" width="24" height="24" class="d-block object-fit-cover rounded-circle">
    </span>
</button>
<!-- End style -->

<!-- Chat box -->
<section class="chatbox glass-border glass">
    <div class="chatbox-header d-flex justify-content-between">
        <span class="fs-5 fw-semibold text_dark-blue-50">Tin nhắn</span>
        <div class="group-btn">
            <button id="btn_openfullscreen-chatbox">
            <span class="material-symbols-rounded fs-4">open_in_full</span>
            </button>
            <button id="btn_close-chatbox">
                <span class="material-symbols-rounded fs-4">close</span>
            </button>
        </div>
       
    </div>
   
    <ul class="wrapper-message p-0">
            <li class="wrapper-message_item list-group-item mb-2">
                <div class="message p-2 d-flex align-items-center">
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
            <li class="wrapper-message_item list-group-item mb-2">
                <div class="message p-2 d-flex align-items-center">
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
                <div class="message p-2 d-flex align-items-center">
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
            <li class="wrapper-message_item list-group-item mb-2">
                <div class="message p-2 d-flex align-items-center">
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
            <li class="wrapper-message_item list-group-item mb-2">
                <div class="message p-2 d-flex align-items-center">
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
                <div class="message p-2 d-flex align-items-center">
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
</section>