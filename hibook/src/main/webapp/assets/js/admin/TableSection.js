document.addEventListener('DOMContentLoaded', function() {

	const getStatusColor = (status) => {
		switch (status) {
			case "completed":
				return "bg-emerald-100 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400";
			case "pending":
				return "bg-yellow-100 text-yellow-700 dark:bg-yellow-900/30 dark:text-yellow-400";
			case "cancelled":
				return "bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400";
			default:
				return "bg-slate-100 text-slate-700 dark:bg-slate-800 dark:text-slate-400"
		}
	}

	const recentOrders = [
		{
			id: "#1001",
			customer: "Mike Wilson",
			product: "AirPods Pro",
			amount: "1",
			status: "completed",
			date: "2024-01-14",
		},
		{
			id: "#1002",
			customer: "Brian Bennet",
			product: "Iphone 17 Pro",
			amount: "2",
			status: "pending",
			date: "2024-01-14",
		},
		{
			id: "#1003",
			customer: "Alice",
			product: "Ipad",
			amount: "1",
			status: "cancelled",
			date: "2024-01-14",
		},
		{
			id: "#1004",
			customer: "Eris",
			product: "AirPods Pro",
			amount: "3",
			status: "completed",
			date: "2024-01-14",
		},
	];

	const topProducts = [
		{
			name: "AirPods Pro",
			sale: 3421,
			revenue: "$865,755",
			trend: "down",
			change: "-3%",
		},
		{
			name: "Ipad",
			sale: 4546,
			revenue: "$1251,45",
			trend: "up",
			change: "+12%",
		},
		{
			name: "Iphone 17 Pro",
			sale: 5901,
			revenue: "$3635,234",
			trend: "up",
			change: "+23%",
		},
		{
			name: "Iphone 18 Pro",
			sale: 3636,
			revenue: "$242,46",
			trend: "up",
			change: "+3%",
		},
	];

	recentOrders.map((order, index) => {
		let html = `
			<tr class='border-b border-slate-200/50 dark:border-slate-700/50 hover:bg-slate-50/50 
						dark:hover:bg-slate-800/50 transition-all duration-200'>
				<td class='p-4'>
					<span class='text-sm font-medium text-blue-500'>
						${order.id}
					</span>
				</td>
				<td class="p-4 truncate max-w-32 text-slate-800 dark:text-white">
                   <span class="text-sm ">
                       ${order.customer} haaaaaaaaaaaaaaaaaaaaaaaaaaaaahaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                   </span>
               	</td>
               <td class="p-4 max-w-48 text-slate-800 dark:text-white line-clamp-3 max-h-24">
                   <span class="text-sm text-slate-800 dark:text-white">
                       ${order.product} haaaaaaaa aaaaaa aaaaaaaaaaaaaaah aaaaaaaaaaa aaaaaaaaaa aaaaaaaaaaaa	
                   </span>
               </td>
               <td class="p-4 text-center">
                   <span class="text-sm text-slate-800 dark:text-white">
                       ${order.amount}
                   </span>
               </td>
               <td class="p-4">
                   <span 
                       class='font-medium text-xs px-3 py-1 rounded-full ${getStatusColor(order.status)}'
                   >
                       ${order.status}
                   </span>
               </td>
               <td class="p-4">
                   <span class="text-sm text-slate-800 dark:text-white">
                       ${order.date}
                   </span>
               </td>
               <td class="p-4">
				   <span class="material-symbols-rounded text-slate-500 dark:text-slate-300">
				   	more_vert
				   </span>
               </td>
			</tr>
		`;

		const table = document.getElementById('table-content');
		table.insertAdjacentHTML('beforeend', html);
	});

});