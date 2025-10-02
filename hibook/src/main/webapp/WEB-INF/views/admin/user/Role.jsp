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
				 	<div class="grid grid-cols-1">
						<div class="flex items-center justify-between p-4 bg-white/80 dark:bg-slate-900/80 rounded-xl">
							<div>
								<h3 class="text-xl font-bold text-slate-800 dark:text-white capitalize">Danh sách vai trò</h3>
								<p class="text-sm text-slate-500 dark:text-slate-400">Quản lý vai trò và cấp quyền cho người dùng</p>
							</div>
							<button
								type="button"
								class="px-2 py-1.5 rounded-md text-white bg-violet-600 hover:outline-2 hover:outline-offset-2 hover:outline-violet-500/50"
							>
								<i class="fa-solid fa-plus"></i>
								Thêm mới
							</button>
						</div>
					</div>
					
					<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
						<div class="p-4 bg-white/80 h-80 dark:bg-slate-900/80 rounded-xl overflow-hidden" >
							<h3 class="text-md font-bold text-slate-800 dark:text-white">Quản trị viên</h3>
							<div class="overflow-auto max-h-64">
								<div class="flex flex-col space-y-3 ">
									<div class="p-3 flex items-start justify-between hover:bg-slate-50 dark:hover:bg-slate-800 rounded-xl">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="p-4 bg-white/80 h-80 dark:bg-slate-900/80 rounded-xl overflow-hidden" >
							<h3 class="text-md font-bold text-slate-800 dark:text-white">Quản lý</h3>
							<div class="overflow-auto max-h-64">
								<div class="flex flex-col space-y-3 ">
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
										
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="p-4 bg-white/80 h-80 dark:bg-slate-900/80 rounded-xl overflow-hidden" >
							<h3 class="text-md font-bold text-slate-800 dark:text-white">Người dùng</h3>
							<div class="overflow-auto max-h-64">
								<div class="flex flex-col space-y-3 ">
									<div class="p-3 flex items-start justify-between">
										<div>
											<p class="text-sm font-semibold text-slate-800 dark:text-white">USER_CREATE</p>
											<p class="text-xs text-slate-500 dark:text-slate-400">Xem thông tin tài khoản</p>
										</div>
										<div class="flex items-center space-x-1">
											<button type="button" class="bg-emerald-50 dark:bg-emerald-900/20 p-1 text-emerald-500 rounded-md ">
								           		<i class="fa-solid fa-pen-to-square"></i>
								        	</button>
								        	<button type="button" class="bg-red-50 dark:bg-red-900/20 p-1 text-red-500 rounded-md">
								           		<i class="fa-solid fa-trash"></i>
								        	</button>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				
					<div class="grid grid-cols-1">
						<div class="flex flex-1 flex-col bg-white/80 dark:bg-slate-900/80 rounded-xl p-4  overflow-hidden">
						<div class="flex items-center justify-between">
							<div>
								<h3 class="text-xl font-bold text-slate-800 dark:text-white capitalize">Danh sách quyền</h3>
								<p class="text-sm text-slate-500 dark:text-slate-400">Quản lý quyền của người dùng</p>
							</div>
							<button
								type="button"
								class="px-2 py-1.5 rounded-md text-white bg-violet-600 hover:outline-2 hover:outline-offset-2 hover:outline-violet-500/50"
							>
								<i class="fa-solid fa-plus"></i>
								Thêm mới
							</button>
						</div>
							
							<div class="overflow-x-auto mt-3">
								<table class="w-full min-w-3xl">
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
												Tên
												<button type="button" class="ml-2"><i class="fa-solid fa-sort"></i></button>
											</th>
											<th class="p-2 text-sm text-left font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Tài nguyên
											</th>
											<th class="p-2 text-sm text-left font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Hành động
											</th>
											<th class="p-2 text-sm text-left font-semibold text-slate-500 dark:text-slate-400 text-nowrap">
												Mô tả
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
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50 hover:bg-slate-50 dark:hover:bg-slate-800">
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
											<td class="p-2 text-sm font-semibold text-slate-800 dark:text-white text-nowrap text-left">
												USER_CREATE
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												user
											</td>
											<td class="p-2 text-left">
												<span
													class="px-2 py-1.5 text-sm bg-green-50 dark:bg-green-900/20 text-green-500 rounded-full text-nowrap"
												>
													create
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap text-left">
												Xem thông tin tài khoản
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												11:53 02-10-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50">
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
											<td class="p-2 text-sm font-semibold text-slate-800 dark:text-white text-nowrap text-left">
												USER_CREATE
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												user
											</td>
											<td class="p-2 text-left">
												<span
													class="px-2 py-1.5 text-sm bg-green-50 dark:bg-green-900/20 text-green-500 rounded-full text-nowrap"
												>
													create
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap text-left">
												Xem thông tin tài khoản
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												11:53 02-10-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50">
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
											<td class="p-2 text-sm font-semibold text-slate-800 dark:text-white text-nowrap text-left">
												USER_CREATE
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												user
											</td>
											<td class="p-2 text-left">
												<span
													class="px-2 py-1.5 text-sm bg-green-50 dark:bg-green-900/20 text-green-500 rounded-full text-nowrap"
												>
													create
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap text-left">
												Xem thông tin tài khoản
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												11:53 02-10-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50">
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
											<td class="p-2 text-sm font-semibold text-slate-800 dark:text-white text-nowrap text-left">
												USER_CREATE
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												user
											</td>
											<td class="p-2 text-left">
												<span
													class="px-2 py-1.5 text-sm bg-green-50 dark:bg-green-900/20 text-green-500 rounded-full text-nowrap"
												>
													create
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap text-left">
												Xem thông tin tài khoản
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												11:53 02-10-2025
											</td>
											<td class="pl-2 py-2 text-right">
									          <button type="button" class="p-2 text-slate-500 dark:text-slate-300">
									            <i class="fa-solid fa-ellipsis"></i>
									          </button>
									        </td>
										</tr>
										<tr class="border-b border-slate-200/50 dark:border-slate-700/50">
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
											<td class="p-2 text-sm font-semibold text-slate-800 dark:text-white text-nowrap text-left">
												USER_CREATE
											</td>
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap">
												user
											</td>
											<td class="p-2 text-left">
												<span
													class="px-2 py-1.5 text-sm bg-green-50 dark:bg-green-900/20 text-green-500 rounded-full text-nowrap"
												>
													create
												</span>
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white text-nowrap text-left">
												Xem thông tin tài khoản
											</td>
											
											<td class="p-2 text-sm text-slate-800 dark:text-white">
												11:53 02-10-2025
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