document.addEventListener('DOMContentLoaded', function() {
	const activites = [
		{
			id: 1,
			type: "users",
			icon: "account_circle",
			title: "New user registered",
			description: "Chi Bao created an account",
			time: "2 minutes ago",
			color: "text-blue-500",
			bgColor: "bg-blue-100 dark:bg-blue-900/30",
		},
		{
			id: 2,
			type: "order",
			icon: "order_approve",
			title: "New order received",
			description: "Order #3001 for $2,999",
			time: "5 minutes ago",
			color: "text-emerald-500",
			bgColor: "bg-emerald-100 dark:bg-emerald-900/30",
		},
		{
			id: 3,
			type: "payment",
			icon: "credit_card",
			title: "Payment processed",
			description: "Payment of $1,999 completed",
			time: "12 minutes ago",
			color: "text-purple-500",
			bgColor: "bg-purple-100 dark:bg-purple-900/30",
		},
		{
			id: 4,
			type: "system",
			icon: "settings",
			title: "System update",
			description: "Database backup completed",
			time: "1 hours ago",
			color: "text-orange-500",
			bgColor: "bg-orange-100 dark:bg-orange-900/30",
		},
		{
			id: 5,
			type: "notification",
			icon: "notifications",
			title: "Low stock alert",
			description: "Iphone 15 Pro stock is low",
			time: "2 hours ago",
			color: "text-red-500",
			bgColor: "bg-red-100 dark:bg-red-900/30",
		},

	];
	
	activites.map((activity) => {
		let html = `
			<div class='flex items-start space-x-4 p-3 rounded-xl hover:bg-slate-50
		                dark:hover:bg-slate-800/50 transition-colors'>
				<div class='p-2 rounded-lg ${activity.bgColor} flex items-center justify-center'>
					<span class='material-symbols-rounded ${activity.color}'>
						${activity.icon}
					</span>
                </div>
				<div class='flex-1 min-w-0'>
					<h4 class='text-sm font-bold text-slate-800 dark:text-white truncate'>
						${activity.title}
					</h4>	
					<p class="text-sm text-slate-600 dark:text-slate-400 truncate">
                        ${activity.description}
                    </p>
					<div class="flex items-center-safe space-x-1 mt-1">
						<span class="material-symbols-rounded text-xs! text-slate-500 dark:text-slate-300">
							alarm
						</span>
			            <span class="text-xs text-slate-500 dark:text-slate-400">
			                ${activity.time}
			            </span>
			        </div>
				</div>
			</div>
		`;
		
		const feed = document.getElementById('active-feed');
		feed.insertAdjacentHTML('beforeend', html);
	})
});