<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<title>HiBook: Cart</title>
	<%@include file="/assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart.css">
</head>
<body>
	<!-- Navigation bar -->
	<%@include file="/components/navbar.jsp" %>
	
	<!-- Main body -->
	<main class="container mb-3">
        <div class="row">
            <p class="h4 text_dark-blue-950 font-PaytoneOne mt-3 ms-3">GIỎ HÀNG</p>
            <div class="col-md-8 p-3">
                <div class="wrapper-table bg-white rounded-4 p-3">
                    <table class="table">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class=""></th>
                                <th>Chọn tất cả (2)</th>
                                <th></th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td><input type="checkbox" name="" id=""></td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="object-fit-contain " height="100">
                                </td>
                                <td class="text-wrap" style="width: 15rem;">Biết khi nào mới gặp lại nhau</td>
                                <td>
                                    <div class="amount">
                                        <span class="small"><i class="fa-solid fa-minus"></i></span>
                                        <input type="text" class="" value="1" id="amount">
                                        <span class="small"><i class="fa-solid fa-plus"></i></span>
                                    </div>
                                </td>
                                <td class="text-danger fw-semibold ">80.000 đ</td>
                                <td style="width: 2rem">
                                    <span>
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M5 6L5 14C5 15.8613 5 16.7919 5.24472 17.5451C5.73931 19.0673 6.93273 20.2607 8.45492 20.7553C9.20808 21 10.1387 21 12 21V21C13.8613 21 14.7919 21 15.5451 20.7553C17.0673 20.2607 18.2607 19.0673 18.7553 17.5451C19 16.7919 19 15.8613 19 14V14M5 6H3M5 6L9 6M19 6H21M19 6H15M19 6V10M9 6V6C9 5.06812 9 4.60218 9.15224 4.23463C9.35523 3.74458 9.74458 3.35523 10.2346 3.15224C10.6022 3 11.0681 3 12 3V3C12.9319 3 13.3978 3 13.7654 3.15224C14.2554 3.35523 14.6448 3.74458 14.8478 4.23463C15 4.60218 15 5.06812 15 6V6M9 6L15 6M9.5 9.5L9.5 16.5M14.5 9.5L14.5 16.5" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                        </svg>
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td><input type="checkbox" name="" id=""></td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="object-fit-contain " height="100">
                                </td>
                                <td class="text-wrap" style="width: 15rem;">Biết khi nào mới gặp lại nhau</td>
                                <td>
                                    <div class="amount">
                                        <span class="small"><i class="fa-solid fa-minus"></i></span>
                                        <input type="text" class="" value="1" id="amount">
                                        <span class="small"><i class="fa-solid fa-plus"></i></span>
                                    </div>
                                </td>
                                <td class="text-danger fw-semibold ">80.000 đ</td>
                                <td>
                                    <span>
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M5 6L5 14C5 15.8613 5 16.7919 5.24472 17.5451C5.73931 19.0673 6.93273 20.2607 8.45492 20.7553C9.20808 21 10.1387 21 12 21V21C13.8613 21 14.7919 21 15.5451 20.7553C17.0673 20.2607 18.2607 19.0673 18.7553 17.5451C19 16.7919 19 15.8613 19 14V14M5 6H3M5 6L9 6M19 6H21M19 6H15M19 6V10M9 6V6C9 5.06812 9 4.60218 9.15224 4.23463C9.35523 3.74458 9.74458 3.35523 10.2346 3.15224C10.6022 3 11.0681 3 12 3V3C12.9319 3 13.3978 3 13.7654 3.15224C14.2554 3.35523 14.6448 3.74458 14.8478 4.23463C15 4.60218 15 5.06812 15 6V6M9 6L15 6M9.5 9.5L9.5 16.5M14.5 9.5L14.5 16.5" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                        </svg>
                                    </span>
                                </td>
                            </tr>
                            
                            <tr>
                                <td><input type="checkbox" name="" id=""></td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="object-fit-contain " height="100">
                                </td>
                                <td class="text-wrap" style="width: 15rem;">Biết khi nào mới gặp lại nhau</td>
                                <td>
                                    <div class="amount">
                                        <span class="small"><i class="fa-solid fa-minus"></i></span>
                                        <input type="text" class="" value="1" id="amount">
                                        <span class="small"><i class="fa-solid fa-plus"></i></span>
                                    </div>
                                </td>
                                <td class="text-danger fw-semibold ">80.000 đ</td>
                                <td>
                                    <span>
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M5 6L5 14C5 15.8613 5 16.7919 5.24472 17.5451C5.73931 19.0673 6.93273 20.2607 8.45492 20.7553C9.20808 21 10.1387 21 12 21V21C13.8613 21 14.7919 21 15.5451 20.7553C17.0673 20.2607 18.2607 19.0673 18.7553 17.5451C19 16.7919 19 15.8613 19 14V14M5 6H3M5 6L9 6M19 6H21M19 6H15M19 6V10M9 6V6C9 5.06812 9 4.60218 9.15224 4.23463C9.35523 3.74458 9.74458 3.35523 10.2346 3.15224C10.6022 3 11.0681 3 12 3V3C12.9319 3 13.3978 3 13.7654 3.15224C14.2554 3.35523 14.6448 3.74458 14.8478 4.23463C15 4.60218 15 5.06812 15 6V6M9 6L15 6M9.5 9.5L9.5 16.5M14.5 9.5L14.5 16.5" stroke="var(--dark-blue-800)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                        </svg>
                                    </span>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                
            </div>
            <div class="col-md-4 p-3">
                <div class="wrapper-price bg-white rounded-4 p-3">
                    <div class="d-flex justify-content-between">
                        <p class="">Thành tiền</p>
                        <p>80.000đ</p>
                    </div>
                    <div class="d-flex justify-content-between">
                        <p class="">Phí vận chuyển</p>
                        <p>20.000đ</p>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold fs-5">Tổng tiền</p>
                        <p class="fw-bold fs-5 text-danger">100.000đ</p>
                    </div>
                    <a href="checkout.html" class="nav-link p-2 button-fill fw-semibold">THANH TOÁN</a>
                </div>
            </div>
        </div>
    </main>
    
	<!-- Footer -->
	<%@include file="/components/footer.jsp" %>
</body>
</html>