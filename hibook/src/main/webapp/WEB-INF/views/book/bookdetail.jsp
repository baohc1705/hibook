<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>HiBook: Book Detail</title>
	<%@include file="/assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css">
</head>
<body>

	<!-- Navigation bar -->
	<%@include file="/components/navbar.jsp" %>
	
	<!-- Main body-->
	<main class="container">
        <!-- breadcrumb -->
        <nav  style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="mt-3">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item small"><a href="#" class="nav-link text_dark-blue-800 fw-semibold">Trang chủ</a></li>
                <li class="breadcrumb-item small active" aria-current="page">Tiểu thuyết</li>
            </ol>
        </nav>
        <!-- end breadcrumb here -->

        <!-- detail book -->
        <div class="container">
            <div class="row">
                <div class="col-md-5 py-3 pe-3 ps-0">
                    <div class="wrapper-book w-100 text-center rounded-4 bg_dark-blue-50 px-3 py-4">
                        <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="w-50 object-fit-contain" height="400">

                        <div class="wrapper-book-detail-img d-flex justify-content-center my-3">
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-pic1.png" alt="" class="object-fit-contain mx-3"  height="100">
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-pic2.png" alt="" class="object-fit-contain mx-3"  height="100">
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-pic3.png" alt="" class="object-fit-contain mx-3"  height="100">
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-pic4.png" alt="" class="object-fit-contain mx-3"  height="100">
                            <span class="p-4 bg_dark-blue-800 text-center d-flex align-items-center text_dark-blue-50">+5</span>
                        </div>

                        <div class="purchase d-flex justify-content-center justify-content-evenly">
                            <button type="button" class="button-border">
                                <a href="cart.html" class="nav-link">
                                <span class="me-2">
                                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-800)"></path>
                                    </svg>
                                </span>
                                <span>Thêm vào giỏ hàng</span>
                                </a>
                            </button>

                            <button type="button" class="button-fill">
                               Mua ngay
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col-md-7 py-3 ps-3 pe-0">
                    <!-- title & price book -->
                    <div class="wrapper-title-price px-3 py-4 rounded-4 bg_dark-blue-50 mb-4">
                        <!-- title -->
                        <p class="h4 text_dark-blue-950 ">Biết khi nào mới gặp nhau</p>
                        <!-- author -->
                        <p class="small">Tác giả <a href="" class="ms-2 text-decoration-none fw-semibold text_dark-blue-800">Hoàng Khánh Duy</a></p>
                        <!-- rating -->
                        <div class="d-flex align-items-center mb-3">
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <span class="text-warning small">(155 đánh giá)</span>
                        </div>
                        <p class="small text-secondary">Đã bán <span class="text_dark-blue-800">2.2k</span></p>
                        <!-- price & coupon -->
                         <div class="d-flex align-items-center">
                            <p class="fs-4 fw-semibold text-danger m-0">40.000đ</p>
                            <del class="small text_gray-100 mute ms-2">50.000đ</del>
                            <span class="small text_dark-blue-50 bg_dark-blue-800 p-1 rounded-2 ms-2">-10%</span>
                         </div>
                    </div>

                    <!-- Description -->
                    <div class="wrapper-description px-3 py-4 rounded-4 bg_dark-blue-50">
                        <p class="fs-5 text_dark-blue-950 ">Mô tả sản phẩm</p> 
                        <span class="fw-semibold fs-6">Thông tin tác giả:</span>
                        <p class="small">
                           
                            Hoàng Khánh Duy tên thật là Phạm Khánh Duy, sinh ngày 16/8 tại Cà Mau. 
                            Hiện đang sống và viết lách tại TP. Cần Thơ. Hội viên Hội nhà văn TP. Cần Thơ.
                            Năm 2017 đoạt giải Nhì cuộc thi viết “Lonely SaiGon” do Readacity tổ chức.
                            Những cuốn sách đã xuất bản: Bộ truyện bốn mùa: Xuân: Triền sông con nước vơi đầy,
                            Hạ: Hoàng hôn màu đỏ, Thu: Cỏ dại, Đông: Lưng chừng nỗi nhớ.
                            Ngoài ra, Hoàng Khánh Duy còn góp mặt trong hai tuyển tập in chung: Giấc mơ trên những cánh rừng;
                            Yêu thôi, sao phải cưới?
                        </p>
                        <span class="fw-semibold fs-6">Thông tin tác phẩm:</span>
                        <p class="small">
                            
                            “Biết khi nào mới gặp lại nhau” là hồi tưởng về tuổi thơ của nhân vật Khang cùng cô bạn học gần nhà
                            tên Bụp và các bạn đồng trang lứa khác. Tuổi thơ của Khang đầy ắp những kỉ niệm với những trò tinh nghịch
                            như hái trộm hoa quả, trêu đùa với các bạn học cùng xóm, những trận đòn roi và cả những yêu thương vô bờ 
                            của gia đình. Nhưng tuổi thơ ấy đã ghi dấu tổn thương trong tâm hồn khi cậu bé phải chia li với cô bạn học.
                            Đám bạn năm xưa, mỗi người mỗi ngả. Nhỏ Bụp và Phượng Tím chỉ còn là hình bóng “người xưa”. Ai rồi cũng phải 
                            lớn lên, ai rồi cũng sẽ tới lúc phải xa quê hương. Mấy ai còn nhớ, mấy ai đã quên? Vì đời người là những chuyến đi,
                            là vòng xoáy bất tận, người ta dễ dàng lãng quên kí ức tuổi thơ như một quy luật tất yếu của cuộc đời, càng đi nhiều,
                            càng gặp nhiều và cũng càng quên đi nhiều những chuyện đã qua…
                         </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- end detail books -->

        <!-- rating -->
        <div class="container mb-3">
            <div class="row rounded-4 bg_dark-blue-50 px-3 py-4">
                <div class="col-md-5">
                    <p class="fs-5 text_dark-blue-950 fw-semibold">Đánh giá sản phẩm</p>
                    <div class="rating d-flex justify-content-between">
                        <div class="star text-center me-3">
                            <p class="fs-4">4.5 <span class="fs-6">/5</span></p>
                            <div class="d-flex">
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                            </div>
                            <p class="small text-warning">(155 đánh giá)</p>
                        </div>
                        <div class="chart-star w-75">
                            <div class="d-flex w-100 align-items-center">
                                <span class="small me-2">5 sao</span>
                                <div class="progress w-75" role="progressbar" aria-label="Basic example" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                                    <div class="progress-bar bg-warning" style="width: 90%"> 90% </div>
                                </div>
                            </div>

                            <div class="d-flex w-100 align-items-center">
                                <span class="small me-2">4 sao</span>
                                <div class="progress w-75" role="progressbar" aria-label="Basic example" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
                                    <div class="progress-bar bg-warning" style="width: 10%"> 10% </div>
                                </div>
                            </div>

                            <div class="d-flex w-100 align-items-center">
                                <span class="small me-2">3 sao</span>
                                <div class="progress w-75" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                    <div class="progress-bar bg-warning" style="width: 0%">0%</div>
                                </div>
                            </div>

                            <div class="d-flex w-100 align-items-center">
                                <span class="small me-2">2 sao</span>
                                <div class="progress w-75" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                    <div class="progress-bar bg-warning" style="width: 0%">0%</div>
                                </div>
                            </div>

                            <div class="d-flex w-100 align-items-center">
                                <span class="small me-2">1 sao</span>
                                <div class="progress w-75" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                    <div class="progress-bar bg-warning" style="width: 0%">0%</div>
                                </div>
                            </div>

                        </div>
                    </div>               
                </div>

                <div class="col-md-7">
                     <p class="fs-5 text_dark-blue-950 fw-semibold">Nhận xét của bạn</p>
                     <form action="">
                        <textarea name="" id="" class="form-control mb-3 small" style="height: 10rem;" placeholder="Bình luận ở đây..."></textarea>
                        <button type="submit" class="btn button-border"><i class="fa-solid fa-paper-plane me-2"></i>Gửi đi</button>
                     </form>
                </div>
            </div>
        </div>
        <!-- end rating here -->

        <!-- comment -->
        <div class="container mb-3 rounded-4 px-3 py-4 bg_dark-blue-50">
            <p class="fs-5 text_dark-blue-950 fw-semibold mb-3">Bình luận của khách hàng</p>
            <div class="wrapper-comment">
                <div class="row align-items-center justify-content-center mb-3">
                <div class="col-md-3 d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar.jpg" alt="" width="64" height="64" class="object-fit-cover rounded-circle">
                    <p class="fw-semibold m-0 ms-2">Như Hoa Ngọc Anh</p>
                </div>
                <div class="col-md-7">
                    <div class="d-flex align-items-center mb-3">
                        <i class="fa-solid fa-star text-warning"></i>
                        <i class="fa-solid fa-star text-warning"></i>
                        <i class="fa-solid fa-star text-warning"></i>
                        <i class="fa-solid fa-star text-warning"></i>
                        <i class="fa-solid fa-star text-warning"></i>
                        <span class="text-secondary small ms-2">Tuyệt vời</span>
                    </div>

                    <p class="lh-base small">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus reiciendis autem error ut dolorum harum dolor laborum, explicabo sed ratione.</p>
                    <div> 
                        <span class="me-3 small"><i class="fa-regular fa-thumbs-up"></i>12</span>
                        <span class="small"><i class="fa-regular fa-thumbs-down"></i>0</span>
                    </div>
                </div>
                </div>

                <div class="row align-items-center justify-content-center mb-3">
                    <div class="col-md-3 d-flex align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar2.jpg" alt="" width="64" height="64" class="object-fit-cover rounded-circle">
                        <p class="fw-semibold m-0 ms-2">Như Hoa Ngọc Anh</p>
                    </div>
                    <div class="col-md-7">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <span class="text-secondary small ms-2">Tuyệt vời</span>
                        </div>

                        <p class="lh-base small">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus reiciendis autem error ut dolorum harum dolor laborum, explicabo sed ratione.</p>
                        <div> 
                            <span class="me-3 small"><i class="fa-regular fa-thumbs-up"></i>12</span>
                            <span class="small"><i class="fa-regular fa-thumbs-down"></i>0</span>
                        </div>
                    </div>
                </div>

                <div class="row align-items-center justify-content-center mb-3">
                    <div class="col-md-3 d-flex align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar1.jpg" alt="" width="64" height="64" class="object-fit-cover rounded-circle">
                        <p class="fw-semibold m-0 ms-2">Như Hoa Ngọc Anh</p>
                    </div>
                    <div class="col-md-7">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <span class="text-secondary small ms-2">Tuyệt vời</span>
                        </div>

                        <p class="lh-base small">Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus reiciendis autem error ut dolorum harum dolor laborum, explicabo sed ratione.</p>
                        <div> 
                            <span class="me-3 small"><i class="fa-regular fa-thumbs-up"></i>12</span>
                            <span class="small"><i class="fa-regular fa-thumbs-down"></i>0</span>
                        </div>
                    </div>
                </div> 
            </div>
            
            <a class="text-decoration-none text_gray-100 fs-small">Xem thêm <i class="fa-solid fa-caret-down"></i></a>
        </div>
        <!-- end comment here -->

        <!-- recommend book -->
        <div class="new-trend container rounded-4 bg_dark-blue-50 px-0 mb-3">
        <p class="h1 container-fluid font-PaytoneOne text_dark-blue-50 py-4 bg_dark-blue-800 ps-3 rounded-top-4">Sách tương tự</p>
        <div class="wrapper-book py-3">
            <div class="row p-3">
                <div class="col-md-3 p-3">
                    <div class="item px-2 py-4">

                        <!-- photo book -->
                        <div class=" text-center mb-3">
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="img-fluid w-50">
                        </div>

                        <!-- title -->
                         <p class="lh-base">Biết khi nào mới gặp lại nhau</p>

                        <!-- price & coupon -->
                         <div class="price-coupon d-flex align-items-center">
                            <div class="price me-3">
                                <p class="text-danger fw-bold fs-5 m-0">40.000đ</p>
                                <del class="small mute">50.000đ</del>
                            </div>

                            <span class="p-1 bg_dark-blue-800 text-center text_dark-blue-50 rounded-2 small">-10%</span>
                         </div>

                         <!-- rate & cart -->
                        <div class="rate-quantity d-flex align-items-center justify-content-between">
                            <div class="rate d-flex align-items-center">
                                <i class="fa-solid fa-star text-warning"></i>
                                <span class="small text_gray-100">4.7</span>
                                <p class="small text_gray-100 m-0 ms-2">Chỉ còn: <span class="text_dark-blue-800">120</span></p>
                            </div>
                            <button type="button" class="btn bg_dark-blue-800">
                                 <span>
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-50)"></path>
                                    </svg>
                               </span>
                            </button>

                        </div>

                            
                    </div>
                </div>
              
                <div class="col-md-3 p-3">
                    <div class="item px-2 py-4">

                        <!-- photo book -->
                        <div class=" text-center mb-3">
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="img-fluid w-50">
                        </div>

                        <!-- title -->
                         <p class="lh-base">Biết khi nào mới gặp lại nhau</p>

                        <!-- price & coupon -->
                         <div class="price-coupon d-flex align-items-center">
                            <div class="price me-3">
                                <p class="text-danger fw-bold fs-5 m-0">40.000đ</p>
                                <del class="small mute">50.000đ</del>
                            </div>

                            <span class="p-1 bg_dark-blue-800 text-center text_dark-blue-50 rounded-2 small">-10%</span>
                         </div>

                         <!-- rate & cart -->
                        <div class="rate-quantity d-flex align-items-center justify-content-between">
                            <div class="rate d-flex align-items-center">
                                <i class="fa-solid fa-star text-warning"></i>
                                <span class="small text_gray-100">4.7</span>
                                <p class="small text_gray-100 m-0 ms-2">Chỉ còn: <span class="text_dark-blue-800">120</span></p>
                            </div>
                            <button type="button" class="btn bg_dark-blue-800">
                                 <span>
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-50)"></path>
                                    </svg>
                               </span>
                            </button>

                        </div>

                            
                    </div>
                </div>

                <div class="col-md-3 p-3">
                    <div class="item px-2 py-4">

                        <!-- photo book -->
                        <div class=" text-center mb-3">
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="img-fluid w-50">
                        </div>

                        <!-- title -->
                         <p class="lh-base">Biết khi nào mới gặp lại nhau</p>

                        <!-- price & coupon -->
                         <div class="price-coupon d-flex align-items-center">
                            <div class="price me-3">
                                <p class="text-danger fw-bold fs-5 m-0">40.000đ</p>
                                <del class="small mute">50.000đ</del>
                            </div>

                            <span class="p-1 bg_dark-blue-800 text-center text_dark-blue-50 rounded-2 small">-10%</span>
                         </div>

                         <!-- rate & cart -->
                        <div class="rate-quantity d-flex align-items-center justify-content-between">
                            <div class="rate d-flex align-items-center">
                                <i class="fa-solid fa-star text-warning"></i>
                                <span class="small text_gray-100">4.7</span>
                                <p class="small text_gray-100 m-0 ms-2">Chỉ còn: <span class="text_dark-blue-800">120</span></p>
                            </div>
                            <button type="button" class="btn bg_dark-blue-800">
                                 <span>
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-50)"></path>
                                    </svg>
                               </span>
                            </button>

                        </div>

                            
                    </div>
                </div>

                <div class="col-md-3 p-3">
                    <div class="item px-2 py-4">

                        <!-- photo book -->
                        <div class=" text-center mb-3">
                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="img-fluid w-50">
                        </div>

                        <!-- title -->
                         <p class="lh-base">Biết khi nào mới gặp lại nhau</p>

                        <!-- price & coupon -->
                         <div class="price-coupon d-flex align-items-center">
                            <div class="price me-3">
                                <p class="text-danger fw-bold fs-5 m-0">40.000đ</p>
                                <del class="small mute">50.000đ</del>
                            </div>

                            <span class="p-1 bg_dark-blue-800 text-center text_dark-blue-50 rounded-2 small">-10%</span>
                         </div>

                         <!-- rate & cart -->
                        <div class="rate-quantity d-flex align-items-center justify-content-between">
                            <div class="rate d-flex align-items-center">
                                <i class="fa-solid fa-star text-warning"></i>
                                <span class="small text_gray-100">4.7</span>
                                <p class="small text_gray-100 m-0 ms-2">Chỉ còn: <span class="text_dark-blue-800">120</span></p>
                            </div>
                            <button type="button" class="btn bg_dark-blue-800">
                                 <span>
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-50)"></path>
                                    </svg>
                               </span>
                            </button>

                        </div>

                            
                    </div>
                </div>
            </div>
            <div class="text-center mb-3 d-flex justify-content-center">
                 <button href="" class="button-border text-decoration-none text-center">Xem thêm</button>
            </div>
        </div>
    </div>
        <!-- end recommend book here -->
    </main>
	<!-- Footer -->
	<%@include file="/components/footer.jsp" %>
</body>
</html>