<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	Map<Integer, String> cateColor = new HashMap<>();
	cateColor.put(1, "text-emerald-500 bg-emerald-50 dark:bg-emerald-900/50 text-emerald-500");
	cateColor.put(2, "text-yellow-500 bg-yellow-50 dark:bg-yellow-900/50 text-yellow-500");
	cateColor.put(3, "text-violet-500 bg-violet-50 dark:bg-violet-900/50 text-violet-500");
	cateColor.put(4, "text-blue-500 bg-blue-50 dark:bg-blue-900/50 text-blue-500");
	cateColor.put(5, "text-orange-500 bg-orange-50 dark:bg-orange-900/50 text-orange-500");
	
	request.setAttribute("cateColor", cateColor);
%>
	<div class="min-h-screen bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 dark:from-slate-900 dark:via-slate-800 dark:to-slate-800 trasition-all duration-300">
		<div class="flex h-screen overflow-hidden">
			<jsp:include page="components/Layout/Sidebar.jsp"></jsp:include>
			
			<div class="flex flex-1 flex-col overslow-hidden">
				<jsp:include page="components/Layout/Header.jsp"></jsp:include>
				
				<main class="flex-1 overflow-y-auto bg-transparent p-6 space-y-4 ">
					<div class="grid grid-cols-1 bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl rounded-xl overflow-hidden">
						
						<!-- Header -->
						<div class="p-4 flex items-center justify-between">
							<h3 class="text-xl font-bold text-slate-800 dark:text-white">
								Danh sách sản phẩm
							</h3>
							<div class="flex items-center space-x-3">
								<button type="button"
										class = "px-4 py-2 bg-emerald-50 dark:bg-emerald-900/50 text-emerald-500 text-sm rounded-xl 
												flex items-center justify-center cursor-pointer"
										
								>
									<i class="fa-solid fa-file-export"></i>
									<span class="ml-2">Xuất Excel</span>
								</button>
								<button type="button"
										class="px-4 py-2 bg-gradient-to-r from-violet-600 via-pink-500 to-orange-500 text-sm rounded-xl
										text-white flex items-center justify-center cursor-pointer"
										onclick="window.location.href='${pageContext.request.contextPath}/admin/book?action=add'"
								>
									<i class="fa-solid fa-plus"></i>
									<span class="ml-2">Thêm sách mới</span>
								</button>
							</div>
						</div>
						
						<!-- Filter -->
						<div class="p-4 flex items-center justify-between">
							<div class="flex items-center space-x-3">
								<div class="relative inline-block group">
								  <button
								    class="px-3 py-2 border-2 border-slate-200/80 dark:border-slate-700/50 rounded-sm 
								           text-slate-500 dark:text-slate-300 hover:border-slate-600 text-sm cursor-pointer">
								    <i class="fa-solid fa-filter"></i>
								  </button>
								
								  <div class="w-64 scale-y-0 group-hover:scale-y-100 absolute left-0 top-[50px] origin-top bg-white dark:bg-slate-900 z-50 shadow-md shadow-slate-500/50 dark:shadow-slate-500
								           transition-transform duration-200 rounded-xl">
								    <div class="p-2 flex items-center justify-between text-white border-b border-slate-200/50 dark:border-slate-700/50 space-x-3">
								      <button class="text-sm px-2 py-1 text-slate-600 dark:text-slate-300 border border-slate-200/50 dark:border-slate-700/50
								      			   rounded-md cursor-pointer">
								      			  Xóa
								      </button>
								      <button
								      		class="text-sm flex-1 px-2 py-1 text-white border border-violet-500 bg-violet-500
								      			   rounded-md text-center cursor-pointer hover:shadow-md hover:shadow-violet-500/50"
								      >
								      <span>Thực thi</span>
								      </button>
								    </div>
								    
								    <div class="border-b border-slate-200/50 dark:border-slate-700/50 flex items-start space-x-2 w-full p-2">
										<label class="relative inline-flex cursor-pointer p-1">
											<input type="checkbox"
												   class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
											       		  checked:bg-violet-500 checked:border-violet-500" />
											<span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
												<i class="fa-solid fa-check text-white text-xs"></i>
											</span>
										</label>
										<div class="inline-block w-full ">
											<button class="btnSubmenu flex items-center text-sm w-full text-start text-slate-600 dark:text-slate-300 p-1">
										    	<span class="flex-1">Danh mục</span>
												<span class="arrowToggle material-symbols-rounded text-slate-500 dark:text-slate-300">
													keyboard_arrow_down
												</span>
										    </button>
										    
										    <div class="hidden w-full flex flex-col">
										    	<c:forEach var="category" items="${categories}">
										    	<div class="w-full flex items-center space-x-2 text-slate-500 dark:text-slate-300 cursor-pointer p-1.5 hover:bg-slate-200/50 dark:hover:bg-slate-700/50
										    				rounded-md">
										    		<label class="relative inline-flex cursor-pointer">
														<input type="checkbox"
															   class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
														       		  checked:bg-violet-500 checked:border-violet-500" />
														<span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
															<i class="fa-solid fa-check text-white text-xs"></i>
														</span>
													</label>
													<span class="text-sm" data-id="${category.id}">${category.name}</span>
										    	</div>
										    	</c:forEach>
										    </div>
											
											
										</div>
										
								    </div>
								    
								    <div class="border-b border-slate-200/50 dark:border-slate-700/50 flex items-center space-x-2 w-full p-2">
										<label class="relative inline-flex cursor-pointer p-1">
											<input type="checkbox"
												   class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
											       		  checked:bg-violet-500 checked:border-violet-500" />
											<span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
												<i class="fa-solid fa-check text-white text-xs"></i>
											</span>
										</label>
									    <button class="text-sm text-slate-600 dark:text-slate-300 p-1"
									    >
									    Tác giả
									    </button>
								    </div>
								    <div class="border-b border-slate-200/50 dark:border-slate-700/50 flex items-center space-x-2 w-full p-2">
										<label class="relative inline-flex cursor-pointer p-1">
											<input type="checkbox"
												   class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
											       		  checked:bg-violet-500 checked:border-violet-500" />
											<span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
												<i class="fa-solid fa-check text-white text-xs"></i>
											</span>
										</label>
									    <button class="text-sm text-slate-600 dark:text-slate-300 p-1"
									    >
									    Theo tên
									    </button>
								    </div>
								    
								  </div>
								</div>
								<div class="flex items-center space-x-3">
									<!-- List filter render by js -->
									<div class="px-3 py-2 bg-slate-200/50 dark:bg-slate-700/50 border-2 border-slate-200/50 dark:border-slate-700/50 rounded-full text-slate-500 dark:text-slate-300
												hover:border-slate-500 text-sm flex items-center justify-center cursor-pointer">
										<span class="mr-2">Tieu thuyet</span>
										<i class="fa-solid fa-xmark hover:text-red-500"></i>
									</div>
									<div class="px-3 py-2 bg-slate-200/50 dark:bg-slate-700/50 border-2 border-slate-200/50 dark:border-slate-700/50 rounded-full text-slate-500 dark:text-slate-300
												hover:border-red-500 hover:text-red-500 text-sm flex items-center justify-center cursor-pointer">
										<span class="mr-2">Xóa tất cả</span>
										<i class="fa-solid fa-xmark"></i>
									</div>
								</div>
							</div>
							<div>
								<div class="relative">
									<i class="fa-solid fa-magnifying-glass text-slate-500 dark:text-slate-300 text-sm absolute top-1/2 transform -translate-y-1/2 left-1"></i>
									<input type="text"
										name="search"
										placeholder="Mã, tên, thể loại,..."
										class="py-2 pl-8 w-full border-b-2 border-slate-200/50 dark:border-slate-700/50 text-sm placeholder-slate-500 text-slate-800
										dark:text-white focus:outline-none"		
									>
								</div>
							</div>
						</div>
						
						<!-- Table -->
						<div class="hidden md:block p-4 overflow-x-auto ">
							<table class="w-full min-w-4xl border-collapse">
							    <thead>
							      <tr class="border-y border-slate-200/50 dark:border-slate-700/50">
							        <!-- Checkbox all -->
							        <th class="p-4 text-center">
							          <label class="relative inline-flex cursor-pointer">
							            <input type="checkbox"
							              class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
							                     checked:bg-violet-500 checked:border-violet-500" />
							            <span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
							              <i class="fa-solid fa-check text-white text-xs"></i>
							            </span>
							          </label>
							        </th>
							        <!-- Headers -->
							        <th class="min-w-48 p-4 text-left text-sm font-semibold text-slate-600 dark:text-slate-300 text-nowrap">
							          Sách
							          <button type="button" class="ml-2"><i class="fa-solid fa-sort"></i></button>
							        </th>
							        <th class="p-4 text-left text-sm font-semibold text-slate-600 dark:text-slate-300 text-nowrap">
							          Thể loại
							          <button type="button" class="ml-2"><i class="fa-solid fa-sort"></i></button>
							        </th>
							        <th class="p-4 text-right text-sm font-semibold text-slate-600 dark:text-slate-300 text-nowrap">
							          Giá bán
							          <button type="button" class="ml-2"><i class="fa-solid fa-sort"></i></button>
							        </th>
							        <th class="p-4 text-center text-sm font-semibold text-slate-600 dark:text-slate-300 text-nowrap">
							          Số lượng
							          <button type="button" class="ml-2"><i class="fa-solid fa-sort"></i></button>
							        </th>
							        <th class="p-4 text-left text-sm font-semibold text-slate-600 dark:text-slate-300 text-nowrap">
							          Ngày thêm
							          <button type="button" class="ml-2"><i class="fa-solid fa-sort"></i></button>
							        </th>
							        <th class="p-4 text-right">
							          <button type="button" class="p-2 rounded hover:bg-slate-200/50 dark:hover:bg-slate-700/50">
							            <i class="fa-solid fa-list text-slate-500 dark:text-slate-300"></i>
							          </button>
							        </th>
							      </tr>
							    </thead>
							    <tbody>
							    <c:forEach var="book" items="${books}">
							      <tr class="border-b border-slate-200/50 dark:border-slate-700/50 hover:bg-slate-50/50 dark:hover:bg-slate-800/50">
							        <!-- Checkbox -->
							        <td class="p-4 text-center">
							          <label class="relative inline-flex cursor-pointer">
							            <input type="checkbox"
							              class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
							                     checked:bg-violet-500 checked:border-violet-500" />
							            <span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
							              <i class="fa-solid fa-check text-white text-xs"></i>
							            </span>
							          </label>
							        </td>
							        <!-- Book info -->
							        <td class="p-2 max-w-64">
							          <div class="flex space-x-2">
							            <img src="${pageContext.request.contextPath}/assets/images/books/${coverPhotos[book.id]}"
							                 alt="book-cover" class="w-16 h-24 object-contain rounded" />
							            <div class="flex flex-col justify-evenly ">
							              <p class="text-sm font-bold text-slate-800 dark:text-white line-clamp-2">
							                ${book.name}
							              </p>
							              <p class="text-xs text-slate-600 dark:text-slate-400 ">${book.id}</p>
							            </div>
							          </div>
							        </td>
							        <!-- Category -->
							        <td class="p-2">
							          <span class="text-sm ${cateColor[book.cateBook.id]} px-2 py-1 rounded-full whitespace-nowrap">
							            ${book.cateBook.name}
							          </span>
							        </td>
							        <!-- Price -->
							        <td class="p-2 text-right">
							        	
							          <span class="text-sm font-bold text-slate-800 dark:text-white">
							          đ
							          <fmt:setLocale value="vi-VN"/>
							          <fmt:formatNumber value="${book.price}" />
							          </span>
							        </td>
							        <!-- Quantity -->
							        <td class="p-2 text-center">
							          <span class="text-sm text-slate-800 dark:text-white">${book.amount}</span>
							        </td>
							        <!-- Date -->
							        <td class="p-2 text-left">
							          <span class="text-sm text-slate-800 dark:text-white whitespace-nowrap">
							            ${book.createAt}
							          </span>
							        </td>
							        <!-- Action -->
							        <td class="p-2 text-right">
							          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
							            <i class="fa-solid fa-ellipsis"></i>
							          </button>
							        </td>
							      </tr>
							      </c:forEach>
							    </tbody>
							  </table>
						</div>
						<!-- Mobile Cards -->
						<div class="space-y-4 md:hidden p-4">
							<c:forEach var="book" items="${books}">
								<div class="bg-white/80 dark:bg-slate-900/80 rounded-xl p-4 shadow-sm">
								    <div class="flex space-x-3">
								      <img src="${pageContext.request.contextPath}/assets/images/books/${coverPhotos[book.id]}"
								           class="w-16 h-24 object-contain rounded" />
								      <div class="flex flex-col justify-between">
								        <p class="text-sm font-bold text-slate-800 dark:text-white truncate">${book.name}</p>
								        <p class="text-xs text-slate-600 dark:text-slate-400">${book.id}</p>
								        <p class="text-sm text-slate-800 dark:text-white">đ  
									        <fmt:setLocale value="vi-VN"/>
								          	<fmt:formatNumber value="${book.price}" />
								        </p>
								        <p class="text-xs text-slate-600 dark:text-slate-400">${book.createAt}</p>
								      </div>
								    </div>
								  </div>
							</c:forEach>
						</div>	
						<div class="grid grid-cols-1 lg:grid-cols-2 place-items-center">
							<div class="p-4 lg:place-self-start flex justify-between items-center w-full lg:flex-col lg:items-start">
								<button type="button"
										class="text-xs text-slate-500 dark:text-slate-300 p-1.5 rounded-md bg-slate-50 dark:bg-slate-700/50
									       group relative">
									<span>20 dòng</span>
									<div
										class="absolute bottom-full left-0 mb-2 bg-slate-200 dark:bg-slate-700 text-slate-500 dark:text-slate-300 text-xs 
												scale-y-0 group-hover:scale-y-100 origin-bottom transition-all duration-200 z-50 flex flex-col rounded-md shadow-lg w-24">
										<span class="px-3 py-1 hover:bg-slate-300 dark:hover:bg-slate-600 cursor-pointer">5 dòng</span>
										<span class="px-3 py-1 hover:bg-slate-300 dark:hover:bg-slate-600 cursor-pointer">10 dòng</span>
										<span class="px-3 py-1 hover:bg-slate-300 dark:hover:bg-slate-600 cursor-pointer">20 dòng</span>
										<span class="px-3 py-1 hover:bg-slate-300 dark:hover:bg-slate-600 cursor-pointer">50 dòng</span>
									</div>
								</button>
								<span class="text-xs text-slate-500 dark:text-slate-400 p-1.5">
									Hiển thị trang 5-14 của 500 kết quả
								</span>
							</div>
							
							
							<div class="lg:place-self-end  p-4 flex items-center space-x-3">
								<!-- Prev -->
								<div class="px-2 py-1 flex items-center justify-center text-violet-400 border border-violet-50 dark:border-violet-900/20
											rounded-md bg-violet-50 dark:bg-violet-900/20 hover:border-violet-500 cursor-pointer">
									<span class="material-symbols-rounded">
									chevron_backward
									</span>
								</div>
								
								<div class="flex item-center text-white">
									<span class="border-s border-y border-slate-500 dark:border-slate-400 text-slate-500 dark:text-slate-400 px-2 py-1 rounded-l-md cursor-pointer
												hover:bg-slate-200/50 dark:hover:bg-slate-700/50 transtion-color duration-200 ease-in-out">1</span>
									<span class="border-s border-y  border-slate-500 dark:border-slate-400 text-slate-500 dark:text-slate-400 px-2 py-1 pointer-event-none">...</span>
									<span class="border-s border-y border-slate-500 dark:border-slate-400 text-slate-500 dark:text-slate-400 px-2 py-1 cursor-pointer
									hover:bg-slate-200/50 dark:hover:bg-slate-700/50 transtion-color duration-200 ease-in-out">4</span>
									<span class="border-s border-y border-slate-500 dark:border-slate-400 text-white px-2 py-1 bg-violet-500 dark:bg-violet-700/50 cursor-pointer">5</span>
									<span class="border-s border-y border-slate-500 dark:border-slate-400 text-slate-500 dark:text-slate-400 px-2 py-1 cursor-pointer
									hover:bg-slate-200/50 dark:hover:bg-slate-700/50 transtion-color duration-200 ease-in-out">6</span>
									<span class="border-s border-y border-slate-500 dark:border-slate-400 text-slate-500 dark:text-slate-400 px-2 py-1 pointer-event-none">...</span>
									<span class="border border-slate-500 dark:border-slate-400 text-slate-500 dark:text-slate-400 px-2 py-1 rounded-r-md cursor-pointer
									hover:bg-slate-200/50 dark:hover:bg-slate-700/50 transtion-color duration-200 ease-in-out">14</span>
								</div>
								
								<div class="px-2 py-1 flex items-center justify-center text-violet-400 border border-violet-50 dark:border-violet-900/20
											rounded-md bg-violet-50 dark:bg-violet-900/20 hover:border-violet-500 cursor-pointer">
									<span class="material-symbols-rounded">
									chevron_forward
									</span>
								</div>
							</div>							
						</div>
					</div>
					
				</main>
				<div class="md:hidden">
					<jsp:include page="./components/Layout/Footer.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/main.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/Book.js"></script>
</body>
</html>