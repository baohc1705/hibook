<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: add book</title>
<%@include file="/assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/component.css">
    <script src="${pageContext.request.contextPath}/assets/js/admin.js" defer></script>
</head>
<body>
	<%@include file="/components/sidebar.jsp" %>
	<main class="px-3">
		<%@include file="/components/adminNavbar.jsp" %>
		<div class="row justify-content-evenly">
			<div class="col-md-5 p-3">
				<form id="form-AddBook" action="${pageContext.request.contextPath }/admin/book/add" method="post">
				<div class="wrapper bg_dark-blue-950-o50 p-3 mb-3 rounded-3">
					<p class="fs-large">Thông tin sách</p>
					
					<div class="mb-3">
						<label class="form-label" for="bookname">Tên sách</label>
						<input type="text" class="input-custom_border" id="bookname" name="bookname" placeholder="Nhập vào tên sách">
					</div>
					
					<div class="mb-3">
						<label class="form-label" for="catebook">Loại sách</label>
						<div class="filter-category ">
							<select class="input-custom_border mx-0 border-0" id="catebook" name="catebook">
								<c:forEach var="cateBook" items="${sessionScope.cateBookList  }">
									<option value="${cateBook.id }">${cateBook.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="mb-3">
						<label class="form-label" for="author">Tác giả</label>
						<div class="filter-category ">
							<select class="input-custom_border mx-0 border-0" id="author" name="author">
								<c:forEach var="author" items="${sessionScope.authorList  }">
									<option value="${author.id }">${author.fullname}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="mb-3">
						<label class="form-label" for="description">Mô tả</label>
						<textarea class="input-custom_border" id="description" name="description" style="height: 100px" placeholder="Nhập vào mô tả"></textarea>
					</div>
				
				</div>	
				<div class="wrapper bg_dark-blue-950-o50 p-3 mb-3 rounded-3">
					<p class="fs-large">Thông tin số lượng</p>
					<div class="mb-3">
						<label class="form-label" for="price">Giá</label>
						<input type="text" class="input-custom_border" id="price" name="price" placeholder="Nhập vào giá">
					</div>
					
					<div class="mb-3">
						<label class="form-label" for="amount">Số lượng</label>
						<input type="number" class="input-custom_border" id="amount" name="amount" placeholder="Nhập vào số lượng">
					</div>
				</div>	

				<div class="mb-3">
					<button type="submit" class="add-btn ">Lưu sách</button>
				</div>
				</form>
			</div>
			
			<div class="col-md-5  p-3">
			<div class="wrapper bg_dark-blue-950-o50 p-3 rounded-3">
				<form id="form-uploadFile" action="${pageContext.request.contextPath }/UploadMutipleFile" method="post" enctype="multipart/form-data">
					<div class="d-flex flex-column mb-3">
						<label class="form-label" for="photo">Ảnh Bìa</label>
						<input type="file" class="form-control d-none" id="coverPhoto" name="coverPhoto">
						<button id="trigger_coverPhotoInput" class="btn btn-success" type="button">Chọn ảnh bìa</button>
						<div class="text-center">
							<img  id="coverPhoto-preview" alt="" src="" width="200" class="rounded-2 object-fit my-3">
						</div>
						
					</div>
					
					<div class="d-flex flex-column mb-3">
						<label class="form-label" for="photo">Ảnh bổ sung</label>	
						<input type="file" class="form-control d-none" id="photo" name="photo" multiple="multiple">
						<button id="trigger_photoInput" class="btn btn-success" type="button">Chọn ảnh bổ sung</button>
						<div id="preview" class="d-flex justify-content-evenly flex-wrap mt-3">
							<img src="" class="rounded-2">
						</div>
					</div>
				</form>
			</div>
				
			</div>
		</div>
		<%@include file="/components/chatbox.jsp" %>
	</main>
	
	<script type="text/javascript">
		$(document).ready(function() {
			console.log("ready jquery");
			
			$("#form-AddBook").on("submit", function(e){
				e.preventDefault(); 
				console.log("form add book active");
				
				let txtBookName = $("#bookname").val();
				let txtCateBook = $("#catebook").val();
				let txtAuthor = $("#author").val();
				let txtPrice = $("#price").val();
				let txtAmount = $("#amount").val();
				let txtDescription = $("#description").val();
				
				//Ajax upload book info
				$.ajax({
					url: "${pageContext.request.contextPath }/admin/book/add",
					method: "POST",
					dataType: "JSON",
					data: {
						bookname: txtBookName,
						catebook: txtCateBook,
						author: txtAuthor,
						price: txtPrice,
						amount: txtAmount,
						description: txtDescription
					},
					success: function(response) {
						if(response.status === "success") {
							console.log("upload book info success. Active upload file");
							let formUpload = $("#form-uploadFile")[0];
							let formData = new FormData(formUpload);
							formData.append("bookId", response.bookId);
							
							// AJAX gọi servlet upload file
							$.ajax({
								url: "${pageContext.request.contextPath }/uploadfile/add-book",
								method: "POST",
								dataType: "json",
								data: formData,
								processData: false,
								contentType: false,
								success: function(resUpload) {
									if (resUpload.status === "success") {
										Swal.fire({
					                        icon: "success",
					                        title: "Thành công!",
					                     	text: resUpload.message,
					                        confirmButtonText: "OK"
				                    	}).then(() => {
				                    		window.location.href="${pageContext.request.contextPath }/admin/book";
				                    	});
									}
									else {
										Swal.fire({
				    	                    icon: "error",
				    	                    title: "Thất bại",
				    	                    text: resUpload.message
				    	                });
									}
								},
								error: function() {
									Swal.fire({
			    	                    icon: "error",
			    	                    title: "Máy chủ bị lỗi",
			    	                    text: "Không thể kết nối đến UploadFile server!"
			    	                });
								}
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
    	                    title: "Máy chủ bị lỗi",
    	                    text: "Không thể kết nối đến server!"
    	                });
					}
					
				});
			});
			
			$("#coverPhoto").on("change", function(e) {
				const file = e.target.files[0];

				const reader = new FileReader();
			    reader.onload = (e) => {
			    	$("#coverPhoto-preview").attr("src", e.target.result);
			    };
			    reader.readAsDataURL(file);
			});
			
			$("#photo").on("change", function(e) {
				let files = e.target.files;
				let previewDiv = $("#preview");
				previewDiv.empty();
				
				for (let i = 0; i < files.length; i++) {
					let file = files[i];
					let reader = new FileReader();
					reader.onload = function(event) {
						let img = $("<img>").attr("src", event.target.result).attr("width", "100");
						previewDiv.append(img);
					};
					reader.readAsDataURL(file);
				}
			});
	
			$("#trigger_coverPhotoInput").on("click", function(e) {
				$("#coverPhoto").click();
			});
			
			$("#trigger_photoInput").on("click", function(e) {
				$("#photo").click();
			});
		});
	</script>
	
</body>
</html>