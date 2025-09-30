<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="px-4 py-2 md:px-6 md:py-4 bg-white/80 dark:bg-slate-900 border-b border-slate-200/50 dark:border-slate-700/50">
		<div class="flex items-center justify-between">
			<!-- Left section -->
			
			<div class="hidden md:block">
				<h1 class="uppercase text-2xl font-bold text-slate-800 dark:text-white font-header tracking-wider">
					Trang chủ
				</h1>
				<p class="text-slate-800 dark:text-white">
					Chào Brian! Hôm nay của bạn thế nào?
				</p>
			</div>
			
			<div class="md:hidden flex items-center  justify-center p-4">
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
			</div>
			
			<!-- Center -->
			<div class="flex-1 max-w-md mx-2 md:mx-8">
				<div class="relative">
					<span class="material-symbols-rounded text-xl text-slate-500 dark:text-slate-300
								absolute top-1/2 transform -translate-y-1/2 md:left-1 xs-right-3 p-2">
						search
					</span>
					<input
						type="text" 
						name="search"
						placeholder="Tìm kiếm"
						class="hidden md:block w-full pl-10 py-2.5 border border-slate-200 dark:border-slate-700 rounded-xl focus:outline-none focus:ring-2
						focus:ring-blue-500 transition-all duration-200 text-slate-800 dark:text-white placeholder-slate-500"
					>
				</div>
			</div>
			
			<!-- Right -->
			<div class="flex items-center md:space-x-3">
				<!-- Quick Action -->
				<button
					type="button"
					class="hidden lg:flex items-center justify-center text-white space-x-2 px-4 py-2 rounded-xl 
						  bg-gradient-to-r from-violet-600 via-pink-500 to-orange-500"
				>
					<span class="material-symbols-rounded text-xl">
						add
					</span>
					<span class="text-sm font-semibold">New</span>
				</button>
				
				<!-- Toggle dark mode -->
				<button 
					type="button"
					class="p-2 rounded-xl text-slate-500 dark:text-slate-300 hover:bg-slate-200/50 dark:hover:bg-slate-700/50
					flex items-center justify-center"
					id="btn-toggle-darkmode"
				>
					
				</button>
				
				<!-- Notification -->
				<button
					type="button"
					class="relative p-2 rounded-xl text-slate-500 dark:text-slate-300 hover:bg-slate-200/50 dark:hover:bg-slate-700/50
					flex items-center justify-center group relative"	
				>
					<span class="material-symbols-rounded">
						notifications
					</span>
					<span class="w-5 h-5 rounded-full bg-red-500 text-xs text-white absolute top-0.5 right-0.5 z-10">9+</span>
					<div class="absolute top-full right-0 rounded-lg p-3 mt-1 shadow-md 
								scale-y-0 group-focus:scale-y-100 origin-top duration-200 z-50 bg-slate-500">
						<p>Home</p>
						<p>About</p>
						<p>Summary</p>
					</div>
				</button>
				
				<!-- Settings -->
				<button
					type="button"
					class="p-2 rounded-xl text-slate-500 dark:text-slate-300 hover:bg-slate-200/50 dark:hover:bg-slate-700/50
					hidden md:flex items-center justify-center "	
				>
					<span class="material-symbols-rounded">
						settings
					</span>
				</button>
				
				<!-- User profile -->
				<div class="hidden md:flex items-center border-l border-slate-300 dark:border-slate-700 space-x-3 pl-3">
                      <img 
                      	alt="avatar" 
                      	src="${pageContext.request.contextPath}/assets/images/avatars/avatar.jpg"
                      	class="w-10 h-10 rounded-full object-cover ring-2 ring-blue-500"
                      >
                      <span class="arrow material-symbols-rounded text-md text-slate-500 dark:text-slate-300 
								transform transition-all duration-200">
							keyboard_arrow_down
					  </span>
                </div>
			</div>
		</div>
	</div>
</body>
</html>