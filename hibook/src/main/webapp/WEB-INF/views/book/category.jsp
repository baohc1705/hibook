<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/assets/allLibary.jsp" %>
	
	<title>Danh mục sản phẩm</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/homepage.css">
	<style type="text/css">

		.wrapper-book .book-filter:hover {
			box-shadow: 
			-3px -3px 15px 5px rgba(255,255,255,1),
			3px 3px 15px 5px rgba(0,0,0,.25);
			cursor: pointer;
		}
		
		.list-filter {
			display: flex;
			align-items: center;
			text-decoration: none;
			padding: 0;
		}
		
		.list-filter .filter-text {
			padding: .5rem;
			border: 2px var(--dark-blue-600) solid;
			border-radius: .5rem;
			list-style-type: none;
			margin: 0 .2rem;
			background-color: var(--dark-blue-50);
			color: var(--dark-blue-800);
			font-size: var(--fs-base);
		}
		
		.list-filter .filter-text.clear-filter {
			border: 2px red solid !important;
			background: rgba(255,0,0,.15);
		}
		
		.quick-sort-tool span{
			padding: .25rem;
			color: rgba(0,0,0,.5);
			transition: all 300ms ease;
			cursor: pointer;
			font-size: var(--fs-base);	
		}
		
		.quick-sort-tool span.active {
			color: var(--dark-blue-800);
			font-weight: bold;
		}

		.wrapper-categories,
		.wrapper-filter-price,
		.wrapper-author {
		padding: 1rem;
			background-color: var(--dark-blue-50);
			border-radius: .5rem;
			border-bottom: 1px var(--dark-blue-200) dotted;
		}
		
		.wrapper-sidebar {
			font-size: var(--fs-base);
		}
		
		.wrapper-sidebar .header {
			text-transform: uppercase;
			font-weight: bold;
		}
		
		.wrapper_page-navigation {
			margin: 1rem 0;
			box-sizing: border-box;
			display: flex;
			align-items: center;
			justify-content: center;
		}
		.wrapper_page-navigation span {
			text-decoration: none;
			font-size: var(--fs-large);
			padding: .5rem 1rem;
			color: var(--dark-blue-800);
			transition: all 300ms ease;
			cursor: pointer;
			border-radius: .5rem;
		}
		.wrapper_page-navigation span:hover {
			background-color: var(--dark-blue-200);
		}
		.wrapper_page-navigation span.active {
			background-color: var(--dark-blue-800);
			color: var(--dark-blue-50);
		}
		
	</style>
</head>
<body>
	<!-- Navigation bar -->
	<%@include file="/components/navbar.jsp" %>
	<main class="container mb-3"> 
		<input type="hidden" value="${category}" id="category" name="category">
		
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
		    <li class="breadcrumb-item" aria-current="page">
		    	<span id="all-categories" style="cursor: pointer;">Tất cả danh mục</span>
		    </li>
		    <c:choose>
		    	<c:when test="${not empty category}">
		    		<c:forEach var="cate" items="${sessionScope.categories}">
		    			<c:if test="${cate.id == category}">
		    				<li class="breadcrumb-item active" aria-current="page">${cate.name}</li>
		    			</c:if>
                    </c:forEach>
		    	</c:when>
		    	<c:otherwise>
		    		<li class="breadcrumb-item active" aria-current="page">Tất cả danh mục</li>
		    	</c:otherwise>
		    </c:choose>
		  </ol>
		</nav>
		
		<div class="row">
			<div class="col-md-3">
				<div class="wrapper-sidebar">
					<div class="wrapper-categories">
						<div class="header">
							<span>danh mục sản phẩm</span>
						</div>
						<div class="option">
							<c:forEach var="cate" items="${sessionScope.categories}"> 
								<div class="form-check">
								  <input class="category form-check-input" 
								  type="checkbox" 
								  name="category"
								  id="category_${cate.id}" 
								  data-id="${cate.id}">
								  <label class="form-check-label" for="category_${cate.id}">
								    ${cate.name}
								  </label>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="wrapper-filter-price">
						<div class="header">
							<span>Giá</span>
						</div>
						<div class="option">
							<div class="form-check">
							  <input class="price form-check-input" 
								  type="checkbox" 
								  name="price" 
								  id="price1"
								  data-min-price='0'
								  data-max-price='50000'>
							  <label class="form-check-label" for="price1">
							    0đ - 50,000đ
							  </label>
							</div>
							
							<div class="form-check">
							  <input class="price form-check-input" 
								  type="checkbox" 
								  name="price" 
								  id="price2"
								  data-min-price='50000'
								  data-max-price='100000'>
							  <label class="form-check-label" for="price2">
							    50,000đ - 100,000đ
							  </label>
							</div>
							<div class="form-check">
							  <input class="price form-check-input" 
								  type="checkbox" 
								  name="price" 
								  id="price3"
								  data-min-price='100000'
								  data-max-price='200000'>
							  <label class="form-check-label" for="price3">
							    100,000đ - 200,000đ
							  </label>
							</div>
							<div class="form-check">
							  <input class="price form-check-input" 
								  type="checkbox" 
								  name="price" 
								  id="price4"
								  data-min-price='200000'
								  data-max-price='9999999'>
							  <label class="form-check-label" for="price4">
							    200.000đ - trở lên
							  </label>
							</div>
						</div>
					</div>
					<div class="wrapper-author">
						<div class="header">
							<span>Tác giả</span>
						</div>
						<div class="option">
						<c:forEach var="author" items="${authors}">
							<div class="form-check">
							  <input class="author form-check-input" 
								  type="checkbox" 
								  name="author" 
								  id="author_${author.id}"
								  data-id="${author.id}">
							  <label class="form-check-label" for="author_${author.id}">
							    ${author.fullname}
							  </label>
							</div>
						</c:forEach>
							
						</div>
					</div>
				</div>	
			</div>
			<div class="col-md-9 p-3 bg_dark-blue-50">
				<div class="wrapper-filter">
					<ul class="list-filter">
						
						<!-- Fetch data here -->
					</ul>
				</div>
				<div class="wrapper-sorting row mb-3">
					<div class="col-md-5 d-flex align-items-center">
						<div class="me-2">
							<span>Sắp xếp nhanh: </span>
						</div>
						<div class="quick-sort-tool">
							<span class="quick-sort-link" data-sort-by="name" data-sort-order="ASC">Tên A-Z</span>
							|
							<span class="quick-sort-link" data-sort-by="price" data-sort-order="DESC">Giá cao</span>
							|
							<span class="quick-sort-link" data-sort-by="price" data-sort-order="ASC">Giá thấp</span>
						</div>
					</div>	
				</div>
				<div class="wrapper-book-filter">
					<!-- Fetch data here -->
					<jsp:include page="/WEB-INF/views/book/spa-book-filter.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</main>
	<!-- Footer -->
	<%@include file="/components/footer.jsp" %>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/book/book-filter.js"></script>
</body>
</html>