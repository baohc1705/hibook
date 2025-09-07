<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Admin: Book management</title>
	<%@include file="/assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <script src="${pageContext.request.contextPath}/assets/js/admin.js" defer></script>
    <style type="text/css">
    
    	.active-sort {
    		color: #007bff !important;
            font-weight: bold;
    	}
    	.pagination-info {
            color: #6c757d;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
	<!-- Sidebar navagition -->
	<%@include file="/components/sidebar.jsp" %>
	
	<!-- Main body -->
	<main class="px-3">
		<!-- Admin navigation bar-->
		<%@include file="/components/adminNavbar.jsp" %>
		<c:set var="hibook" value="${pageContext.request.contextPath }"></c:set>
		<!-- Data table -->
		<section class="body container mb-2 p-0">
            <div class="wrapper-tools p-3 glass-border glass rounded-3 mb-3">
				<form id="filterForm" action="${hibook }/admin/books/show" method="get">
					<div class="row fs-base">
						<!-- search keyword -->	
						<div class="col-md-4 ">
							<label class="form-label">
								<i class="fas fa-search"></i> Tìm kiếm:
							</label>
							<input type="text" 
								   class="form-control" 
								   name="keyword"
								   value="${criteria.keyword }"
								   placeholder="Nhập tên sách">
		                    
						</div>
						
						<!-- Categories -->
						<div class="col-md-3">
							<label class="form-label">
								<i class="fas fa-tags"></i> Danh mục:
							</label>
							<select name="cateBookId" class="form-select">
								<option value="">--Tất cả danh mục--</option>
								<c:forEach var="category" items="${categories }">
									<option value="${category.id }" 
											${criteria.cateBookId == category.id ? 'selected' : ''} >
										${category.name }
									</option>
								</c:forEach>
							</select>
						</div>
						<!-- Price range -->
						<div class="col-md-5">
							<label class="form-label">
								<i class="fas fa-dollar-sign"></i> Khoảng giá:
							</label>
							<div class="row">
								<div class="col-md-6">
									<input type="number"
										   class="form-control"
										   name="minPrice"
										   value="${criteria.minPrice }"
										   placeholder="Từ (VNĐ)"
										   min="0">
								</div>
								<div class="col-md-6">
									<input type="number"
										   class="form-control"
										   name="maxPrice"
										   value="${criteria.maxPrice }"
										   placeholder="Đến (VNĐ)"
										   min="0">
								</div>
							</div>	
						</div>
					</div>
					
					<div class="row fs-base">
						<div class="col-md-3"> 
							<label class="form-label">
								<i class="fas fa-sort"></i> Sắp xếp theo:
							</label>
							<select name="sortBy" class="form-select">
								<option value="name" ${criteria.sortBy == 'name' ? 'selected' : '' }>Tên sách</option>
								<option value="price" ${criteria.sortBy == 'price' ? 'selected' : '' }>Giá</option>
								<option value="amount" ${criteria.sortBy == 'amount' ? 'selected' : '' }>Số lượng</option>
								<option value="cateBook" ${criteria.sortBy == 'cateBook' ? 'selected' : '' }>Loại sách</option>
								
							</select>
						</div>
						
						<div class="col-md-2">
							<label class="form-label">
								Thứ tự:
							</label>
							<select name="sortOrder" class="form-select" onchange="this.form.submit()">
								<option value="ASC" ${criteria.sortOrder == 'ASC' ? 'selected' : '' }>Tăng dần</option>
								<option value="DESC" ${criteria.sortOrder == 'DESC' ? 'selected' : '' }>Giảm dần</option>
							</select>
						</div>
						
						<div class="col-md-2">
							<label class="form-label">Hiển thị:</label>
							<select name="pageSize" class="form-select" onchange="this.form.submit()">
								<option value="5" ${criteria.pageSize == 5 ? 'selected' : '' }>5 mục</option>
								<option value="10" ${criteria.pageSize == 10 ? 'selected' : '' }>10 mục</option>
								<option value="20" ${criteria.pageSize == 20 ? 'selected' : '' }>20 mục</option>
								<option value="50" ${criteria.pageSize == 50 ? 'selected' : '' }>50 mục</option>
							</select>
						</div>
						
						<div class="col-md-5 d-flex align-items-end">
							<button type="submit" class="btn btn-primary me-2">
								<i class="fas fa-filter"></i> Lọc
							</button>
							<a href="${hibook }/admin/books/show?clearFilter=true" class="btn btn-secondary me-2">
                            	<i class="fas fa-eraser"></i> Xóa bộ lọc
                        	</a>
                        	<button type="button" class="add-btn d-flex align-items-center ms-auto" onclick="window.location.href = '${hibook}/admin/book/add'">
			                    <span class="add-btn_icon material-symbols-rounded">add_circle</span>
			                    <span class="add-btn_label">Thêm sách mới</span>
			                </button>
						</div>
						 <!-- Hidden field để maintain current page khi sort -->
                		<input type="hidden" name="page" value="1">
					</div>
				</form>
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
                    <li class="nav-item ms-auto d-flex"> 
	                    <div class="dropdown">
		                    <button class="btn text_dark-blue-50 filter dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		                        <i class="fa-solid fa-bars" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Chọn ẩn/hiện cột"></i>
		                    </button>
		                    <ul class="dropdown-menu">
		                    	<li><span class="text-center text_dark-blue-50">Cột</span></li>
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
 						<div class="dropdown">
                    		<button class="btn text_dark-blue-50 filter dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        	<i class="fa-solid fa-filter" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Lọc"></i>
	                    	</button>
	                    	<ul class="dropdown-menu">
	                    		<li class="dropdown-item">
	                    			<span>Lọc theo tên</span>
	                    		</li>
	                    	</ul>
                    	</div>
                    </li> 
                </ul>

                <!-- data table -->
                <div id="book-table">
                	<!-- Result info -->
                	<div class="row">
                		<div class="col-12">
                			<div class="d-flex justify-content-between align-items-center mb-3">
                				<div class="pagination-info fs-small text_gray-100">
                					<c:choose>
                						<c:when test="${pagination.totalRecords > 0 }">
                							Hiển thị ${pagination.startRecord} - ${pagination.endRecord}
                							trong tổng số ${pagination.totalRecords } Kết quả (Trang ${pagination.currentPage}/${pagination.totalPages })
                						</c:when>
                						<c:otherwise>
                							Không tìm thấy kết quả nào
                						</c:otherwise>
                					</c:choose>
                				</div>
                				
                				<div class="sort-links fs-base">
                					Sắp xếp nhanh:
                					<a href="${hibook}/admin/books/show?sortBy=name&sortOrder=ASC&"
                					   class="text_dark-blue-50 text-decoration-none ${criteria.sortBy == 'name' && criteria.sortOrder == 'ASC' ? 'active-sort' : ''}">
                						 Tên A-Z
                					</a>|
                					<a href="${hibook}/admin/books/show?sortBy=price&sortOrder=ASC&"
                					   class="text_dark-blue-50 text-decoration-none ${criteria.sortBy == 'price' && criteria.sortOrder == 'ASC' ? 'active-sort' : ''}">
                						 Giá tăng
                					</a>|
                					<a href="${hibook}/admin/books/show?sortBy=price&sortOrder=DESC&"
                					   class="text_dark-blue-50 text-decoration-none ${criteria.sortBy == 'price' && criteria.sortOrder == 'DESC' ? 'active-sort' : ''}">
                						 Giá giảm
                					</a>
                				</div>
                			</div>
                		</div>
                	</div>
                	<!-- Book table -->
	                <div class="table-container mb-3" >
	                	<c:choose>
	                		<c:when test="${not empty books }">
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
			                               			<i class="fa-solid fa-sort " data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Chọn sắp xếp"></i>
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
			                        <tbody id="tb-books">
			                			<c:forEach var="book" items="${books}" varStatus="loop">
										    <tr>
										        <td><input class="form-check-input" type="checkbox"></td>
										        <td>${(loop.index + 1 )+ ((pagination.currentPage-1)*pagination.pageSize)}</td> <!-- số thứ tự -->
										        <td>
										            <img src="${pageContext.request.contextPath}/assets/images/books/${coverPhoto[book]}" 
										                 class="d-block object-fit-contain" width="100" height="100">
										        </td>
										        <td><span class="truncate-mutiline">${book.name}</span></td>
										        <td><span class="text-nowrap fs-small p-2 rounded-pill bg-rimson">${book.cateBook.name}</span></td>
										        <td><a href="" class="nav-link">${book.author.fullname}</a></td>
										        <td class="w-25"><span class="truncate-mutiline fs-small">${book.description}</span></td>
										        <td class="text-end">
										        	<fmt:formatNumber value = "${book.price}" 
         												type = "currency" pattern="#,###"/>
												</td>
										        <td class="text-end">${book.amount}</td>
										        <td class="text-nowrap">
										        	<fmt:formatDate value="${book.createAt}" pattern="dd/MM/yyyy"/>
										        </td>
										        <td>
										            <span class="d-flex justify-content-between align-items-center">
										                <a href="${hibook}/admin/book/edit?bookId=${book.id}" 
										                   class="text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="top" 
										                   data-bs-title="Chỉnh sửa">
										                   <i class="fa-solid fa-pen-to-square text-purple"></i>
										                </a>
										                <a href="javascript:void(0)" data-id="${book.id}" 
										                   class="btn-remove text-decoration-none" data-bs-toggle="tooltip" 
										                   data-bs-placement="top" data-bs-title="Xóa">
										                   <i class="fa-solid fa-trash text-danger"></i>
										                </a>
										            </span>
										        </td>
										    </tr>
										</c:forEach>
		                			</tbody>
	                			</table>
	                		</c:when>
	                		<c:otherwise>
	                			<div class="col-12">
	                				<div class="alert alert-info text-center">
	                					<i class="fas fa-info-circle"></i>
			                            Không tìm thấy sách nào phù hợp với tiêu chí tìm kiếm.
			                            <br>
			                            <a href="${hibook }/admin/books/show?clearFilter=true" class="btn btn-primary mt-2">
			                                Xem tất cả sách
			                            </a>
	                				</div>
	                			</div>
	                		</c:otherwise>
	                	</c:choose>
	                 </div> 
	                 <!-- page navigation --> 
	                 <div id="pagination" class="wrapper_page-navigation mt-3">
		             	<c:if test="${pagination.totalPages > 1}">
		             		<div class="row">
		             			<div class="col-12">
		             				<nav aria-label="Book pagination">
		             					<ul class="pagination justify-content-center">
		             						<!-- First Page -->
		             						<c:if test="${pagination.currentPage > 1 }">
		             							<li class="page-item">
		             								<a class="page-link" href="${hibook }/admin/books/show?page=1&pageSize=${criteria.pageSize}">
		             									<i class="fas fa-angle-double-left"></i>
		             								</a>
		             							</li>
		             						</c:if>
		             						
		             						<!-- Previous page -->
		             						<c:if test="${pagination.hasPrevious}">
		             							<li class="page-item">
		             								 <a class="page-link" href="${hibook }/admin/books/show?page=${pagination.previousPage}&pageSize=${criteria.pageSize}">
				                                        <i class="fas fa-angle-left"></i>
				                                    </a>
		             							</li>
		             						</c:if>
		             						
		             						<!-- Page numbers -->
		             						<c:forEach begin="1" end="${pagination.totalPages }" var="i">
		             							<c:choose>
		             								<c:when test="${i== pagination.currentPage }">
		             									<li class="page-item active">
		             										<span class="page-link">${i}</span>
		             									</li>
		             								</c:when>
		             								<c:when test="${i <= pagination.currentPage + 2 && i >= pagination.currentPage - 2}">
		             									<li class="page-item">
		             										<a class="page-link" href="${hibook }/admin/books/show?page=${i}&pageSize=${criteria.pageSize}">${i}</a>
		             									</li>
		             								</c:when>
		             							</c:choose>
		             						</c:forEach>
		             						
		             						<!-- Next page -->
		             						<c:if test="${pagination.hasNext }">
		             							<li class="page-item">
		             								<a class="page-link" href="${hibook }/admin/books/show?page=${pagination.nextPage}&pageSize=${criteria.pageSize}">
		             									<i class="fas fa-angle-right"></i>
		             								</a>
		             							</li>
		             						</c:if>
		             						
		             						<!-- Last page -->
		             						<c:if test="${pagination.currentPage < pagination.totalPages }">
		             							<li class="page-item">
		             								<a class="page-link" href="${hibook }/admin/books/show?page=${pagination.totalPages}&pageSize=${criteria.pageSize}">
				                                        <i class="fas fa-angle-double-right"></i>
				                                    </a>
		             							</li>
		             						</c:if>
		             					</ul>
		             				</nav>
		             				
		             				<!-- Page jump -->
		             				<div class="text-center mt-3">
		             					<form action="${hibook }/admin/books/show" method="get" class="d-inline-flex align-items-center">
		             						<!-- Preserve filter parameters -->
		             						<input type="hidden" name="keyword" value="${criteria.keyword}">
		             						<input type="hidden" name="category" value="${criteria.cateBookId}">
		             						<input type="hidden" name="minPrice" value="${criteria.minPrice}">
				                            <input type="hidden" name="maxPrice" value="${criteria.maxPrice}">
				                            <input type="hidden" name="sortBy" value="${criteria.sortBy}">
				                            <input type="hidden" name="sortOrder" value="${criteria.sortOrder}">
				                            <input type="hidden" name="pageSize" value="${criteria.pageSize}">
				                            
				                            <span class="me-2 fs-small">Đi đến trang:</span>
				                            <input name="page"
				                            	   type="text"
				                            	   min="1"
				                            	   max="${pagination.totalPages}"
				                            	   value="${pagination.currentPage }"
				                            	   class="form-control form-control-sm me-2"
				                            	   style="width: 80px;">
				                           	<button type="submit" class="btn btn-sm btn-outline-primary">Đi</button>
		             					</form>
		             				</div>
		             			</div>
		             		</div>
		             	</c:if>
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
                        	<c:forEach var="cateBook" items="${sessionScope.categories }" varStatus="loop">
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
			/* TODO: add ajax for pagination */
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
					  confirmButtonText: "Vâng, xóa nó!",
					  cancelButtonText: "Hủy, không xóa"
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