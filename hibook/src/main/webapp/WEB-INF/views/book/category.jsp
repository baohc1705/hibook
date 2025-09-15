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
			box-shadow: 0 0 15px 5px rgba(0,0,0,.05);
			cursor: pointer;
		}
		
		.list-filter {
			display: flex;
			align-items: center;
			text-decoration: none;
			margin: 1rem 0;
			padding: 0;
		}
		
		.list-filter li {
			padding: .5rem;
			border: 1px var(--dark-blue-600) solid;
			border-radius: 1rem;
			list-style-type: none;
			margin: 0 .2rem;
		}
		
		.list-filter li.clear-filter {
			border: 1px red solid !important;
		}
		
	</style>
</head>
<body>
	<!-- Navigation bar -->
	<%@include file="/components/navbar.jsp" %>
	<main class="container">
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
		    <li class="breadcrumb-item active" aria-current="page">Tất cả danh mục</li>
		  </ol>
		</nav>
		<div class="row">
			<div class="col-md-3 p-3 border">
				<div class="wrapper-categories">
					<div class="header">
						<span>Tất cả danh mục sản phẩm</span>
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
				<div class="wrapper-filter">
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
			<div class="col-md-9 p-3 border">
				<div class="wrapper-filter">
					<ul class="list-filter d-none">
						
					</ul>
				</div>
				<div class="wrapper-book-filter">
					<jsp:include page="/WEB-INF/views/book/spa-book-filter.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/book/book-filter.js"></script>
</body>
</html>