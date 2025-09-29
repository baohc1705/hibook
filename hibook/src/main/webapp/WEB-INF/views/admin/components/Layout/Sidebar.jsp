<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
<%
    // Danh sách menu chính
    List< Map<String, Object>> menuItems = new ArrayList<>();

    // Dashboard
    {
        Map<String, Object> item = new HashMap<>();
        item.put("id", "dashboard");
        item.put("icon", "dashboard");
        item.put("label", "Trang chủ");
        item.put("active", true);
        item.put("badge", "New");
        item.put("page", "dashboard");
        menuItems.add(item);
    }

    // Analytics
    {
    	Map<String, Object> item = new HashMap<>();
        item.put("id", "analytics");
        item.put("icon", "bar_chart_4_bars");
        item.put("label", "Thống kê");

        List<Map<String, Object>> submenu = new ArrayList<>();
        submenu.add(Map.of("id", "overview", "label", "Tổng quan"));
        submenu.add(Map.of("id", "reports", "label", "Báo cáo"));
        submenu.add(Map.of("id", "insights", "label", "Chi tiết"));

        item.put("submenu", submenu);
        menuItems.add(item);
    }

    // Users
    {
    	Map<String, Object> item = new HashMap<>();
        item.put("id", "user");
        item.put("icon", "group");
        item.put("label", "Người dùng");
        item.put("count", "2.4k");

        List<Map<String, Object>> submenu = new ArrayList<>();
        submenu.add(Map.of("id", "all-users", "label", "Tất cả"));
        submenu.add(Map.of("id", "roles", "label", "Cấp quyền"));
        submenu.add(Map.of("id", "activity", "label", "Hoạt động"));

        item.put("submenu", submenu);
        menuItems.add(item);
    }

    // E-commerce
    {
    	Map<String, Object> item = new HashMap<>();
        item.put("id", "ecommerce");
        item.put("icon", "shopping_cart");
        item.put("label", "Cửa hàng");

         List< Map<String, Object>> submenu = new  ArrayList<>();
        submenu.add( Map.of("id", "products", "label", "Sách"));
        submenu.add( Map.of("id", "orders", "label", "Đơn hàng"));
        submenu.add( Map.of("id", "customers", "label", "Khách hàng"));

        item.put("submenu", submenu);
        menuItems.add(item);
    }

    // Inventory
    {
    	Map<String, Object> item = new HashMap<>();
        item.put("id", "inventory");
        item.put("icon", "package_2");
        item.put("label", "Kho");
        item.put("count", "999");
        item.put("page", "inventory");
        menuItems.add(item);
    }

    // Transactions
    {
    	Map<String, Object> item = new HashMap<>();
        item.put("id", "transactions");
        item.put("icon", "credit_card");
        item.put("label", "Giao dịch");
        item.put("page", "transactions");
        menuItems.add(item);
    }

    // Messages
    {
    	Map<String, Object> item = new HashMap<>();
        item.put("id", "messages");
        item.put("icon", "chat");
        item.put("label", "Tin nhắn");
        item.put("badge", "12");
        item.put("page", "messages");
        menuItems.add(item);
    }

    // Calendar
    {
    	Map<String, Object> item = new HashMap<>();
        item.put("id", "calendar");
        item.put("icon", "calendar_month");
        item.put("label", "Lịch");
        item.put("page", "calendar");
        menuItems.add(item);
    }

    // Reports
    {
    	Map<String, Object> item = new HashMap<>();
        item.put("id", "reports");
        item.put("icon", "news");
        item.put("label", "Báo cáo");
        item.put("page", "reports");
        menuItems.add(item);
    }

    // Settings
    {
    	Map<String, Object> item = new HashMap<>();
        item.put("id", "settings");
        item.put("icon", "settings");
        item.put("label", "Cài đặt");
        item.put("page", "settings");
        menuItems.add(item);
    }

    // đưa list vào request scope
    request.setAttribute("menuItems", menuItems);
