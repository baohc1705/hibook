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
                        <li>
                		</li>
                        <li><a class="dropdown-item text_dark-blue-50" href="#">Số lượng giảm dần</a></li>
                        <li><a class="dropdown-item text_dark-blue-50" href="#">Sách mới nhất</a></li>
                    </ul>
                </div>
                
                <div class="fs-small filter-category">
                	<select id="page-size">
                		<option value="3" selected="selected">3</option>
                		<option value="5">5</option>
                		<option value="10">10</option>
                		<option value="all">Tất cả</option>
                	</select>
	                <label for="page-size fs-small" >Dòng</label>
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
                    <li class="nav-item ms-auto"> 
                     <div class="dropdown">
	                    <button class="btn text_dark-blue-50 filter dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        <i class="fa-solid fa-bars" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Chọn ẩn/hiện cột"></i>
	                    </button>
	                    <ul class="dropdown-menu">
	                    	
	                    	<span class="p-2 text-center">CỘT</span>
	                    	
	                        <li class="dropdown-item text_dark-blue-50">
                    			<input class="check-show" type="checkbox" value="3"> 
                    			<span class="px-2 " style="pointer-events: cursor;">Ảnh bìa</span>
                    		</li>
                    		<li class="dropdown-item text_dark-blue-50">
                    			<input class="check-show" type="checkbox" value="4"> 
                    			<span class="px-2 ">Tên sách</span>
       
                    		</li>
                    		<li class="dropdown-item text_dark-blue-50">
                    			<input class="check-show" type="checkbox" value="5"> 
								<span class="px-2 ">Loại sách</span>
                    		</li>
                    		<li class="dropdown-item text_dark-blue-50">
                    			<input class="check-show" type="checkbox" value="6">
                    			<span class="px-2 ">Tác giả</span>
                    		</li>
                    		<li class="dropdown-item text_dark-blue-50">
                    			<input class="check-show" type="checkbox" value="7">
                    			<span class="px-2 ">Mô tả</span>
                    		</li>
                    		<li class="dropdown-item text_dark-blue-50">
                    			<input class="check-show" type="checkbox" value="8">
                    			<span class="px-2 ">Giá gốc</span>
                    		</li>
                    		<li class="dropdown-item text_dark-blue-50">
                    			<input class="check-show" type="checkbox" value="9">
                    			<span class="px-2 ">Số lượng</span>
                    		</li>
                    		<li class="dropdown-item text_dark-blue-50">
                    			<input class="check-show" type="checkbox" value="9">
                    			<span class="px-2 ">Ngày thêm</span>
                    		</li>
	                    </ul>
	                </div>
                    	<ul class="showCol">
                    		
                    	</ul>
                    </li>
                </ul>

                <!-- data table -->
                <div id="book-table">
	                <div class="table-container mb-3" >
	                    <table class="fs-base">
	                        <thead>
	                            <tr>
	                                <th>
	                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
	                                </th>
	                                <th>STT</th>
	                                <th class="text-center">Ảnh bìa</th>
	                                <th class="text-nowrap">
	                                	<a href="javascript:void(0)" class="sort-trigger text_dark-blue-50 text-decoration-none" data-field="name" data-sort="none">
	                                		<i class="fa-solid fa-sort"  data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Chọn sắp xếp"></i>
	                                	</a>
										 <span>Tên sách</span> 
	                                </th>
	                                <th class="text-nowrap">Loại sách</th>
	                                <th class="text-nowrap">Tác giả</th>
	                                <th class="text-nowrap">Mô tả</th>
	                                <th class="text-nowrap text-end">
	                               		<a href="javascript:void(0)" class="sort-trigger text_dark-blue-50 text-decoration-none" data-field="price" data-sort="none">
	                               			<i class="fa-solid fa-sort " data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Chọn sắp xếp""></i>
	                               		</a>
										 <span>Giá gốc</span> 
	                                </th> 
	                                <th class="text-nowrap text-end">
	                                	 <a href="javascript:void(0)" class="sort-trigger text_dark-blue-50 text-decoration-none" data-field="amount" data-sort="none" >
	                                	 	<i class="fa-solid fa-sort" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Chọn sắp xếp"></i>
	                                	 </a>
										 <span>Số lượng</span> 
	                                </th> 
	                                <th class="text-nowrap">Ngày thêm</th> 
	                                <th class="text-nowrap">Hành động</th>
	                            </tr> 
	                        </thead>
	                        <tbody id="tb-books"></tbody>
	                    </table>        
	                 </div> 
	                 <!-- page navigation --> 
	                 <div id="pagination" class="wrapper_page-navigation mt-3">
		                    <nav class="nav-page">
		                        <ul class="nav-list m-0 p-0">
		                        </ul>
		                    </nav>
		             </div>
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
                                <th class="text-nowrap">#</th>
                                <th class="text-nowrap">Tên tác giả</th>                        
                                <th class="text-nowrap">Email</th>
                                <th class="text-nowrap">Ngày sinh</th>
                                <th class="text-nowrap">Tiểu sử</th>
                                <th class="text-nowrap">Hành động</th>
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
	                                <td class="text-nowrap">${author.fullname }</td>
	                                <td>${author.email }</td>
	                                <td class="text-nowrap">${author.dob }</td>
	                                <td class="w-25"><span class="truncate-mutiline">${author.biography }</span></td>
	                                <td>
	                                    <span class="d-flex justify-content-between align-items-center">
	                                        <a href=""><i class="fa-solid fa-pen-to-square text-purple"></i></a>
	                                        <a href=""><i class="fa-solid fa-trash text-danger"></i></a>
	                                    </span>
	                                </td>
	                            </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                 </div> 
            </div>
         </section>   
         <!-- Chat box -->
		<%@include file="/components/chatbox.jsp" %>
	</main>
	
	<script type="text/javascript">	
	
		$(document).ready(function() {
			
			loadPage(1,$("#page-size").val());

			$("#page-size").on("change", function() {
				loadPage(1,$(this).val());
			});
			
			$(".sort-trigger").on("click", function() {
				let sortField = $(this).data("field");
				let sortOrder = $(this).data("sort");
				let nextOrder = (sortOrder === "sort") ? "desc" : "asc";

				let icon = $(this).find("i");	
				
			    if (sortOrder === "none") {
			        sortOrder = "asc";
			        icon.removeClass("fa-sort").addClass("fa-caret-up");
			    } else if (sortOrder === "asc") {
			        sortOrder = "desc";
			        icon.removeClass("fa-caret-up").addClass("fa-caret-down");
			    } else {
			        sortOrder = "asc";
			        icon.removeClass("fa-caret-down").addClass("fa-caret-up");
			    }

				loadPage(1,$("#page-size").val(),sortField,sortOrder);
				
			    $(this).data("sort", sortOrder);
				
			});
			
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
		
		function loadPage(page, pageSize, sortField, sortOrder) {
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/book/show",
				method: "GET",
				data: {
					page : page,
					pageSize : pageSize,
					sortField : sortField || "",
					sortOrder : sortOrder || ""
				},
				dataType: "JSON",
				success: function(response) {
					
					$(".check-show").prop("checked", true);
					$(".check-show").trigger("change");
					$(".check-show").on("change", function() {
						let colIndex = $(this).val();
						if ($(this).is(":checked")) {
					        $("table td:nth-child(" + colIndex + ")").removeClass("d-none");
					        $("table th:nth-child(" + colIndex + ")").removeClass("d-none");
					    } else {
					        $("table td:nth-child(" + colIndex + ")").addClass("d-none");
					        $("table th:nth-child(" + colIndex + ")").addClass("d-none");
					    } 
					});
					
					$("#tb-books").empty();
					// render data table
					$.each(response.books, function(i, book) {
						
						
						let stt = (response.currentPage != null) ? ((response.currentPage - 1) * pageSize + (i + 1)) : (i + 1);
						$("#tb-books").append(
							"<tr>" + 
								"<td>" + "<input class='form-check-input' type='checkbox'>" + "</td>" +
								"<td>" + stt +"</td>" +
								"<td>" + "<img src='${pageContext.request.contextPath}/assets/images/books/"+book.coverPhoto+"' class='d-block object-fit-contain' width='100' height='100'>" + "</td>" + 
								"<td>" + "<span class='truncate-mutiline'>"+book.name+"</span>"+"</td>"+
								"<td>" + "<span class='text-nowrap fs-small p-2 rounded-pill bg-rimson'>"+book.cateBook_name+"</span>"+"</td>"+
								"<td>" + "<a href='' class='nav-link'>"+book.author+"</a> </td>" +
								"<td class='w-25'>" + "<span class='truncate-mutiline fs-small'>"+book.description+"</span></td>"+
								"<td class='text-end'>"+book.price+"</td>"+
	                            "<td class='text-end'>"+book.amount+"</td>"+
	                            "<td class='text-nowrap'>"+book.createAt+"</td>"+
	                            "<td>"+
                                    "<span class='d-flex justify-content-between align-items-center'>" +
                                        "<a  href='${pageContext.request.contextPath }/admin/book/edit?bookId="+book.id+"' class='text-decoration-none' data-bs-toggle='tooltip' data-bs-placement='top' data-bs-title='Chỉnh sửa'><i class='fa-solid fa-pen-to-square text-purple'></i></a>"+
                                        "<a  href='javascript:void(0)' data-id='"+book.id+"' class='btn-remove text-decoration-none' data-bs-toggle='tooltip' data-bs-placement='top' data-bs-title='Xóa'><i class='fa-solid fa-trash text-danger'></i></a>"+
                                    "</span>"+
	                            "</td>" +
                            "</tr>"
						);
						$('[data-bs-toggle="tooltip"]').tooltip();
					});
					// render book table
					$("#pagination nav ul").empty();
					
					//  render prev button
					if (response.currentPage > 1) {
						$("#pagination nav ul").append(
							"<li class='list-group-item'  ><a class='nav-link' href='javascript:void(0)' onclick='loadPage("+(response.currentPage-1)+","+pageSize+",\""+(sortField||"")+"\",\""+(sortOrder||"")+"\")'><span class='nav-icon p-2 rounded-circle'><i class=' fa-solid fa-arrow-left'></i></span></a></li>"
						);
					}
					else {
						$("#pagination nav ul").append(
							"<li class='list-group-item' style='cursor: not-allowed;' ><span class='nav-icon p-2 rounded-circle'><i class=' fa-solid fa-arrow-left'></i></span></li>"
						);
					}
					// render pagination
					$.each(response.arrPagination, function(i, page){
						if (page === "...") {
							$("#pagination nav ul").append(
								"<li class='list-group-item'><span class='nav-label px-3 py-2 rounded-3'>...</span></li>"
							);
						}
						else {
							if (parseInt(page) === response.currentPage) {
								$("#pagination nav ul").append(
									"<li class='list-group-item'><span class='nav-label px-3 py-2 rounded-3 active'>"+page+"</span></li>"
								);
							}
							else {
								$("#pagination nav ul").append(
									"<li class='list-group-item'><a class='nav-link' href='javascript:void(0)' onclick='loadPage("+page+","+pageSize+",\""+(sortField||"")+"\",\""+(sortOrder||"")+"\")'><span class='nav-label px-3 py-2 rounded-3'>"+page+"</span></a></li>"
								);
							}
						}
					});
					
					//render next button
					if (response.currentPage < response.totalPages) {
						$("#pagination nav ul").append(
							"<li class='list-group-item'><a class='nav-link' href='javascript:void(0)' onclick='loadPage("+(response.currentPage+1)+","+pageSize+",\""+(sortField||"")+"\",\""+(sortOrder||"")+"\")'><span class='nav-icon p-2 rounded-circle'><i class=' fa-solid fa-arrow-right'></i></span></a></li>"	
						);
					}
					else {
						$("#pagination nav ul").append(
							"<li class='list-group-item' style='cursor: not-allowed;'><span class='nav-icon p-2 rounded-circle'><i class=' fa-solid fa-arrow-right'></i></span></li>"	
						);
					}	
				},
				error: function() {
					console.log("Không thể đến server");
				}
			});
		}
	</script>
</body>
</html>