<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<c:choose >
	<c:when test="${empty books}">
		<h1>Không tìm thấy sản phẩm</h1>
	</c:when>
	<c:otherwise>
		<div class="row wrapper-book">
			<c:forEach var="book" items="${books}">
				<div class="book-filter col-md-3 p-3">
					<div class="view-book text-center mb-3" data-id="${book.id}" onclick="window.location.href='/hibook/books/view?bookId=${book.id}'">
						<img src="/hibook/assets/images/books/${mapCoverPhoto[book.id]}" alt="${mapCoverPhoto[book.id]}" 
							class="object-fit-contain" 
							height="150">
					</div>
					<!-- title -->
		            <p class="lh-base truncate-muitiline" style="height: 3rem;">
		            	${book.name}
		            </p>
		            
					<!-- price & coupon -->
                    <div class="price-coupon d-flex align-items-center">
                        <div class="price me-3">
                            <p class="text-danger fw-bold fs-5 m-0">
                            	<span>
                            		<fmt:setLocale value="vi-VN"/>
                            		<fmt:formatNumber value="${book.price}"/> đ
                            	</span>
                            </p> 
                            <del class="small mute">
                            	<span>
                            		<fmt:setLocale value="vi-VN"/>
                            		<fmt:formatNumber value="${book.price}"/> đ
                            	</span>
                            </del>
                        </div>
                        <span class="p-1 bg_dark-blue-800 text-center text_dark-blue-50 rounded-2 small">-10%</span>
                    </div>
                    
					<!-- rate & cart -->
					<div class="rate-quantity d-flex align-items-center justify-content-between">
    					<div class="rate d-flex align-items-center">
				        	<i class="fa-solid fa-star text-warning"></i>
					        <span class="small text_gray-100">4.7</span>
						    <p class="small text_gray-100 m-0 ms-2">Chỉ còn: 
								<span class="text_dark-blue-800">${book.amount}</span>
							</p>
						</div>
                    </div>
				</div>	
			</c:forEach>
		</div>
		 <!-- page navigation --> 
		<input type="hidden" value="${currentPage}" name="currentPage" id="currentPage">
        <input type="hidden" value="${totalPages}" name="totalPages" id="totalPages">
        <script id="paginationData" type="application/json">
    		${pagination != null ? pagination : "[]"}
		</script>
        <div id="pagination" class="wrapper_page-navigation mt-3"></div>
	</c:otherwise>
</c:choose>
	
</body>
</html>