%>

	<div id="menuItem" class="hidden md:flex w-72 h-screen  flex-col bg-white/80 dark:bg-slate-900 border-r border-slate-200/50 dark:border-slate-700/50
						transition-all duration-300">
		<!-- Logo -->
		<div class="flex items-center  justify-center p-4">
			<div  class="toggleMenu flex-1 flex items-center space-x-3 transition-all duration-200">
				<!-- Icon -->
				<img alt="logo" 
					src="${pageContext.request.contextPath}/assets/images/logos/logo-admin.png"
					class="w-10 h-10"
				>
				
				<!-- Brand -->
				<div>
					<h1 class="bg-gradient-to-r from-violet-600 via-pink-500 to-orange-500 bg-clip-text text-transparent
							   text-xl font-bold font-header tracking-wider">
						HiBook
					</h1>
					<p class="text-xs text-slate-500 dark:text-slate-400">
						Admin Panel
					</p>
				</div>
            </div>
            
            <!-- Toggle Sidebar -->
            <div class="flex items-center">
            	<button 
            		type="button" 
				  	class="p-2 rounded-xl text-slate-600 dark:text-slate-300 
				         hover:bg-slate-100 dark:hover:bg-slate-700/50 flex items-center justify-center"
				    id="btn-toggle-menu"
				>
					<span id="btn-toggle-icon" 
						class="material-symbols-rounded text-slate-600 dark:text-slate-400 text-2xl
						transform transition-all duration-300">
						keyboard_double_arrow_left
					</span>
				</button>
            </div>
		</div>
		
		<!-- Navigation -->
		<nav class="flex-1 overflow-y-auto p-4 space-y-2">
			<c:forEach var="item" items="${menuItems}">
				<button
					class="${not empty item.submenu 
								? ' btn-submenu ' 
								: ' btn-menu-item '
							}
							${ item.active
								?'bg-gradient-to-r from-violet-600 via-pink-500 to-orange-500 text-white'
								:''
							 }
						w-full p-3 text-slate-500
						flex items-center justify-between transition-all ease-in-out duration-200 cursor-pointer rounded-xl"  
				>
					<div class="flex items-center space-x-2">
						<!-- Icon -->
						<span class="material-symbols-rounded text-xl">${item.icon}</span>
						
						<!-- Label -->
						
						<span class="toggleMenu font-medium truncate">
							${item.label}
						</span>
						
						<!-- Badge -->
						<c:if test="${not empty item.badge}">
							<div class="toggleMenu text-xs px-2 py-1 rounded-full bg-blue-500 text-white flex items-center">
								<span>${item.badge}</span>
							</div>
						</c:if>
						<!-- Count -->
						<c:if test="${not empty item.count}">
							<div class="toggleMenu text-xs px-2 py-1 rounded-full bg-slate-500 dark:bg-slate-600 text-white flex items-center">
								<span>${item.count}</span>
							</div>
						</c:if>
					</div>
					<c:if test="${not empty item.submenu}">
						<div class="toggleMenu">
							<span class="arrow material-symbols-rounded text-md text-slate-500 dark:text-slate-300 
									transform transition-all duration-200">
								keyboard_arrow_down
							</span>
						</div>
					</c:if>
				</button>
				
				<!-- Sub menu -->
				<c:if test="${not empty item.submenu}">
					<div class="submenu hidden ml-8 mt-2">
						<c:forEach var="submenu" items="${item.submenu}">
							<button type="button" 
								class="w-full text-left p-2 text-sm text-slate-600
                                       dark:text-slate-400 hover:text-slate-800 dark:hover:text-slate-200
                                       hover:bg-slate-100 dark:hover:bg-slate-800/50 rounded-lg
                                       transition-all duration-200"
                              
							>
								<span>${submenu.label}</span>
							</button>
						</c:forEach>
					</div>
				</c:if>
			</c:forEach>
		</nav>
		
		<!-- User profile -->
		<div class="toggleMenu p-4 border-t border-slate-200/50 dark:border-slate-700/50">
			<div class="flex items-center p-3 bg-slate-50 dark:bg-slate-800/50 space-x-3 rounded-xl">
				<div class="w-10 h-10">
					<img alt="avatar" 
						src="${pageContext.request.contextPath}/assets/images/avatars/avatar.jpg"
						class="w-10 h-10 ring-2 ring-blue-500 rounded-full object-cover"
					>
				</div>
				<div class="flex-1 min-w-0">
					<p class="text-md font-semibold text-slate-800 dark:text-white truncate"> 
						Brian Bennet
					</p>
					<p class="text-xs text-slate-500 dark:text-slate-300 truncate">
						Administrator
					</p>
				</div>
				<button type="button" class="flex items-center jutify-center p-2 hover:bg-slate-200/50 dark:hover:bg-slate-700/50 rounded-xl">
					<span class="material-symbols-rounded text-xl text-slate-500 dark:text-slate-300">logout</span>
				</button>
			</div>
		</div>
	</div>
</body>
</html>