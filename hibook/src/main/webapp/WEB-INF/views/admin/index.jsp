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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
    item.put("title", "Tổng doanh thu");
    item.put("value", "$124,583");
    item.put("change", "+12.5%");
    item.put("trend", "up");
    item.put("icon", "attach_money");
    item.put("color", "from-emerald-500 to-teal-600");
    item.put("bgColor", "bg-emerald-50 dark:bg-emerald-900/20");
    item.put("textColor", "text-emerald-600 dark:text-emerald-400");
    stats.add(item);
}
{
    Map<String, Object> item = new HashMap<>();
    item.put("title", "Người dùng");
    item.put("value", "8,549");
    item.put("change", "+8.2%");
    item.put("trend", "up");
    item.put("icon", "groups");
    item.put("color", "from-blue-500 to-indigo-600");
    item.put("bgColor", "bg-blue-50 dark:bg-blue-900/20");
    item.put("textColor", "text-blue-600 dark:text-blue-400");
    stats.add(item);
}
{
    Map<String, Object> item = new HashMap<>();
    item.put("title", "Tổng đơn hàng");
    item.put("value", "2,897");
    item.put("change", "+18.2%");
    item.put("trend", "up");
    item.put("icon", "receipt");
    item.put("color", "from-purple-500 to-pink-600");
    item.put("bgColor", "bg-purple-50 dark:bg-purple-900/20");
    item.put("textColor", "text-purple-600 dark:text-purple-400");
    stats.add(item);
}
{
    Map<String, Object> item = new HashMap<>();
    item.put("title", "Tổng lượt xem");
    item.put("value", "42,897");
    item.put("change", "-2.2%");
    item.put("trend", "down");
    item.put("icon", "visibility");
    item.put("color", "from-orange-500 to-red-600");
    item.put("bgColor", "bg-orange-50 dark:bg-orange-900/20");
    item.put("textColor", "text-orange-600 dark:text-orange-400");
    stats.add(item);
}

