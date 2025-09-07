<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/assets/allLibary.jsp" %>
	
	<title>Welcome to HiBOOK</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/homepage.css">
    
</head>
<body>

	<!-- Navigation bar -->
	<%@include file="/components/navbar.jsp" %>
	
	<!-- Main body -->
	 <main>
	    <!-- banner -->
	    <div class="container my-3">
	        <div class="row justify-content-center">
	            <!-- left-banner -->
	            <div class="col-md-9 ">
	                <div id="carouselExampleIndicators" class="carousel slide rounded-4 w-100">
	                    <div class="carousel-indicators">
	                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	                    </div>
	
	                    <div class="carousel-inner rounded-4 w-100">
	                        <div class="carousel-item active">
	                             <div class="bn-wrapper d-flex justify-content-center align-items-center bg_dark-blue-200 rounded-4 w-100">
	                                <div class="bn-wrapper-text ms-5">
	                                    <p class="fs-5">NGÀY TỰU TRƯỜNG</p>
	                                    <p class="h1 font-PaytoneOne text_dark-blue-950">Giảm giá 50%</p>
	                                    <p class="fs-5 fst-italic">Cho tất cả sinh viên, học sinh</p>
	                                    <p>Áp dụng cho tất cả sách văn học, tiểu thuyết. Hãy ghé xem để mua về cho mình thật nhiều quyển sách hay.</p>
	                                    <button type="button" class="btn bg_dark-blue-800 text_dark-blue-50 rounded-pill py-2 px-3 d-flex justify-content-center align-items-center">Shop now
	                                        <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                        <path d="M4 12H20M20 12L17 9M20 12L17 15" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                        </svg>
	                                    </button>
	                                </div>
	                                <div class="wrapper-img-bn rounded-4">
	                                    <img src="${pageContext.request.contextPath}/assets/images/backgrounds/banner-bg.png" alt="" class="img-fluid">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="carousel-item">
	                            <div class="bn-wrapper d-flex justify-content-center align-items-center bg_dark-blue-200 rounded-4 w-100">
	                                <div class="bn-wrapper-text ms-5">
	                                    <p class="fs-5">NGÀY TỰU TRƯỜNG</p>
	                                    <p class="h1 font-PaytoneOne text_dark-blue-950">Giảm giá 50%</p>
	                                    <p class="fs-5 fst-italic">Cho tất cả sinh viên, học sinh</p>
	                                    <p>Áp dụng cho tất cả sách văn học, tiểu thuyết. Hãy ghé xem để mua về cho mình thật nhiều quyển sách hay.</p>
	                                    <button type="button" class="btn bg_dark-blue-800 text_dark-blue-50 rounded-pill py-2 px-3 d-flex justify-content-center align-items-center">Shop now
	                                        <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                        <path d="M4 12H20M20 12L17 9M20 12L17 15" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                        </svg>
	                                    </button>
	                                </div>
	                                <div class="wrapper-img-bn rounded-4">
	                                    <img src="${pageContext.request.contextPath}/assets/images/backgrounds/banner-bg.png" alt="" class="img-fluid">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="carousel-item">
	                            <div class="bn-wrapper d-flex justify-content-center align-items-center bg_dark-blue-200 rounded-4 w-100">
	                                <div class="bn-wrapper-text ms-5">
	                                    <p class="fs-5">NGÀY TỰU TRƯỜNG</p>
	                                    <p class="h1 font-PaytoneOne text_dark-blue-950">Giảm giá 50%</p>
	                                    <p class="fs-5 fst-italic">Cho tất cả sinh viên, học sinh</p>
	                                    <p>Áp dụng cho tất cả sách văn học, tiểu thuyết. Hãy ghé xem để mua về cho mình thật nhiều quyển sách hay.</p>
	                                    <button type="button" class="btn bg_dark-blue-800 text_dark-blue-50 rounded-pill py-2 px-3 d-flex justify-content-center align-items-center">Shop now
	                                        <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                        <path d="M4 12H20M20 12L17 9M20 12L17 15" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                        </svg>
	                                    </button>
	                                </div>
	                                <div class="wrapper-img-bn rounded-4">
	                                    <img src="${pageContext.request.contextPath}/assets/images/backgrounds/banner-bg.png" alt="" class="img-fluid">
	                                </div>
	                            </div>
	                        </div>
	                    </div>  
	                </div>
	            </div>
	            <!-- end left-banner -->
	            
	            <!-- best seller poster -->
	            <div class="col-md-3 ">
	                <div id="carousel-bestseller-poster" class="carousel slide " style="height: 100%;">
	                    <div class="carousel-inner" style="height: 100%;">
	                        <div class="carousel-item active" style="height: 100%;">
	                            <div class="bestseller-poster w-100" style="height: 100%;">
	                                <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="img-fluid img-bg">
	
	                                <div class="wrapper-content text-center w-100 d-flex flex-column justify-content-center align-items-center" style="height: 100%;">
	                                    <p class="h2 font-PaytoneOne text_dark-blue-50">Best seller</p>
	                                    <p class="text_dark-blue-50">Based sales this week</p>
	                                    <div class="wrapper-img rounded-5 pb-2">
	                                        <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="p-0 m-0 img-fluid w-50 rounded-3" id="bookPhoto">
	                                    </div>
	                                    <p class="text_dark-blue-50">Biết khi nào mới gặp lại nhau</p>
	                                    <p class="text_dark-blue-50">Tiểu thuyết</p>
	                                    <button type="button" class="btn bg_dark-blue-50 fw-bold text-danger"><del class="fs-mini text_gray-100">40.000 đ</del> 40.000đ</button>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="carousel-item " style="height: 100%;">
	                            <div class="bestseller-poster w-100" style="height: 100%;">
	                                <img src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png" alt="" class="img-fluid img-bg rounded-4 w-100">
	
	                                <div class="wrapper-content text-center w-100 d-flex flex-column justify-content-center align-items-center" style="height: 100%;">
	                                    <p class="h2 font-PaytoneOne text_dark-blue-50">Best seller</p>
	                                    <p class="text_dark-blue-50">Based sales this week</p>
	                                    <div class="wrapper-img rounded-5 pb-2">
	                                        <img src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png" alt="" class="p-0 m-0 img-fluid w-50 rounded-3" id="bookPhoto">
	                                    </div>
	                                    <p class="text_dark-blue-50">Biết khi nào mới gặp lại nhau</p>
	                                    <p class="text_dark-blue-50">Tiểu thuyết</p>
	                                    <button type="button" class="btn bg_dark-blue-50 fw-bold text-danger"><del class="fs-mini text_gray-100">40.000 đ</del> 40.000đ</button>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="carousel-item " style="height: 100%;">
	                            <div class="bestseller-poster w-100  " style="height: 100%;">
	                                <img src="${pageContext.request.contextPath}/assets/images/books/dragonball-tap16-bia.png" alt="" class="img-fluid img-bg rounded-4 w-100">
	
	                                <div class="wrapper-content text-center w-100 d-flex flex-column justify-content-center align-items-center" style="height: 100%;">
	                                    <p class="h2 font-PaytoneOne text_dark-blue-50">Best seller</p>
	                                    <p class="text_dark-blue-50">Based sales this week</p>
	                                    <div class="wrapper-img rounded-5 pb-2">
	                                        <img src="${pageContext.request.contextPath}/assets/images/books/dragonball-tap16-bia.png" alt="" class="p-0 m-0 img-fluid w-50 rounded-3" id="bookPhoto">
	                                    </div>
	                                    <p class="text_dark-blue-50">Biết khi nào mới gặp lại nhau</p>
	                                    <p class="text_dark-blue-50">Tiểu thuyết</p>
	                                    <button type="button" class="btn bg_dark-blue-50 fw-bold text-danger"><del class="fs-mini text_gray-100">40.000 đ</del> 40.000đ</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	
	                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel-bestseller-poster" data-bs-slide="prev">
	                        <span class="visually-hidden">Previous</span>
	                        <span class="carousel-control-prev-icon d-none" aria-hidden="true"></span>
	                        <span >
	                            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                            <path d="M12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                            <path d="M15.25 12H8.75M8.75 12L11.25 9.5M8.75 12L11.25 14.5" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                            </svg>
	                        </span>
	                    </button>
	
	                    <button class="carousel-control-next" type="button" data-bs-target="#carousel-bestseller-poster" data-bs-slide="next">
	                        <span class="carousel-control-next-icon d-none" aria-hidden="true"></span>
	                        <span class="visually-hidden">Next</span>
	                        <svg class="arrow-right" width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                        <path d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                        <path d="M8.75 12H15.25M15.25 12L12.75 9.5M15.25 12L12.75 14.5" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                        </svg>
	                    </button>
	                </div>
	            </div>
	
	            <!-- end best seller poster -->
	        </div>
	    </div>
	    <!-- end banner -->
	
	    <!-- menu -->
	    <div class="menu container mb-3 ">
	        <ul class="d-flex justify-content-evenly align-items-center m-0 p-0 bg_dark-blue-50 ">
	            <li class="list-group-item">
	                <span class=" p-2 icon">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path d="M5.23802 13.1144C4.40468 12.9847 3.988 12.9199 3.87272 12.6886C3.83709 12.6171 3.8191 12.5381 3.82027 12.4582C3.82406 12.1998 4.17159 11.961 4.86666 11.4833L15.669 4.05978C16.7185 3.33854 17.2432 2.97791 17.5065 3.10847C17.5863 3.14805 17.654 3.20823 17.7028 3.28278C17.8636 3.5287 17.5676 4.09244 16.9755 5.21992L14.6317 9.68363C14.4123 10.1016 14.3026 10.3105 14.3491 10.4958C14.364 10.555 14.3896 10.6109 14.4246 10.6608C14.5342 10.8173 14.7641 10.871 15.2237 10.9784L18.8677 11.8301C19.6653 12.0165 20.0641 12.1097 20.1628 12.3453C20.1933 12.4183 20.2061 12.4974 20.2001 12.5763C20.1808 12.831 19.8317 13.0452 19.1335 13.4736L8.20759 20.1769C7.16169 20.8185 6.63874 21.1394 6.38385 20.9987C6.30646 20.956 6.24177 20.8936 6.19638 20.8177C6.04688 20.5679 6.34918 20.034 6.95378 18.9663L9.21875 14.9662C9.47558 14.5126 9.60399 14.2858 9.55221 14.0891C9.53577 14.0266 9.50737 13.968 9.46861 13.9163C9.34653 13.7536 9.089 13.7136 8.57395 13.6334L5.23802 13.1144Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linejoin="round"></path>
	                    </svg>
	                </span>
	               <p class="fs-mini-100">Flash sale</p>
	            </li>
	
	            <li class="list-group-item">
	                <span class="p-2 icon">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path d="M3.5 13.5C7.21429 12.5714 9.07143 10.7143 10 7C10.9286 10.7143 12.7857 12.5714 16.5 13.5C12.7857 14.4286 10.9286 16.2857 10 20C9.07143 16.2857 7.21429 14.4286 3.5 13.5Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linejoin="round"></path>
	                    <path d="M13.5 6.5C15.5 6 16.5 5 17 3C17.5 5 18.5 6 20.5 6.5C18.5 7 17.5 8 17 10C16.5 8 15.5 7 13.5 6.5Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linejoin="round"></path>
	                    <path d="M14 19.25C15 19 15.5 18.5 15.75 17.5C16 18.5 16.5 19 17.5 19.25C16.5 19.5 16 20 15.75 21C15.5 20 15 19.5 14 19.25Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linejoin="round"></path>
	                    </svg>
	                </span>
	                <p class="fs-mini-100">Sản phẩm mới</p>
	            </li>
	
	            <li class="list-group-item">
	                <span class="p-2 icon">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path d="M9 5V5C8.07099 5 7.60649 5 7.21783 5.06156C5.07837 5.40042 3.40042 7.07837 3.06156 9.21783C3 9.60649 3 10.071 3 11V13C3 15.8003 3 17.2004 3.54497 18.27C4.02433 19.2108 4.78924 19.9757 5.73005 20.455C6.79961 21 8.19974 21 11 21H15C15.929 21 16.3935 21 16.7822 20.9384C18.9216 20.5996 20.5996 18.9216 20.9384 16.7822C21 16.3935 21 15.929 21 15V15M9 5V6.5M9 5V3M9 5H15M15 5H15.1C15.936 5 16.354 5 16.7045 5.04988C18.9065 5.36327 20.6367 7.09351 20.9501 9.29549C21 9.64598 21 10.064 21 10.9V10.9V11M15 5V3M15 5V6.5" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                    </svg>
	                </span>
	                <p class="fs-mini-100">Điểm danh mỗi ngày</p>
	
	            </li>
	
	            <li class="list-group-item">
	                <span class="p-2 icon">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path d="M14.5 10V10C14.5 8.89543 13.6046 8 12.5 8H12M12 8H11.5C10.3954 8 9.5 8.89543 9.5 10V10C9.5 11.1046 10.3954 12 11.5 12H12M12 8V6.5M12 8V12M12 12H12.5C13.6046 12 14.5 12.8954 14.5 14V14C14.5 15.1046 13.6046 16 12.5 16H12M12 12V16M12 16H11.5C10.3954 16 9.5 15.1046 9.5 14V14M12 16V17.5" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                    <path d="M17 4.51555C15.5699 3.55827 13.8501 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21C16.9706 21 21 16.9706 21 12C21 10.3607 20.5617 8.82378 19.796 7.5" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                    </svg>
	                </span>
	                <p class="fs-mini-100">Bán sách cũ</p>
	            </li>
	
	            <li class="list-group-item">
	                <span class="p-2 icon">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path d="M12 10.5H7M15 13.5H7" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                    <path d="M9 18.75H13.4553C14.7767 18.75 15.4374 18.75 16.0394 18.5391C16.2383 18.4694 16.431 18.3831 16.6154 18.281C17.1735 17.9721 17.6133 17.479 18.4928 16.4929L19.8285 14.9953C20.9527 13.7348 21.5148 13.1046 21.6236 12.3629C21.6589 12.1222 21.6589 11.8778 21.6236 11.6371C21.5148 10.8954 20.9527 10.2652 19.8286 9.00475L19.8285 9.00473L18.4928 7.5071C17.6133 6.52095 17.1735 6.02788 16.6154 5.71898C16.431 5.61693 16.2383 5.53061 16.0394 5.46092C15.4374 5.25 14.7767 5.25 13.4553 5.25H9C6.1877 5.25 4.78155 5.25 3.79581 5.96619C3.47745 6.19748 3.19748 6.47745 2.96619 6.79581C2.25 7.78155 2.25 9.1877 2.25 12C2.25 14.8123 2.25 16.2184 2.96619 17.2042C3.19748 17.5225 3.47745 17.8025 3.79581 18.0338C4.78155 18.75 6.1877 18.75 9 18.75Z" fill="var(--dark-blue-800)" fill-opacity="0.18"></path>
	                    </svg>
	                </span>
	                <p class="fs-mini-100">Mã khuyến mãi</p>
	            </li>
	
	            <li class="list-group-item">
	                <span class="p-2 icon">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path d="M12 3V5M12 3C9.51472 3 7.26472 4.00736 5.63604 5.63604M12 3C14.4851 3 16.735 4.00725 18.3637 5.63577M3 12C3 9.51472 4.00736 7.26472 5.63604 5.63604M3 12H5M3 12C3 14.4851 4.00725 16.735 5.63577 18.3637M5.63604 5.63604L7.04929 7.04929M18.3637 5.63577C19.9925 7.26447 21 9.51458 21 12M18.3637 5.63577L16.9495 7.04998M21 12L19 12M21 12C21 14.4853 19.9926 16.7353 18.364 18.364M12 21V19M12 21C14.4853 21 16.7353 19.9926 18.364 18.364M12 21C9.51458 21 7.26447 19.9925 5.63577 18.3637M18.364 18.364L16.9488 16.9488M5.63577 18.3637L7.04998 16.9495M11.9996 10.5V10.5C12.828 10.5 13.5 11.1716 13.5 12V12C13.5 12.8284 12.8284 13.5 12 13.5V13.5C11.1716 13.5 10.5 12.8282 10.5 11.9998V11.9998C10.5 11.1716 11.1714 10.5 11.9996 10.5V10.5ZM11.9996 10.5V7.75" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                    </svg>
	                </span>
	                <p class="fs-mini-100">Sinh nhật 1 tuổi</p>
	            </li>
	        </ul>
	    </div>
	    <!-- end menu here -->
	
	    <!-- flash sale -->
	    <div class="container-fluid bg-flash-sale p-3">
	        <div class="container">
	            <div class="wrapper-text bg_dark-blue-50 d-flex justify-content-between p-3 rounded-4 mt-3">
	                <div class="text-left d-flex align-items-center">
	                    <p class="p-0 m-0 mx-3 h2 font-PaytoneOne text_dark-blue-950">FLASH SALE</p>
	                    <p class="p-0 m-0 ">Kết thúc trong:</p> <span class="m-1 p-1 bg_dark-blue-800 rounded-1 text_dark-blue-50">12</span>: <span class="m-1 p-1 bg_dark-blue-800 rounded-1 text_dark-blue-50">30</span>: <span class="m-1 p-1 bg_dark-blue-800 rounded-1 text_dark-blue-50">59</span>
	                </div>
	               
	                <button type="button" class="btn text_dark-blue-200">Xem tất cả 
	                    <span class="m-0 p-0">
	                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                        <path d="M9.5 7L14.5 12L9.5 17" stroke="var(--dark-blue-200)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                        </svg>
	                    </span> 
	                </button>    
	            </div>
	            
				<!-- Book list -->
	            <div class="rounded-4 row">
	            	<c:forEach var="book" items="${requestScope.books }">
		                <div class="col-md-3 p-3">
		                    <div class="card h-100 rounded-4 shadow-sm bg_dark-blue-50">
		                        <!-- Image  -->
		                        <div class="text-center mt-3">
		                            <a href="bookDetail.html"><img src="${pageContext.request.contextPath}/assets/images/books/${mapCoverPhoto[book]}" class="w-50 img-fluid object-fit-contain" alt="Attack On Titan"></a>
		                        </div>
		
		                        <!-- Card Body -->
		                        <div class="card-body pt-2 pb-3 px-3">
		                            <p class="h6 card-title mb-2 text-wrap">${book.name}</p> 
		
		                            <div class="d-flex align-items-center mb-1">
		                                <span class="fw-bold text-danger me-2">${book.price}</span>
		                                <span class="badge bg-danger">-10%</span>
		                            </div>
		
		                            <del class="text-muted small">${book.price}</del>
		
		                            <div class="progress mt-3" role="progressbar" aria-label="shortage" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
		                                <div class="progress-bar bg_dark-blue-800" style="width: 25%;">Sắp hết</div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
	                </c:forEach>
	               <%-- <div class="col-md-3 p-3">
	                   <div class="card h-100 rounded-4 shadow-sm bg_dark-blue-50">
	                        <!-- Image  -->
	                        <div class="text-center mt-3 ">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" class="img-fluid w-50" alt="Attack On Titan">
	                        </div>
	
	                        <!-- Card Body -->
	                        <div class="card-body pt-2 pb-3 px-3">
	                            <p class="h6 card-title mb-2 text-wrap">Biết khi nào mới gặp nhau Biết khi nào mới gặp nhau </p> 
	
	                            <div class="d-flex align-items-center mb-1">
	                                <span class="fw-bold text-danger me-2">43.200 đ</span>
	                                <span class="badge bg-danger">-10%</span>
	                            </div>
	
	                            <del class="text-muted small">48.000 đ</del>
	
	                            <div class="progress mt-3" role="progressbar" aria-label="shortage" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
	                                <div class="progress-bar bg_dark-blue-800" style="width: 25%;">Sắp hết</div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	
	                 <div class="col-md-3 p-3">
	                   <div class="card h-100 rounded-4 shadow-sm bg_dark-blue-50">
	                        <!-- Image  -->
	                        <div class="text-center mt-3 ">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" class="img-fluid w-50" alt="Attack On Titan">
	                        </div>
	
	                        <!-- Card Body -->
	                        <div class="card-body pt-2 pb-3 px-3">
	                            <p class="h6 card-title mb-2 text-wrap">Biết khi nào mới gặp nhau Biết khi nào mới gặp nhau </p> 
	
	                            <div class="d-flex align-items-center mb-1">
	                                <span class="fw-bold text-danger me-2">43.200 đ</span>
	                                <span class="badge bg-danger">-10%</span>
	                            </div>
	
	                            <del class="text-muted small">48.000 đ</del>
	
	                            <div class="progress mt-3" role="progressbar" aria-label="shortage" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
	                                <div class="progress-bar bg_dark-blue-800" style="width: 30%;">Còn lại 30</div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	                 <div class="col-md-3 p-3">
	                   <div class="card h-100 rounded-4 shadow-sm bg_dark-blue-50">
	                        <!-- Image  -->
	                        <div class="text-center mt-3 ">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" class="img-fluid w-50" alt="Attack On Titan">
	                        </div>
	
	                        <!-- Card Body -->
	                        <div class="card-body pt-2 pb-3 px-3">
	                            <p class="h6 card-title mb-2 text-wrap">Biết khi nào mới gặp nhau Biết khi nào mới gặp nhau </p> 
	
	                            <div class="d-flex align-items-center mb-1">
	                                <span class="fw-bold text-danger me-2">43.200 đ</span>
	                                <span class="badge bg-danger">-10%</span>
	                            </div>
	
	                            <del class="text-muted small">48.000 đ</del>
	
	                            <div class="progress mt-3" role="progressbar" aria-label="shortage" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
	                                <div class="progress-bar bg_dark-blue-800" style="width: 55%;">Còn lại 50</div>
	                            </div>
	                        </div>
	                    </div>
	                </div> --%>
	            </div>
	
	
	        </div>
	    </div>
	    <!-- end flash sale here -->
	
	    <!-- special offers -->
	    <div class="container p-3 my-3">
	        <p class="h1 text_dark-blue-950 font-PaytoneOne text-center">Special Offers</p>
	        <p class="small text-center text_dark-blue-800">Top sách được mua nhiều nhất</p>
	        <div class="row special-books">
	            <div class="col-md-4">
	               
	                <div class="card h-100 rounded-4 overflow-hidden"> 
	                    <!-- Coupon -->
	                    <div class="coupon bg-danger text_dark-blue-50 text-center" style="width: 200px; height: 30px;" >
	                        <p class="text-center p-0 m-0">Sale 10%</p>
	                    </div>
	                    
	                    <!-- Book Image -->
	                    <img src="${pageContext.request.contextPath}/assets/images/books/dragonball-tap16-bia.png" class="card-img-top object-fit-cover" style="height: 220px;" alt="Hoàng hôn màu đỏ">
	
	                    <!-- Card Body -->
	                    <div class="card-body d-flex flex-column justify-content-between">
	                        <!-- Title -->
	                        <h5 class="card-title fw-bold mb-2">Hoàng hôn màu đỏ</h5>
	
	                        <!-- Tags -->
	                        <ul class="md-2 d-flex p-0">
	                            <li class="list-group-item"><a href="" class="nav-link badge rounded-pill text-primary border border-primary me-1">Tiểu thuyết</a></li>
	                            <li class="list-group-item"><a href="" class="nav-link badge rounded-pill text-success border border-success">Truyện ngắn</a></li>
	                        </ul>
	
	                        <!-- Description -->
	                        <p class="card-text text-secondary small">
	                        Cuốn sách là tuyển tập 14 truyện ngắn về số phận, mảnh đời éo le, khắc nghiệt của con người miền Tây sông nước, làm bật lên sức sống kiên cường...
	                        </p>
	
	                        <!-- Author -->
	                        <a href="" class="nav-link text_dark-blue-950 fw-semibold mb-3">Hoàng Khánh Duy</a>
	
	                        <!-- Price & Add to cart -->
	                        <div class="d-flex justify-content-between align-items-center mt-auto">
	                            <a href="cart.html" class="btn btn-primary rounded-3 d-flex align-items-center">
	                               <span>
	                                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                    <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                    <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                    <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-50)"></path>
	                                    </svg>
	                               </span>
	                                 Thêm vào giỏ hàng
	                            </a>
	                            <div class="text-end">
	                                <div class="fw-bold fs-5 text-dark">40.000 đ</div>
	                                <del class="text-muted">50.000 đ</del>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="col-md-4">
	                <div class="card h-100 rounded-4 overflow-hidden">
	                    <!-- Coupon -->
	                    <div class="coupon bg-danger text_dark-blue-50 text-center" style="width: 200px; height: 30px;" >
	                        <p class="text-center p-0 m-0">Sale 10%</p>
	                    </div>
	
	                    <!-- Book Image -->
	                    <img src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png" class="card-img-top object-fit-cover" style="height: 220px;" alt="Hoàng hôn màu đỏ">
	
	                    <!-- Card Body -->
	                    <div class="card-body d-flex flex-column justify-content-between">
	                        <!-- Title -->
	                        <h5 class="card-title fw-bold mb-2">Hoàng hôn màu đỏ</h5>
	
	                        <!-- Tags -->
	                         <ul class="md-2 d-flex p-0">
	                            <li class="list-group-item"><a href="" class="nav-link badge rounded-pill text-primary border border-primary me-1">Tiểu thuyết</a></li>
	                            <li class="list-group-item"><a href="" class="nav-link badge rounded-pill text-success border border-success">Truyện ngắn</a></li>
	                        </ul>
	
	                        <!-- Description -->
	                        <p class="card-text text-secondary small">
	                        Cuốn sách là tuyển tập 14 truyện ngắn về số phận, mảnh đời éo le, khắc nghiệt của con người miền Tây sông nước, làm bật lên sức sống kiên cường...
	                        </p>
	
	                        <!-- Author -->
	                        <a href="" class="nav-link text_dark-blue-950 fw-semibold mb-3">Hoàng Khánh Duy</a>
	
	                        <!-- Price & Add to cart -->
	                        <div class="d-flex justify-content-between align-items-center mt-auto">
	                            <a href="" class="btn btn-primary rounded-3 d-flex align-items-center">
	                               <span>
	                                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                    <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                    <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                    <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-50)"></path>
	                                    </svg>
	                               </span>
	                                 Thêm vào giỏ hàng
	                            </a>
	                            <div class="text-end">
	                                <div class="fw-bold fs-5 text-dark">40.000 đ</div>
	                                <del class="text-muted">50.000 đ</del>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="col-md-4">
	                <div class="card h-100 rounded-4 overflow-hidden">
	                      <!-- Coupon -->
	                    <div class="coupon bg-danger text_dark-blue-50 text-center" style="width: 200px; height: 30px;" >
	                        <p class="text-center p-0 m-0">Sale 10%</p>
	                    </div>
	                    
	                    <!-- Book Image -->
	                    <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" class="card-img-top object-fit-cover" style="height: 220px;" alt="Hoàng hôn màu đỏ">
	
	                    <!-- Card Body -->
	                    <div class="card-body d-flex flex-column justify-content-between">
	                        <!-- Title -->
	                        <h5 class="card-title fw-bold mb-2">Hoàng hôn màu đỏ</h5>
	
	                        <!-- Tags -->
	                        <ul class="md-2 d-flex p-0">
	                            <li class="list-group-item"><a href="" class="nav-link badge rounded-pill text-primary border border-primary me-1">Tiểu thuyết</a></li>
	                            <li class="list-group-item"><a href="" class="nav-link badge rounded-pill text-success border border-success">Truyện ngắn</a></li>
	                        </ul>
	
	                        <!-- Description -->
	                        <p class="card-text text-secondary small">
	                        Cuốn sách là tuyển tập 14 truyện ngắn về số phận, mảnh đời éo le, khắc nghiệt của con người miền Tây sông nước, làm bật lên sức sống kiên cường...
	                        </p>
	
	                        <!-- Author -->
	                        <a href="" class="nav-link text_dark-blue-950 fw-semibold mb-3">Hoàng Khánh Duy</a>
	
	                        <!-- Price & Add to cart -->
	                        <div class="d-flex justify-content-between align-items-center mt-auto">
	                             <a href="" class="btn btn-primary rounded-3 d-flex align-items-center">
	                               <span>
	                                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                    <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                    <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                    <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-50)"></path>
	                                    </svg>
	                               </span>
	                                 Thêm vào giỏ hàng
	                            </a>
	                            <div class="text-end">
	                                <div class="fw-bold fs-5 text-dark">40.000 đ</div>
	                                <del class="text-muted">50.000 đ</del>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	        </div>
	
	        <div class="wrapper-prev-next-button d-flex justify-content-center align-items-center">
	            <a href="" class="nav-link m-2" id="btn-prev">
	                <span id="btn-prev-not-fill">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path d="M12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                    <path d="M15.25 12H8.75M8.75 12L11.25 9.5M8.75 12L11.25 14.5" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                    </svg>
	                </span>
	
	                <span id="btn-prev-fill">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12 21.75C17.3848 21.75 21.75 17.3848 21.75 12C21.75 6.61522 17.3848 2.25 12 2.25C6.61522 2.25 2.25 6.61522 2.25 12C2.25 17.3848 6.61522 21.75 12 21.75ZM11.7803 10.0303C12.0732 9.73744 12.0732 9.26256 11.7803 8.96967C11.4874 8.67678 11.0126 8.67678 10.7197 8.96967L8.21967 11.4697C7.92678 11.7626 7.92678 12.2374 8.21967 12.5303L10.7197 15.0303C11.0126 15.3232 11.4874 15.3232 11.7803 15.0303C12.0732 14.7374 12.0732 14.2626 11.7803 13.9697L10.5607 12.75H15.25C15.6642 12.75 16 12.4142 16 12C16 11.5858 15.6642 11.25 15.25 11.25H10.5607L11.7803 10.0303Z" fill="var(--dark-blue-800)"></path>
	                    </svg>
	                </span>
	            </a>
	
	            <a href="" class="nav-link m-2" id="btn-next">
	                <span id="btn-next-not-fill">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21Z" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                    <path d="M8.75 12H15.25M15.25 12L12.75 9.5M15.25 12L12.75 14.5" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                    </svg>
	                </span>
	
	                <span id="btn-next-fill">
	                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12 21.75C17.3848 21.75 21.75 17.3848 21.75 12C21.75 6.61522 17.3848 2.25 12 2.25C6.61522 2.25 2.25 6.61522 2.25 12C2.25 17.3848 6.61522 21.75 12 21.75ZM13.2803 8.96967C12.9874 8.67678 12.5126 8.67678 12.2197 8.96967C11.9268 9.26256 11.9268 9.73744 12.2197 10.0303L13.4393 11.25H8.75C8.33579 11.25 8 11.5858 8 12C8 12.4142 8.33579 12.75 8.75 12.75H13.4393L12.2197 13.9697C11.9268 14.2626 11.9268 14.7374 12.2197 15.0303C12.5126 15.3232 12.9874 15.3232 13.2803 15.0303L15.7803 12.5303C16.0732 12.2374 16.0732 11.7626 15.7803 11.4697L13.2803 8.96967Z" fill="var(--dark-blue-800)"></path>
	                    </svg>
	                </span>
	            </a>
	        </div>
	    </div>  
	    <!-- end special offers -->
	
	    <!-- new books -->
	    <div class="new-books container-fluid bg_dark-blue-200 py-3 mb-3">
	        <div class="container">
	            <div class="text-start my-3">
	                <img src="${pageContext.request.contextPath}/assets/images/backgrounds/dot-icon.png" alt="" width="64px" height="64px" class="">
	            </div>
	         
	            <div class="row justify-content-center align-items-center">
	                <div class="col-md-6 p-3">
	                    <p class="h1 text_dark-blue-950 font-PaytoneOne my-4">Sách mới</p>
	                    <div class="book-content bg_dark-blue-50 d-flex py-5 px-3 rounded-4">
	                        <div class="left-side w-50 text-center"> 
	                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="img-fluid object-fit-contain" width="200" height="300">
	                        </div>
	
	                        <div class="right-side w-50">
	                            <!-- title -->
	                             <div class="wapper-title d-flex mb-3">
	                                <a href="bookDetail.html"><img src="${pageContext.request.contextPath}/assets/images/icons/new-icon.png" alt="" width="48" height="48"></a>
	                                <p class="fw-bold lh-base ms-3">Biết khi nào mới gặp lại nhau</p>
	                             </div>
	
	                             <!-- tag -->
	                              <ul class="d-flex p-0">
	                                <li class="list-group-item small mx-2 p-1 rounded-2 border border-success text-success">
	                                    <a href="" class="nav-link">Tiểu thuyết</a>
	                                </li> 
	                                <li class="list-group-item small mx-2 p-1 rounded-2 border border-danger text-danger">
	                                    <a href="" class="nav-link">Ngôn tình</a>
	                                </li>
	                              </ul>
	
	                              <!-- Description -->
	                               <p class="small lh-base">
	                                Cuốn sách là tuyển tập 14 truyện ngắn về số phận, mảnh đời éo le, khắc nghiệt của con người miền Tây sông nước, làm bật lên sức sống kiên cường...
	                               </p>
	
	                               <!-- Author -->
	                                <a href="" class="nav-link mb-3 fw-bold text_dark-blue-950">Hoàng Khánh Duy</a>
	
	                                <!-- Price -->
	                                 <div class="wrapper-price d-flex justify-content-between align-items-center" >
	                                    <div class="price">
	                                        <p class="fw-bold m-0 text-danger fs-5">40.000 đ</p>
	                                        <del class="mute small m-0">50.000 đ</del>
	                                    </div>
	
	                                    <div class="purchase mx-1 d-flex">
	                                        <a href="cart.html" class="btn-border nav-link p-2 mx-1 text_dark-blue-800 text-center">Mua ngay</a>
	                                        <a href="cart.html" class="nav-link p-2 mx-1 text_dark-blue-50 bg_dark-blue-800 rounded-3">
	                                            <span>
	                                                <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                                <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                                <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                                <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-50)"></path>
	                                                </svg>
	                                            </span>
	                                        </a>
	                                    </div>
	                                 </div>
	                        </div>
	                    </div>
	                    
	
	                </div>
	                <div class="col-md-6">
	                    <div class="library-grid">
	                        <div class="book-item">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png" alt="Lão Hạc">
	                        </div>
	                        <div class="book-item">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="Clean Code">
	                        </div>
	                        <div class="book-item">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/dragonball-tap16-bia.png" alt="Chí Phèo">
	                        </div>
	                        <div class="book-item">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="Biết khi nào mới gặp lại nhau">
	                        </div>
	                        <div class="book-item">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/toi-uu-toan-dien-website-bia.png" alt="AI Agent Thực Chiến">
	                        </div>
	                        <div class="book-item">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/dragonball-tap16-bia.png" alt="Conan">
	                        </div>
	                    </div>
	
	                </div>
	            </div>
	            <div class="text-end dot-end my-3">
	                 <img src="${pageContext.request.contextPath}/assets/images/backgrounds/dot-icon.png" alt="" width="64px" height="64px" class="">
	            </div>
	           
	        </div>
	    </div>
	    <!-- end new books here -->
	
	    <!-- New trend -->
	    <div class="new-trend container rounded-4 bg_dark-blue-50 px-0 mb-3">
	        <p class="h1 container-fluid font-PaytoneOne text_dark-blue-50 py-4 bg_dark-blue-800 ps-3 rounded-top-4">Sách theo xu hướng</p>
	        <div class="wrapper-book py-3">
	            <ul class="d-flex mb-3">
	                <li class="list-group-item mx-3 p-2 "><a href="" class="nav-link">Tiểu thuyết</a></li>
	                <li class="list-group-item mx-3 p-2 "><a href="" class="nav-link">Truyện ngắn</a></li>
	                <li class="list-group-item mx-3 p-2 "><a href="" class="nav-link">Manga</a></li>
	            </ul>
				<!-- Book list -->
	            <div id="books-trend" class="row p-3">
	            	<!-- Data fetch here -->
	            </div>
	           
	            <div id="loader" class="spinner-border text-primary d-none" role="status">
				  <span class="visually-hidden">Loading...</span>
				</div>

	            <div class="row mb-3 ">
	            	<div class="col-12 w-100">
	            		<button type="button" id="btn-loadmore" class="button-border m-auto">Xem thêm</button>
	            	</div>     
	            </div>
	        </div>
	    </div>
	    <!-- end new trend here -->
	
	    <!-- combo -->
	    <div class="wrapper-combo container rounded-4 mb-3">
	        <p class="h1 container-fluid font-PaytoneOne text_dark-blue-50 py-4 ps-3">Combo Siêu Sốc</p>
	        <div class="wrapper-book pb-3">
	            <ul class="d-flex mb-2">
	                <li class="list-group-item mx-3 p-2 "><a href="" class="nav-link text_dark-blue-50">Tiểu thuyết</a></li>
	                <li class="list-group-item mx-3 p-2 "><a href="" class="nav-link text_dark-blue-50">Truyện ngắn</a></li>
	                <li class="list-group-item mx-3 p-2 "><a href="" class="nav-link text_dark-blue-50">Manga</a></li>
	            </ul>
	
	            <div class="row p-3">
	                <div class="col-md-3 p-3">
	                    <div class="item px-2 py-4">
	
	                        <!-- photo book -->
	                        <div class="combo-photo mb-3" style="height: 250px;">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="img-1" height="150">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/dragonball-tap16-bia.png" alt="" class="img-2" height="150">
	                        
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
	                        <div class="combo-photo mb-3" style="height: 250px;">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png" alt="" class="img-1" height="150">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/toi-uu-toan-dien-website-bia.png" alt="" class="img-2" height="150">
	                        
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
	                        <div class="combo-photo mb-3" style="height: 250px;">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/toi-uu-toan-dien-website-bia.png" alt="" class="img-1" height="150">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="img-2" height="150">
	                        
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
	                        <div class="combo-photo mb-3" style="height: 250px;">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/dragonball-tap16-bia.png" alt="" class="img-1" height="150">
	                            <img src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png" alt="" class="img-2" height="150">
	                        
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
	            <div class="text-center mb-3">
	                 <a href="" class="btn-border text-decoration-none text-center">Xem thêm</a>
	            </div>
	        </div>
	    </div>
	    <!-- end combo here -->
	
	    <!-- review -->
	    <div class="container review">
	        <p class="text-center font-PaytoneOne h1 text_dark-blue-950 py-4">NHẬN XÉT CỦA QUÝ KHÁCH</p>
	        <div class="text-center d-flex justify-content-center align-items-center mb-3">
	            <div class="group" >
	                <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar.jpg" alt="" width="64" height="64" class="group-avatar img-1">
	                <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar1.jpg" alt="" width="64" height="64" class="group-avatar img-2">
	                <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar2.jpg" alt="" width="64" height="64" class="group-avatar img-3">
	                <span class="group-avatar">12k+</span>
	            </div>
	        </div>
	
	        <div class="row mb-3">
	            <div class="col-md-4 p-3">
	                <div class="wrapper p-3 bg_dark-blue-50 rounded-4">
	                    <p class="text-center lh-base">Shop rất nhiệt tình. Sách rất tốt. Nội dung tuyệt vời. Xứng đáng 5 sao. Xứng đáng 5 sao.</p>
	                    <div class="wrapper-customer-comment d-flex justify-content-between">
	                        <div class="avatar d-flex align-items-center">
	                            <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar.jpg" alt="" width="64" height="64" class="object-fit-cover rounded-circle">
	                            <p class="mb-0 ms-2 fw-bold">Như Hoa Ngọc Anh</p>
	                        </div>
	
	                        <div class="star-rate d-flex align-items-center">
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                        </div>
	                    </div>
	                </div>
	            </div>
	           <div class="col-md-4 p-3">
	                <div class="wrapper p-3 bg_dark-blue-50 rounded-4">
	                    <p class="text-center lh-base">Shop rất nhiệt tình. Sách rất tốt. Nội dung tuyệt vời. Xứng đáng 5 sao. Xứng đáng 5 sao.</p>
	                    <div class="wrapper-customer-comment d-flex justify-content-between">
	                        <div class="avatar d-flex align-items-center">
	                            <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar1.jpg" alt="" width="64" height="64" class="object-fit-cover rounded-circle">
	                            <p class="mb-0 ms-2 fw-bold">Như Hoa Ngọc Anh</p>
	                        </div>
	
	                        <div class="star-rate d-flex align-items-center">
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4 p-3">
	                <div class="wrapper p-3 bg_dark-blue-50 rounded-4">
	                    <p class="text-center lh-base">Shop rất nhiệt tình. Sách rất tốt. Nội dung tuyệt vời. Xứng đáng 5 sao. Xứng đáng 5 sao.</p>
	                    <div class="wrapper-customer-comment d-flex justify-content-between">
	                        <div class="avatar d-flex align-items-center">
	                            <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar2.jpg" alt="" width="64" height="64" class="object-fit-cover rounded-circle">
	                            <p class="mb-0 ms-2 fw-bold">Như Hoa Ngọc Anh</p>
	                        </div>
	
	                        <div class="star-rate d-flex align-items-center">
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                            <i class="fa-solid fa-star text-warning"></i>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="btn-change-page text-center d-flex justify-content-center align-items-center mb-3">
	            <a href="" class="nav-link p-3 m-1 rounded-circle bg_dark-blue-50 d-flex justify-content-center align-items-center"><i class=" text_dark-blue-800 fa-solid fa-arrow-left fs-4"></i></a>
	            <a href="" class="nav-link p-3 m-1 rounded-circle bg_dark-blue-50 d-flex justify-content-center align-items-center"><i class=" text_dark-blue-800 fa-solid fa-arrow-right fs-4"></i></a>
	        </div>
	    </div>
	    <!-- end review here -->
	
	    <!-- email-contact -->
	    <div class="email-contact container text-center bg_dark-blue-800 rounded-4 p-5 d-flex flex-column justify-content-center align-items-center mb-3">
	        <p class="h2 text-center font-PaytoneOne text_dark-blue-50 py-4 w-50 px-3">Đăng ký bản tin để nhận thông báo mới nhất</p>
	        <form class="d-flex col-10 m-0 w-50 py-4" method="" >
	            <div class="nav-search input-group custom-input-group w-100 m-0 p-0">
	                <input type="text" name="searchBar" id="searchBar" class="form-control" placeholder="abc@gmail.com">
	                <button class="p-0 px-2 m-0 input-group-text" type="submit">
	                   Đăng Ký
	                </button>
	            </div>
	        </form> 
	    </div>
	    <!-- end email-contact here -->
    </main>

	<!-- Footer -->
	<%@include file="/components/footer.jsp" %>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/homepage.js"></script>
</body>
</html>