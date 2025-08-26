
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Admin: Book management</title>
	<%@include file="/assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <script src="${pageContext.request.contextPath}/assets/js/admin.js" defer></script>
</head>
<body>
	<!-- Sidebar navagition -->
	<%@include file="/components/sidebar.jsp" %>
	
	<!-- Main body -->
	<main class="px-3">
		<!-- Admin navigation bar-->
		<%@include file="/components/adminNavbar.jsp" %>
		
		<!-- Data table -->
		<section class="body container mb-2 p-0">
            <div class="wrapper-tools p-3 glass-border glass glass d-flex align-items-center rounded-3 mb-3">

                <!-- sort tool-->
                <div class="dropdown">
                    <button class="btn text_dark-blue-50 filter dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-sort"></i>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item text_dark-blue-50" href="#">Số lượng tăng dần</a></li>
                        <li><a class="dropdown-item text_dark-blue-50" href="#">Số lượng giảm dần</a></li>
                        <li><a class="dropdown-item text_dark-blue-50" href="#">Sách mới nhất</a></li>
                    </ul>
                </div>

                <div class="filter-category">
                    <select name="" id="" class="">
                        <option value="" selected>Lọc theo thể loại sách</option>
                        <option value="">Tiểu thuyết</option>
                        <option value="">Truyện ngắn</option>
                    </select>
                </div>
                
                <ul class="list_filter small">
                    <li class="d-flex align-items-center">
                        <span class="me-2">Tiểu thuyết</span>
                        <span class="material-symbols-rounded text-danger">cancel</span>
                    </li>
                    <li><span class="">Reset</span></li>
                </ul>
                
                <form action="" class="ms-auto d-flex me-3">
                    <input type="text" class="nav-search" placeholder="Tìm kiếm 1.750 sách">
                    <a href="#" class="nav-search-icon d-flex justify-content-center align-items-center">
                        <span class="nav-icon material-symbols-rounded">search</span>
                    </a>
                </form>
                <c:set var="hibook" value="${pageContext.request.contextPath }"></c:set>
                <button class="add-btn d-flex align-items-center" onclick="window.location.href = '${hibook}/admin/book/add'">
                    <span class="add-btn_icon material-symbols-rounded">add_circle</span>
                    <span class="add-btn_label">Thêm sách mới</span>
                </button>
            </div>

            <div class="wrapper-table">
                <!-- nav & tabs -->
                <ul class="nav-tab mb-3">
                    <li class="nav-item">
                        <a id="btn_book-table" class="nav-link active">Thông tin sách</a>
                    </li>
                    <li class="nav-item">
                        <a id="btn_cateBook-table" class="nav-link">Loại sách</a>
                    </li>
                    <li class="nav-item">
                        <a id="btn_author-table" class="nav-link">Tác giả</a>
                    </li>
                </ul>

                <!-- data table -->
                <div id="book-table" class="table-container mb-3" >
                    <table class="fs-base">
                        <thead>
                            <tr>
                                <th>
                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
                                </th>
                                <th>#</th>
                                <th>Ảnh bìa</th>
                                <th>Tên sách</th>
                                <th>Loại sách</th>
                                <th>Tác giả</th>
                                <th>Mô tả</th>
                                <th>Giá</th> 
                                <th>Số lượng</th> 
                                <th>Ngày thêm</th> 
                                <th>Hành động</th>
                            </tr> 
                        </thead>

                        <tbody>
                        	<c:forEach var="book" items="${sessionScope.bookList }" varStatus="loop">
                        		<c:set var="row_num" value="${0}"></c:set>
                    
	                            <tr>
	                                <td>
	                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
	                                </td>
	                                <td>${loop.index + 1 }</td>
	                                <td>
	                                    <img src="${pageContext.request.contextPath}/assets/images/books/${sessionScope.coverPhotoList[book]}" alt="" class="d-block object-fit-contain" width="100" height="100">
	                                </td>
	                                <td ><span class="truncate-mutiline">${book.name }</span></td>
	                                 <td>
	                                    <span class="">${book.cateBook.name }</span>
	                                </td>
	                                <td>
	                                    <a href="" class="nav-link">${book.author.fullname }</a>
	                                </td>
	                                <td ><span class="truncate-mutiline fs-small">${book.description }</span></td>
	                                <td>${book.price }</td>
	                                <td>${book.amount }</td>
	                                <td>${book.createAt }</td> 
	                                <td>
	                                    <span class="d-flex justify-content-between align-items-center">
	                                        <a  href="${pageContext.request.contextPath }/admin/book/edit?bookId=${book.id}"><i class="fa-solid fa-eye text_dark-blue-200"></i></a>
	                                        <a  href=""><i class="fa-solid fa-pen-to-square text-purple"></i></a>
	                                        <a  href="javascript:void(0)" data-id="${book.id }" class="btn-remove"><i class="fa-solid fa-trash text-danger"></i></a>
	                                    </span>
	                                </td>
	                            </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                 </div>
				<div id="catebook-table" class="table-container mb-3" >
                    <table class="fs-base">
                        <thead>
                            <tr>
                                <th>
                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
                                </th>
                                <th>#</th>
                                <th>Mã sách</th>
                                <th>Tên loại sách</th>                        
                                <th>Hành động</th>
                            </tr> 
                        </thead>

                        <tbody>
                        	<c:forEach var="cateBook" items="${sessionScope.cateBookList }" varStatus="loop">
                        		<c:set var="row_num" value="${0}"></c:set>
	                            <tr>
	                                <td>
	                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
	                                </td>
	                                <td>${loop.index + 1 }</td>
	                                <td>${cateBook.id }</td>
	                                <td ><span class="truncate-mutiline">${cateBook.name }</span></td>
	                                <td>
	                                    <span class="d-flex justify-content-between align-items-center">
	                                        <a href=""><i class="fa-solid fa-eye text_dark-blue-200"></i></a>
	                                        <a href=""><i class="fa-solid fa-pen-to-square text-purple"></i></a>
	                                        <a href=""><i class="fa-solid fa-trash text-danger"></i></a>
	                                    </span>
	                                </td>
	                            </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                 </div> 
                <div id="author-table" class="table-container mb-3" >
                    <table class="fs-base">
                        <thead>
                            <tr>
                                <th>
                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
                                </th>
                                <th>#</th>
                                <th>Tên tác giả</th>                        
                                <th>Email</th>
                                <th>Ngày sinh</th>
                                <th>Tiểu sử</th>
                                <th>Hành động</th>
                            </tr> 
                        </thead>

                        <tbody>
                        	<c:forEach var="author" items="${sessionScope.authorList }" varStatus="loop">
                        		<c:set var="row_num" value="${0}"></c:set>
	                            <tr>
	                                <td>
	                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
	                                </td>
	                                <td>${loop.index + 1 }</td>
	                                <td>${author.fullname }</td>
	                                <td>${author.email }</td>
	                                <td>${author.dob }</td>
	                                <td ><span class="truncate-mutiline">${author.biography }</span></td>
	                                <td>
	                                    <span class="d-flex justify-content-between align-items-center">
	                                        <a href=""><i class="fa-solid fa-eye text_dark-blue-200"></i></a>
	                                        <a href=""><i class="fa-solid fa-pen-to-square text-purple"></i></a>
	                                        <a href=""><i class="fa-solid fa-trash text-danger"></i></a>
	                                    </span>
	                                </td>
	                            </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                 </div> 
                <!-- page navigation -->
                <div class="wrapper_page-navigation">
                    <nav class="nav-page">
                        <ul class="nav-list m-0 p-0">
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-icon p-2 rounded-circle"><i class=" fa-solid fa-arrow-left"></i></span></a></li>
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-label px-3 py-2 rounded-3 active">1</span></a></li>
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-label px-3 py-2 rounded-3">2</span></a></li>
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-label px-3 py-2 rounded-3">3</span></a></li>
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-icon  p-2 rounded-circle"><i class=" fa-solid fa-arrow-right"></i></span></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
         </section>   
         <!-- Chat box -->
		<%@include file="/components/chatbox.jsp" %>
	</main>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#book-table").show();
		    $("#catebook-table").hide();
		    $("#author-table").hide();
		    
			$("#btn_book-table").on("click", function(e) {
				 e.preventDefault();
				$("#book-table").show();
				$("#catebook-table").hide();
				$("#author-table").hide();
			});
			
			$("#btn_cateBook-table").on("click", function(e){
				 e.preventDefault();
				$("#book-table").hide();
				$("#catebook-table").show();
				$("#author-table").hide();
			});
			
			$("#btn_author-table").on("click", function(e){
				 e.preventDefault();
				$("#book-table").hide();
				$("#catebook-table").hide();
				$("#author-table").show();
			});
			
			 $(document).on("click",".btn-remove" ,function(e) {
				e.preventDefault();
				let txtbookId = $(this).data("id");
				Swal.fire({
					  title: "Bạn có chắc muốn xóa?",
					  text: "Bạn sẽ không khôi phục lại được!",
					  icon: "warning",
					  showCancelButton: true,
					  confirmButtonColor: "#3085d6",
					  cancelButtonColor: "#d33",
					  confirmButtonText: "Yes, delete it!"
					}).then((result) => {
					  if (result.isConfirmed) {
						$.ajax({
							url: "${pageContext.request.contextPath}/admin/book/remove",
							method: "POST",
							data: {bookId : txtbookId},
							success: function(response) {
								if(response.status === "success") {
									Swal.fire({
				                        icon: "success",
				                        title: "Thành công!",
				                     	text: response.message,
				                        confirmButtonText: "OK"
			                    	}).then(() => {
			                    		window.location.reload();
			                    	});
								}
								else {
									Swal.fire({
			    	                    icon: "error",
			    	                    title: "Thất bại",
			    	                    text: response.message
			    	                });
								}
							},
							error: function() {
								Swal.fire({
		    	                    icon: "error",
		    	                    title: "Thất bại",
		    	                    text: "Không thể kết nối đến server"
		    	                });
							}
						});
					  }
				});
			});
		});
	</script>
</body>
</html>