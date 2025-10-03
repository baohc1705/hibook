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
	List<Map<String, Object>> stats = new ArrayList<>();
{
	Map<String, Object> item = new HashMap<>();
	item.put("title", "Chờ xác nhận");
	item.put("value", 100);
	item.put("icon", "clock_loader_20");
	item.put("bgColor","bg-blue-50 dark:bg-blue-900/20");
	item.put("color", "text-blue-500");
	stats.add(item);
}
{
	Map<String, Object> item = new HashMap<>();
	item.put("title", "Đang vận chuyển");
	item.put("value", 50);
	item.put("icon", "delivery_truck_speed");
	item.put("bgColor","bg-orange-50 dark:bg-orange-900/20");
	item.put("color", "text-orange-500");
	stats.add(item);
}
{
	Map<String, Object> item = new HashMap<>();
	item.put("title", "Đã thanh toán");
	item.put("value", 576);
	item.put("icon", "order_approve");
	item.put("bgColor","bg-emerald-50 dark:bg-emerald-900/20");
	item.put("color", "text-emerald-500");
	stats.add(item);
}
{
	Map<String, Object> item = new HashMap<>();
	item.put("title", "Tổng đơn hàng");
	item.put("value", 1256);
	item.put("icon", "receipt");
	item.put("bgColor","bg-violet-50 dark:bg-violet-900/20");
	item.put("color", "text-violet-500");
	stats.add(item);
}
request.setAttribute("stats", stats);
%>
	<div class="min-h-screen bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 dark:from-slate-900 dark:via-slate-800 dark:to-slate-800 trasition-all duration-300">
		<div class="flex h-screen overflow-hidden">
			<jsp:include page="/WEB-INF/views/admin/components/Layout/Sidebar.jsp"></jsp:include>
			
			<div class="flex flex-1 flex-col overslow-hidden">
				<jsp:include page="/WEB-INF/views/admin/components/Layout/Header.jsp"></jsp:include>
				
				<main class="flex-1 overflow-y-auto bg-transparent p-4 space-y-4 ">
					<div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-4">
						<c:forEach var="item" items="${stats}">
							<div class="p-4 bg-white/80 dark:bg-slate-900/80 rounded-xl flex items-start">
								<div class="flex-1">
									<p class="text-sm text-slate-500 dark:text-slate-400 uppercase mb-2">${item.title}</p>
									<p class="text-xl font-bold text-slate-800 dark:text-white">${item.value}</p>
								</div>
								<div class="${item.bgColor} p-2 rounded-md flex items-center justify-center">
									<span class="material-symbols-rounded ${item.color}">
									${item.icon}
									</span>
								</div>
							</div>
						</c:forEach>
					</div>
					
					<div class="grid grid-cols-1">
						<div class="p-4 bg-white/80 dark:bg-slate-900/80 rounded-xl">
							<div class="flex items-center justify-between mb-3">
								<h3 class="text-xl font-bold text-slate-800 dark:text-white">Danh sách đơn hàng</h3>
								<div class="flex items-center space-x-2">
									<button type="button"
											class = "px-4 py-2 bg-emerald-50 dark:bg-emerald-900/50 text-emerald-500 text-sm rounded-xl 
													flex items-center justify-center cursor-pointer"
											
									>
										<i class="fa-solid fa-file-export"></i>
										<span class="ml-2">Xuất Excel</span>
									</button>
									
									<button
										type="button"
										class="px-4 py-2 bg-violet-50 dark:bg-violet-900/50 text-violet-500 text-sm rounded-xl 
													flex items-center justify-center cursor-pointer"
									>	
										<i class="fa-solid fa-file-arrow-down"></i>
										<span class="ml-2">Tạo báo cáo</span>
									</button>
								</div>
							</div>
							
							<div class="flex items-center justify-between mb-3">
								<div class="flex items-center space-x-3">
									<button class="p-2 border border-slate-200/50 dark:border-slate-700/50 rounded-md text-slate-500 dark:text-slate-400">
										<i class="fa-solid fa-filter"></i>
									</button>
									<div class="flex items-center space-x-3">
										<!-- List filter render by js -->
										<div class="px-3 py-2 bg-emerald-200/50 dark:bg-emerald-700/50 border-2 border-emerald-200/50 dark:border-emerald-700/50 rounded-full text-emerald-500 dark:text-emerald-300
													hover:border-emerald-500 text-sm flex items-center justify-center cursor-pointer">
											<span class="mr-2">Chờ xác nhận</span>
											<i class="fa-solid fa-xmark hover:text-red-500"></i>
										</div>
										<div class="px-3 py-2 bg-slate-200/50 dark:bg-slate-700/50 border-2 border-slate-200/50 dark:border-slate-700/50 rounded-full text-slate-500 dark:text-slate-300
													hover:border-red-500 hover:text-red-500 text-sm flex items-center justify-center cursor-pointer">
											<span class="mr-2">Xóa tất cả</span>
											<i class="fa-solid fa-xmark"></i>
										</div>
									</div>
								</div>
								<div class="relative">
									<input 
										type="text"
										class="	pl-10 py-2 border-b border-slate-200/50 dark:border-slate-700/50 placeholder:italic placeholder:text-sm placeholder:text-slate-500 
												dark:placeholder:text-slate-400 focus:outline-none text-slate-800 dark:text-white"
										placeholder="ID, Tên,..."
									>
									<span class="absolute left-3 top-1/2 transform -translate-y-1/2 text-slate-500 dark:border-slate-400">
										<i class="fa-solid fa-magnifying-glass"></i>
									</span>
								</div>
							</div>
							
							<div class="overflow-x-auto">
								<table class="w-full min-w-5xl">
									<thead>
										<tr class="border-y border-slate-200/50 dark:border-slate-700/50">
											<th class="text-center">
												<label class="relative inline-flex cursor-pointer">
										            <input type="checkbox"
										              class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
										                     checked:bg-violet-500 checked:border-violet-500" />
										            <span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
										              <i class="fa-solid fa-check text-white text-xs"></i>
										            </span>
									          	</label>
											</th>
											<th class="p-2 text-sm text-left font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Mã đơn hàng
												<button type="button" class="ml-2"><i class="fa-solid fa-sort"></i></button>
											</th>
											<th class="p-2 text-sm  text-left font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Khách hàng
											</th>
											<th class="p-2 text-sm font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Sản phẩm
											</th>
											<th class="p-2 text-sm font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Tổng tiền
											</th>
											<th class="p-2 text-sm text-left font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Trạng thái
											</th>
											<th class="p-2 text-sm text-left font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Giao dịch
											</th>
											<th class="p-2 text-sm text-left font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Thanh toán
											</th>
											<th class="p-2 text-sm text-left font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Ngày tạo
											</th>
											<th class="pl-2 py-2 text-sm font-semibold text-slate-500 dark:text-slate-400 text-right">
												<button type="button" class="p-2 rounded hover:bg-slate-200/50 dark:hover:bg-slate-700/50">
									            	<i class="fa-solid fa-list text-slate-500 dark:text-slate-300"></i>
									          	</button>
											</th>
										</tr>
									</thead>
									
									<tbody>
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50 
													odd:bg-white/80 even:bg-slate-50 dark:odd:bg-slate-900/80 dark:even:bg-slate-800">
											<td class="p-2 text-center">
												<label class="relative inline-flex cursor-pointer">
										            <input type="checkbox"
										              class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
										                     checked:bg-violet-500 checked:border-violet-500" />
										            <span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
										              <i class="fa-solid fa-check text-white text-xs"></i>
										            </span>
									          	</label>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												#2510091240
											</td>
											<td class="p-2 text-left flex items-center space-x-2">
												<img 
													alt="avatar" 
													src="${pageContext.request.contextPath}/assets/images/avatars/avatar1.jpg"
													class="w-10 h-10 rounded-full ring-2 ring-violet-500 object-cover"
												>
												<div class="flex flex-col justify-between">
													<p class="text-sm font-semibold text-slate-800 dark:text-white truncate min-w-24">Huỳnh Chí Bảo</p>
													<span class="text-xs text-slate-500 dark:text-slate-400 truncate min-w-24">brianbennet@gmail.com</span>
												</div>
												
											</td>
											<td class="p-2 text-center text-sm text-slate-800 dark:text-white text-nowrap">
												2
											</td>
											<td class="p-2 text-right text-sm text-red-500 text-nowrap">
												đ 499.000
											</td>
											
											<td class="p-2  text-sm ">
												<span
													class="px-2 py-1.5 text-sm bg-blue-50 dark:bg-blue-900/20 text-blue-500 rounded-full text-nowrap"
												>
													Chờ xác nhận
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												COD
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												<span
													class="px-2 py-1.5 text-sm bg-red-50 dark:bg-red-900/20 text-red-500 rounded-full text-nowrap"
												>
													Chưa thanh toán
												</span>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												09:43 02-09-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
										
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50 
													odd:bg-white/80 even:bg-slate-50 dark:odd:bg-slate-900/80 dark:even:bg-slate-800">
											<td class="p-2 text-center">
												<label class="relative inline-flex cursor-pointer">
										            <input type="checkbox"
										              class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
										                     checked:bg-violet-500 checked:border-violet-500" />
										            <span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
										              <i class="fa-solid fa-check text-white text-xs"></i>
										            </span>
									          	</label>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												#2510091250
											</td>
											<td class="p-2 text-left flex items-center space-x-2">
												<div class="w-10 h-10 rounded-full ring-2 ring-violet-500 flex items-center justify-center text-md font-bold
															bg-violet-50 dark:bg-violet-900/20 text-violet-500">
													<span>B</span>
												</div>
												<div class="flex flex-col justify-between">
													<p class="text-sm font-semibold text-slate-800 dark:text-white truncate min-w-24">Huỳnh Chí Bảo</p>
													<span class="text-xs text-slate-500 dark:text-slate-400 truncate min-w-24">brianbennet@gmail.com</span>
												</div>
												
											</td>
											<td class="p-2 text-center text-sm text-slate-800 dark:text-white text-nowrap">
												3
											</td>
											<td class="p-2 text-right text-sm text-red-500 text-nowrap">
												đ 125.000
											</td>
											
											<td class="p-2  text-sm ">
												<span
													class="px-2 py-1.5 text-sm bg-yellow-50 dark:bg-yellow-900/20 text-yellow-500 rounded-full text-nowrap"
												>
													Đang vận chuyển
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												MOMO
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												<span
													class="px-2 py-1.5 text-sm bg-emerald-50 dark:bg-emerald-900/20 text-emerald-500 rounded-full text-nowrap"
												>
													Đã thanh toán
												</span>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												09:43 02-09-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50 
												odd:bg-white/80 even:bg-slate-50 dark:odd:bg-slate-900/80 dark:even:bg-slate-800">
											<td class="p-2 text-center">
												<label class="relative inline-flex cursor-pointer">
										            <input type="checkbox"
										              class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
										                     checked:bg-violet-500 checked:border-violet-500" />
										            <span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
										              <i class="fa-solid fa-check text-white text-xs"></i>
										            </span>
									          	</label>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												#2510091240
											</td>
											<td class="p-2 text-left flex items-center space-x-2">
												<img 
													alt="avatar" 
													src="${pageContext.request.contextPath}/assets/images/avatars/avatar1.jpg"
													class="w-10 h-10 rounded-full ring-2 ring-violet-500 object-cover"
												>
												<div class="flex flex-col justify-between">
													<p class="text-sm font-semibold text-slate-800 dark:text-white truncate min-w-24">Huỳnh Chí Bảo</p>
													<span class="text-xs text-slate-500 dark:text-slate-400 truncate min-w-24">brianbennet@gmail.com</span>
												</div>
												
											</td>
											<td class="p-2 text-center text-sm text-slate-800 dark:text-white text-nowrap">
												2
											</td>
											<td class="p-2 text-right text-sm text-red-500 text-nowrap">
												đ 499.000
											</td>
											
											<td class="p-2  text-sm ">
												<span
													class="px-2 py-1.5 text-sm bg-blue-50 dark:bg-blue-900/20 text-blue-500 rounded-full text-nowrap"
												>
													Chờ xác nhận
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												COD
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												<span
													class="px-2 py-1.5 text-sm bg-red-50 dark:bg-red-900/20 text-red-500 rounded-full text-nowrap"
												>
													Chưa thanh toán
												</span>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												09:43 02-09-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
										
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50 
												  odd:bg-white/80 even:bg-slate-50 dark:odd:bg-slate-900/80 dark:even:bg-slate-800">
											<td class="p-2 text-center">
												<label class="relative inline-flex cursor-pointer">
										            <input type="checkbox"
										              class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
										                     checked:bg-violet-500 checked:border-violet-500" />
										            <span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
										              <i class="fa-solid fa-check text-white text-xs"></i>
										            </span>
									          	</label>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												#2510091250
											</td>
											<td class="p-2 text-left flex items-center space-x-2">
												<div class="w-10 h-10 rounded-full ring-2 ring-violet-500 flex items-center justify-center text-md font-bold
															bg-violet-50 dark:bg-violet-900/20 text-violet-500">
													<span>B</span>
												</div>
												<div class="flex flex-col justify-between">
													<p class="text-sm font-semibold text-slate-800 dark:text-white truncate min-w-24">Huỳnh Chí Bảo</p>
													<span class="text-xs text-slate-500 dark:text-slate-400 truncate min-w-24">brianbennet@gmail.com</span>
												</div>
												
											</td>
											<td class="p-2 text-center text-sm text-slate-800 dark:text-white text-nowrap">
												3
											</td>
											<td class="p-2 text-right text-sm text-red-500 text-nowrap">
												đ 125.000
											</td>
											
											<td class="p-2  text-sm ">
												<span
													class="px-2 py-1.5 text-sm bg-yellow-50 dark:bg-yellow-900/20 text-yellow-500 rounded-full text-nowrap"
												>
													Đang vận chuyển
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												MOMO
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												<span
													class="px-2 py-1.5 text-sm bg-emerald-50 dark:bg-emerald-900/20 text-emerald-500 rounded-full text-nowrap"
												>
													Đã thanh toán
												</span>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												09:43 02-09-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50
													odd:bg-white/80 even:bg-slate-50 dark:odd:bg-slate-900/80 dark:even:bg-slate-800">
											<td class="p-2 text-center">
												<label class="relative inline-flex cursor-pointer">
										            <input type="checkbox"
										              class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
										                     checked:bg-violet-500 checked:border-violet-500" />
										            <span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
										              <i class="fa-solid fa-check text-white text-xs"></i>
										            </span>
									          	</label>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												#2510091240
											</td>
											<td class="p-2 text-left flex items-center space-x-2">
												<img 
													alt="avatar" 
													src="${pageContext.request.contextPath}/assets/images/avatars/avatar1.jpg"
													class="w-10 h-10 rounded-full ring-2 ring-violet-500 object-cover"
												>
												<div class="flex flex-col justify-between">
													<p class="text-sm font-semibold text-slate-800 dark:text-white truncate min-w-24">Huỳnh Chí Bảo</p>
													<span class="text-xs text-slate-500 dark:text-slate-400 truncate min-w-24">brianbennet@gmail.com</span>
												</div>
												
											</td>
											<td class="p-2 text-center text-sm text-slate-800 dark:text-white text-nowrap">
												2
											</td>
											<td class="p-2 text-right text-sm text-red-500 text-nowrap">
												đ 499.000
											</td>
											
											<td class="p-2  text-sm ">
												<span
													class="px-2 py-1.5 text-sm bg-blue-50 dark:bg-blue-900/20 text-blue-500 rounded-full text-nowrap"
												>
													Chờ xác nhận
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												COD
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												<span
													class="px-2 py-1.5 text-sm bg-red-50 dark:bg-red-900/20 text-red-500 rounded-full text-nowrap"
												>
													Chưa thanh toán
												</span>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												09:43 02-09-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
										
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50 
													odd:bg-white/80 even:bg-slate-50 dark:odd:bg-slate-900/80 dark:even:bg-slate-800">
											<td class="p-2 text-center">
												<label class="relative inline-flex cursor-pointer">
										            <input type="checkbox"
										              class="peer appearance-none size-5 rounded border border-slate-300 dark:border-slate-600 
										                     checked:bg-violet-500 checked:border-violet-500" />
										            <span class="absolute inset-0 hidden peer-checked:flex items-center justify-center">
										              <i class="fa-solid fa-check text-white text-xs"></i>
										            </span>
									          	</label>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												#2510091250
											</td>
											<td class="p-2 text-left flex items-center space-x-2">
												<div class="w-10 h-10 rounded-full ring-2 ring-violet-500 flex items-center justify-center text-md font-bold
															bg-violet-50 dark:bg-violet-900/20 text-violet-500">
													<span>B</span>
												</div>
												<div class="flex flex-col justify-between">
													<p class="text-sm font-semibold text-slate-800 dark:text-white truncate min-w-24">Huỳnh Chí Bảo</p>
													<span class="text-xs text-slate-500 dark:text-slate-400 truncate min-w-24">brianbennet@gmail.com</span>
												</div>
												
											</td>
											<td class="p-2 text-center text-sm text-slate-800 dark:text-white text-nowrap">
												3
											</td>
											<td class="p-2 text-right text-sm text-red-500 text-nowrap">
												đ 125.000
											</td>
											
											<td class="p-2  text-sm ">
												<span
													class="px-2 py-1.5 text-sm bg-yellow-50 dark:bg-yellow-900/20 text-yellow-500 rounded-full text-nowrap"
												>
													Đang vận chuyển
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												MOMO
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												<span
													class="px-2 py-1.5 text-sm bg-emerald-50 dark:bg-emerald-900/20 text-emerald-500 rounded-full text-nowrap"
												>
													Đã thanh toán
												</span>
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												09:43 02-09-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
									</tbody>
								</table>
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
					</div>
				</main>
				<div class="md:hidden">
					<jsp:include page="/WEB-INF/views/admin/components/Layout/Footer.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/main.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/Book.js"></script>
</body>
</html>