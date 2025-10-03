<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home Admin</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	
	<link href="https://fonts.googleapis.com/css2?family=Chango&family=Paytone+One&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
	<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
	<script src="https://cdn.jsdelivr.net/npm/@tailwindplus/elements@1" type="module"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/dist/boxicons.js"></script>
	<!-- fontawesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css" />
	
	<style type="text/tailwindcss">
     	@custom-variant dark (&:where(.dark, .dark *));
		.font-header{
	 		font-family: 'Paytone One', sans-serif;
		}
    </style>
</head>
<body>
<%

%>
	<div class="min-h-screen bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 dark:from-slate-900 dark:via-slate-800 dark:to-slate-800 trasition-all duration-300">
		<div class="flex h-screen overflow-hidden">
			<jsp:include page="/WEB-INF/views/admin/components/Layout/Sidebar.jsp"></jsp:include>
			
			<div class="flex flex-1 flex-col overslow-hidden">
				<jsp:include page="/WEB-INF/views/admin/components/Layout/Header.jsp"></jsp:include>
				
				<main class="flex-1 overflow-y-auto bg-transparent p-4 space-y-4 ">
					<!-- header -->
					<div class="grid grid-cols-1 p-4 bg-white/80 dark:bg-slate-900/80 rounded-xl">
						<div class="flex items-center justify-between">
							<!-- Left -->
							<div class="flex items-center space-x-3">
								<button
										type="button"
										class="px-2 py-1 border border-slate-500 dark:border-slate-400 flex items-center justify-center rounded-lg cursor-pointer" 
										onclick="window.location.href='${pageContext.request.contextPath}/admin?page=book'"
								>
									<span class="material-symbols-rounded text-slate-600 dark:text-slate-400">
									arrow_back
									</span>
								</button>
								
								<div>
									<h3 class="text-xl font-bold text-slate-800 dark:text-white capitalize mb-1.5">Thêm sách mới</h3>
									<p class="text-sm text-slate-500 dark:text-slate-400">Cập nhật lần cuối: 19:07 01-10-2025</p>
								</div>
							</div>
							
							<!-- right -->
							<div class="flex items-center space-x-3">
								<button
										type="button"
										class="border border-red-700/50 rounded-lg px-2 py-1.5 flex items-center justify-center"
								>
									<span class="material-symbols-rounded text-red-500">
									delete
									</span>
								</button>
								<button
										type="button"
										class="px-2 py-1.5 bg-gradient-to-r from-violet-600 via-pink-500 to-orange-500 flex items-center justify-center space-x-2
												rounded-lg cursor-pointer hover:outline-2 hover:outline-violet-500 hover:outline-offset-2"
										id="btn-submit-book"
								>	
									<span class="material-symbols-rounded text-white">
										save
									</span>
									<span class="text-sm font-semibold text-white">Lưu sách</span>
								</button>
							</div>
						</div>
					</div>
					
					<!-- body -->
					<div class="grid grid-cols-1 lg:grid-cols-2 lg:grid-rows-2 gap-4 ">
						<!-- Left col -->
						<div class="order-2 lg:order-1 lg:h-80 grid grid-cols-1 lg:grid-cols-2 grid-rows-2 lg:grid-rows-1 p-4 bg-white/80 dark:bg-slate-900/80 rounded-xl">
							
							
							
							
							<!-- Cover photo -->
							<div class="col-span-2 lg:col-span-1 h-full rounded-xl border border-slate-200/50 dark:border-slate-700 
										flex items-center justify-center p-2 relative ">
								<img 
									alt="cover-photo" 
									src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png"
									class="hidden h-48 lg:h-full object-contain"
									id="coverPhoto-preview"
								>
								<div id="label-cover-photo"
									class="label-cover-photo hidden absolute left-2 bottom-2 px-2 py-1.5 rounded-full bg-slate-200 dark:bg-slate-700 text-slate-500 dark:text-slate-400 text-xs">
									Ảnh bìa
								</div>
								<div id="delete-cover-photo"
									class="label-cover-photo hidden flex absolute right-2 top-2 p-2 bg-red-50 dark:bg-red-900/20 items-center justify-center rounded-md cursor-pointer">
									<span class="material-symbols-rounded text-red-500">
									delete
									</span>
								</div>
								<button 
									type="button"
									class="rounded-xl border-2 border-dashed border-violet-500 dark:border-violet-400 flex items-center justify-center w-full h-full
										bg-violet-50 dark:bg-violet-900/20 text-violet-400"
									id="btn-add-cover"
								>
									<span class="material-symbols-rounded text-violet-400">
										add
									</span>
									Thêm ảnh bìa
								</button>
								
							</div>
							
							<div class="flex space-x-2 space-y-3 flex-wrap overflow-y-auto" id="photo-preview">
								<!-- Render Image by JS -->
								<button 
										type="button"
										class="rounded-xl border-2 border-dashed border-violet-500 dark:border-violet-400 flex items-center justify-center p-2
											bg-violet-50 dark:bg-violet-900/20"
										id="btn-add-photo"
								>
									<span class="material-symbols-rounded text-violet-400">
									add
									</span>
								</button>
								
							</div>
							<form action="${pageContext.request.contextPath}/admin/upload/add-book" method="post" enctype="multipart/form-data" id="formUpload">
								<input id="uploadFile" type="file" name="coverPhoto" class="hidden">
								<input id="upload-multifile" type="file" name="photo" class="hidden" multiple="multiple"> 	
							</form>
						</div>
						
						<!-- right -->
						<div class="order-1 lg:order-2 row-span-2  gap-4">
							<div class="flex items-start justify-between bg-white/80 dark:bg-slate-900/80 border-b border-dotted border-slate-200/50 drak:border-slate-700/50 rounded-b-md p-4">
								<div>
									<h3 class="text-xl font-bold text-slate-800 dark:text-white capitalize">Thông tin sách</h3>
									<p class="text-sm text-slate-500 dark:text-slate-400">Mô tả thông tin chi tiết sách của bạn</p>
								</div>
								<span class="px-2 py-1.5 rounded-full border border-slate-200/50 dark:border-slate-700/50 text-sm text-slate-600 dark:text-slate-400">
									Bản nháp
								</span>
							</div>
							
							
							<form action="${pageContext.request.contextPath}/admin/book?action=add" method="post">
								<!-- Thông tin sách -->
								<div class="p-4 bg-white/80 dark:bg-slate-900/80 rounded-md border-b border-dotted border-slate-200/50 drak:border-slate-700/50">
									<div class="mb-3">
										<label
											for="name"
											class="text-sm font-semibold text-slate-600 dark:text-slate-400"
										>
											Tên sách
											<span class="text-red-500">*</span>
										</label>
										<input
											type="text"
											id="name"
											name="name"
											class="w-full p-2 rounded-xl border border-slate-500 dark:border-slate-400 placeholder:text-sm placeholder:text-slate-600 
												   dark:placeholder:text-slate-400 text-slate-800 dark:text-white mt-2"
											placeholder="vd: Conan, Dragon ball"
										>
									</div>
									
									<div class="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-3">
										<div class="">
											<label class="text-sm font-semibold text-slate-600 dark:text-slate-400">Thể loại <span class="text-red-500">*</span> </label>
											<select
												  class="w-full p-2 border border-slate-500 dark:border-slate-400 
												         text-slate-800 dark:text-white 
												         bg-white dark:bg-slate-800 
												         rounded-xl mt-2"
												   name="category"
											>
												<option selected disabled class="text-sm text-slate-600 dark:text-slate-400">--Chọn thể loại--</option>
												<c:forEach var="category" items="${categories}">
													<option value="${category.id}">${category.name}</option>
												</c:forEach>
											</select>
										</div>
										
										<div class="">
											<label class="text-sm font-semibold text-slate-600 dark:text-slate-400">Tác giả <span class="text-red-500">*</span> </label>
											<select
												  class="w-full p-2 border border-slate-500 dark:border-slate-400 
												         text-slate-800 dark:text-white 
												         bg-white dark:bg-slate-800 
												         rounded-xl mt-2"
												   name="author"
											>
												<option selected disabled class="text-sm text-slate-600 dark:text-slate-400">--Chọn tác giả--</option>
												<c:forEach var="author" items="${authors}">
													<option value="${author.id}">${author.fullname}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="">
										<label class="text-sm font-semibold text-slate-600 dark:text-slate-400">Mô tả</label>
										<textarea class="w-full rounded-xl mt-2 p-2 border border-slate-500 dark:border-slate-400 
												         text-slate-800 dark:text-white overflow-auto h-24 placeholder:text-sm placeholder:italic"
												  placeholder="Mô tả sách để thêm thông tin chi tiết cho khách hàng"
												  name="description">
										</textarea>
									</div>
								</div>
								
								<div class="p-4 bg-white/80 dark:bg-slate-900/80 rounded-md border-b border-dotted border-slate-200/50 drak:border-slate-700/50">
									<div class="grid grid-cols-1 lg:grid-cols-2 gap-4">
										<div class="">
											<label class="text-sm font-semibold text-slate-600 dark:text-slate-400">Giá bán <span class="text-red-500">*</span> </label>
											<input
												type="text"
												id="price"
												name="price"
												class="w-full p-2 rounded-xl border border-slate-500 dark:border-slate-400 placeholder:text-sm placeholder:text-slate-600 
													   dark:placeholder:text-slate-400 text-slate-800 dark:text-white mt-2"
												placeholder="vd: 40.000 đ"
											>
										</div>
										
										<div class="">
											<label class="text-sm font-semibold text-slate-600 dark:text-slate-400">Số lượng <span class="text-red-500">*</span> </label>
											<input
												type="text"
												id="inventory"
												name="inventory"
												class="w-full p-2 rounded-xl border border-slate-500 dark:border-slate-400 placeholder:text-sm placeholder:text-slate-600 
													   dark:placeholder:text-slate-400 text-slate-800 dark:text-white mt-2"
												placeholder="vd: 15"
											>
										</div>
										<div class="">
											<label class="text-sm font-semibold text-slate-600 dark:text-slate-400">Giảm giá <span class="text-red-500">*</span> </label>
											<select
												  class="w-full p-2 border border-slate-500 dark:border-slate-400 
												         text-slate-800 dark:text-white 
												         bg-white dark:bg-slate-800 
												         rounded-xl mt-2"
												  name="promotion"
											>
												<option selected disabled class="text-sm text-slate-600 dark:text-slate-400">--Chọn giảm giá--</option>
												<c:forEach var="promotion" items="${promotions}">
													<option value="${promotion.id}">${promotion.name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="">
											<label class="text-sm font-semibold text-slate-600 dark:text-slate-400">Phần trăm giảm giá <span class="text-red-500">*</span> </label>
											<input
												type="text"
												id="name"
												name="name"
												value=""
												class="w-full p-2 rounded-xl border border-slate-500 dark:border-slate-400 placeholder:text-sm placeholder:text-slate-600 
													   dark:placeholder:text-slate-400 text-slate-800 dark:text-white mt-2"
												placeholder="vd: 15"
											>
										</div>
									</div>
								</div>
							</form>
							
						</div>
						
						<div class="order-3 h-80 grid grid-cols-1 md:grid-cols-2 md:grid-rows-2 rounded-xl gap-4">
							<div class="bg-white/80 dark:bg-slate-900/80 rounded-xl flex flex-col justify-between p-4">
								<div>
									<h3 class="text-xl font-bold text-slate-800 dark:text-white capitalize">Hiển thị sách</h3>
									<p class="text-sm text-slate-500 dark:text-slate-400">
										Bạn có thể thay đổi hiển thị sách cho khách hàng
									</p>
								</div>
								<div>
									<label class="inline-flex items-center cursor-pointer">
									  <input type="checkbox" value="" class="sr-only peer">
									  <div class="relative w-11 h-6 bg-gray-200 peer-focus:outline-none 
									              peer-focus:ring-2 peer-focus:ring-violet-500 
									              rounded-full peer dark:bg-gray-700 
									              peer-checked:bg-violet-600">
									    <span class="absolute top-[2px] left-[2px] bg-white w-5 h-5 rounded-full transition-transform 
									                 peer-checked:translate-x-5"></span>
									  </div>
									  <span class="ml-3 text-sm font-medium text-gray-900 dark:text-gray-300">Hiện</span>
									</label>
								</div>
							</div>
							<div class="row-span-2 h-80 bg-white/80 dark:bg-slate-900/80 rounded-xl p-4 overflow-hidden">
								<div class="flex items-start justify-between">
									<div>
										<h3 class="text-xl font-bold text-slate-800 dark:text-white capitalize">Sách tương tự</h3>
										<p class="text-sm text-slate-500 dark:text-slate-400">
											Thêm sách tương tự như sách này
										</p>
									</div>
									<button class="p-1.5 rounded-md flex items-center justify-center border border-slate-500 dark:border-slate-400 text-slate-500 dark:text-slate-400">
										<span class="material-symbols-rounded">
										add
										</span>
									</button>
								</div>
								<div class="overflow-y-auto max-h-48">
									<div class=" p-4 flex flex-col space-y-3">
										<div class="flex items-start justify-between">
											<div class="flex items-start space-x-2">
												<img 
													alt="" 
													src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png"
													class="w-10 object-contain"
												>
												<p class="max-w-24 truncate text-xs text-slate-500 dark:text-slate-300">Hoàng hôn màu đỏ Hoàng hôn màu đỏ Hoàng hôn màu đỏ</p>
											</div>
											
											<button
												type="button"
												class="border border-red-700/50 rounded-md p-1 flex items-center justify-center"
											>
												<span class="material-symbols-rounded text-red-500 text-xs!">
												delete
												</span>
											</button>
										</div>
										<div class="flex items-start justify-between">
											<div class="flex items-start space-x-2">
												<img 
													alt="" 
													src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png"
													class="w-10 object-contain"
												>
												<p class="max-w-24 truncate text-xs text-slate-500 dark:text-slate-300">Hoàng hôn màu đỏ Hoàng hôn màu đỏ Hoàng hôn màu đỏ</p>
											</div>
											
											<button
												type="button"
												class="border border-red-700/50 rounded-md p-1 flex items-center justify-center"
											>
												<span class="material-symbols-rounded text-red-500 text-xs!">
												delete
												</span>
											</button>
										</div>
										<div class="flex items-start justify-between">
											<div class="flex items-start space-x-2">
												<img 
													alt="" 
													src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png"
													class="w-10 object-contain"
												>
												<p class="max-w-24 truncate text-xs text-slate-500 dark:text-slate-300">Hoàng hôn màu đỏ Hoàng hôn màu đỏ Hoàng hôn màu đỏ</p>
											</div>
											
											<button
												type="button"
												class="border border-red-700/50 rounded-md p-1 flex items-center justify-center"
											>
												<span class="material-symbols-rounded text-red-500 text-xs!">
												delete
												</span>
											</button>
										</div>
										<div class="flex items-start justify-between">
											<div class="flex items-start space-x-2">
												<img 
													alt="" 
													src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png"
													class="w-10 object-contain"
												>
												<p class="max-w-24 truncate text-xs text-slate-500 dark:text-slate-300">Hoàng hôn màu đỏ Hoàng hôn màu đỏ Hoàng hôn màu đỏ</p>
											</div>
											
											<button
												type="button"
												class="border border-red-700/50 rounded-md p-1 flex items-center justify-center"
											>
												<span class="material-symbols-rounded text-red-500 text-xs!">
												delete
												</span>
											</button>
										</div>
										<div class="flex items-start justify-between">
											<div class="flex items-start space-x-2">
												<img 
													alt="" 
													src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png"
													class="w-10 object-contain"
												>
												<p class="max-w-24 truncate text-xs text-slate-500 dark:text-slate-300">Hoàng hôn màu đỏ Hoàng hôn màu đỏ Hoàng hôn màu đỏ</p>
											</div>
											
											<button
												type="button"
												class="border border-red-700/50 rounded-md p-1 flex items-center justify-center"
											>
												<span class="material-symbols-rounded text-red-500 text-xs!">
												delete
												</span>
											</button>
										</div>
									</div>
								</div>
								
							</div>
							<div class="bg-white/80 dark:bg-slate-900/80 rounded-xl p-4 flex flex-col justify-between">
								<div>
									<h3 class="text-xl font-bold text-slate-800 dark:text-white capitalize">Xem trước</h3>
									<p class="text-sm text-slate-500 dark:text-slate-400">
										Muốn xem cách sách hiển thị cho khách hàng?
									</p>
								</div>
								
								<button class="w-full px-2 py-1.5 bg-violet-500 text-white rounded-md">Hiển thị</button>
								
							</div>
						</div>
					</div>
					
					
				</main>
				<div class="md:hidden">
					<jsp:include page="/WEB-INF/views/admin/components/Layout/Footer.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<!-- sweetalert2 -->
 	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer="defer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/main.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/Book.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/AjaxBook.js"></script>
</body>
</html>