request.setAttribute("stats", stats);
%>
	<div class="min-h-screen bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 dark:from-slate-900 dark:via-slate-800 dark:to-slate-800 trasition-all duration-300">
		<div class="flex h-screen overflow-hidden">
			<jsp:include page="components/Layout/Sidebar.jsp"></jsp:include>
			
			<div class="flex flex-1 flex-col overflow-hidden">
				<jsp:include page="components/Layout/Header.jsp"></jsp:include>
				
				<main class="flex-1 overflow-y-auto bg-transparent p-6 space-y-4">
				
					<!-- Stats Grid -->
					<div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-4">
						<c:forEach var="stats" items="${stats}">
							<div class="p-6 bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl border border-slate-200/50 dark:border-slate-700/50
									rounded-xl transition-all duration-200 group hover:shadow-xl hover:shadow-slate-200/20 dark:hover:shadow-slate-900/20">
								<div class="flex items-start justify-between">
									<div class="flex-1">
										<p class="text-sm font-medium text-slate-500 dark:text-slate-300 capitalize mb-2">
											${stats.title}
										</p>
										<p class="text-3xl font-bold text-slate-800 dark:text-white mb-4">
											${stats.value}
										</p>
										<div class="flex items-center space-x-2">
											<div class="flex items-center">
												<span class="material-symbols-rounded transform  ${stats.trend == 'up' ? 'text-emerald-500 -rotate-45' : 'text-red-500 rotate-45'}">
													arrow_forward
												</span>
												<span class="text-sm ${stats.trend == 'up' ? 'text-emerald-500' : 'text-red-500'}">${stats.change}</span>
											</div>
											
											<span class="text-xs text-slate-500 dark:text-slate-300">với tháng trước</span>
										</div>
									</div>
									
									<div class="text-slate-500 p-3 rounded-xl group-hover:scale-110 transition-all duration-300 ${stats.bgColor}
												flex items-center justify-center">
										<span class="material-symbols-rounded ${stats.textColor}">
										${stats.icon}
										</span>
									</div>
								</div>
								
								<!-- Progress -->
								<div class="mt-4 h-2 bg-slate-100 dark:bg-slate-800 rounded-full overflow-hidden">
									<div 
			                            class="h-full bg-gradient-to-r ${stats.color} rounded-full transition-all duration-100"
			                            style="width: ${stats.trend == 'up' ? '75%' : '45%'} " >
			                        </div>
								</div>
							</div>
						</c:forEach>
						
					</div>
				
					<!-- Charts -->
					<div class="grid grid-cols-1 xl:grid-cols-3 gap-6">
						<!-- Revenue Charts -->
						<div class="xl:col-span-2">
							<div class="p-6 bg-white/80 dark:bg-slate-900/80 border border-slate-200/50 dark:border-slate-700/50 rounded-b-xl">
								<div class="flex items-center justify-between mb-6">
									<div>
										<h3 class="text-xl font-bold text-slate-800 dark:text-white">
											Biểu đồ doanh thu
										</h3>
										<p class="text-sm text-slate-500 dark:text-slate-300">
											Doanh thu và chi phí hàng tháng
										</p>
										
									</div>
									
									<div class="flex items-center space-x-3">
										<div class="flex items-center space-x-2">
											<div class="w-3 h-3 rounded-full bg-gradient-to-r from-violet-600 to-orange-600"></div>
											<span class="text-sm text-slate-500 dark:text-slate-300">Doanh thu</span>
										</div>
										<div class="flex items-center space-x-2">
											<div class="w-3 h-3 rounded-full bg-gradient-to-r from-slate-400 to-slate-500"></div>
											<span class="text-sm text-slate-500 dark:text-slate-300">Chi phí</span>
										</div>
									</div>
								</div>
								
								<div class="h-80">
									 <canvas id="revenueChart"></canvas>
								</div>
							</div>
						</div>
						
						<!-- Sales Charts -->
						<div class="space-y-6">
							<div class="p-6 bg-white/80 dark:bg-slate-900/80 border border-slate-200/50 dark:border-slate-700/50 rounded-b-xl">
								<div class="mb-6">
									<h3 class="text-xl font-bold text-slate-800 dark:text-white">
										Biểu đồ bán hàng
									</h3>
									<p class="text-sm text-slate-500 dark:text-slate-300">
										Top sách bán nhiều nhất
									</p>
								</div>
								<div  class="h-48">
									<canvas id="salesChart"></canvas>
								</div>
								<div id="pieChart-legend"></div>
							</div>
						</div>
					</div>
					
					<div class="grid grid-cols-1 xl:grid-cols-3 gap-6">
						<div class="xl:col-span-2">
							<!-- Table -->
							<div class="space-y-6">
								<!-- Recent Orders -->
								<div class="bg-white/80 dark:bg-slate-900/80 border border-slate-200/50 dark:border-slate-700/50 backdrop-blur-xl overflow-hidden
											rounded-b-xl ">
									<div class="flex items-center justify-between p-6">
										<div>
											<h3 class="text-xl font-bold text-slate-800 dark:text-white">
												Đơn hàng gần đây
											</h3>
											<p class="text-sm text-slate-500 dark:text-slate-300">
												Đơn hàng mới nhất của khách hàng
											</p>
										</div>
										
										<button class="text-sm font-medium text-violet-500 hover:underline hover:text-violet-700 transition-all duration-200 cursor-pointer">
											Xem tất cả
										</button>
									</div>
									
									<div class="overflow-x-auto">
										<table class="w-full">
											<thead>
												<tr>
													<th class="text-left text-slate-800 dark:text-white text-sm font-semibold p-4 text-nowrap">
														Mã đơn hàng
													</th>
													<th class="text-left text-slate-800 dark:text-white text-sm font-semibold p-4 text-nowrap">
														Khách hàng
													</th>
													<th class="text-left text-slate-800 dark:text-white text-sm font-semibold p-4 text-nowrap">
														Sách
													</th>
													<th class="text-left text-slate-800 dark:text-white text-sm font-semibold p-4 text-nowrap">
														Số lượng
													</th>
													<th class="text-left text-slate-800 dark:text-white text-sm font-semibold p-4 text-nowrap">
														Trạng thái
													</th>
													<th class="text-left text-slate-800 dark:text-white text-sm font-semibold p-4 text-nowrap">
														Thời gian đặt
													</th>
													
												</tr>
												
											</thead>
											
											<tbody id="table-content">
												<!-- Render JS -->
											</tbody>
											
										</table>
									</div>
								</div>
							</div>
							
						</div>
						
						<div>
						
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/main.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/RevenueChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/SalesChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin/TableSection.js"></script>
</body>
</html>