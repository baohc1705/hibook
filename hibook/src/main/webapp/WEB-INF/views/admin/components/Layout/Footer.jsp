<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="w-screen px-6 py-4 bg-white/80 dark:bg-slate-900/80">
		<nav class="flex items-center justify-between">
			<button class="p-2 hover:bg-slate-200/50 dark:hover:bg-slate-700/50 rounded-xl transition-all duration-200">
				<div class="flex items-center flex-col">
					<i class="fa-solid fa-house text-2xl text-slate-800 dark:text-white"></i>
					
				</div>
			</button>
			<button class="p-2 hover:bg-slate-200/50 dark:hover:bg-slate-700/50 rounded-xl transition-all duration-200">
				<div class="flex items-center flex-col">
					<i class="fa-solid fa-chart-simple text-2xl text-slate-800 dark:text-white"></i>
					
				</div>
			</button>
			<button class="p-2 hover:bg-slate-200/50 dark:hover:bg-slate-700/50 rounded-xl transition-all duration-200">
				<div class="flex items-center flex-col">
					<i class="fa-solid fa-cart-shopping text-2xl text-slate-800 dark:text-white"></i>
					
				</div>
			</button>
			<button class="p-2 hover:bg-slate-200/50 dark:hover:bg-slate-700/50 rounded-xl transition-all duration-200">
				<div class="flex items-center flex-col">
					<i class="fa-solid fa-receipt text-2xl text-slate-800 dark:text-white"></i>
					
				</div>
			</button>
			<button class="p-2 hover:bg-slate-200/50 dark:hover:bg-slate-700/50 rounded-xl transition-all duration-200">
				<div class="flex items-center flex-col"	>
					<img 
                      	alt="avatar" 
                      	src="${pageContext.request.contextPath}/assets/images/avatars/avatar.jpg"
                      	class="w-8 h-8 rounded-full object-cover ring-2 ring-white"
                      >
					
				</div>
			</button>
		</nav>
	</div>
</body>
</html>