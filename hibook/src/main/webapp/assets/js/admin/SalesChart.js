// Dữ liệu biểu đồ
const pieData = [
	{ name: "Manga", value: 45, color: "oklch(70.5% 0.213 47.604)" },
	{ name: "Tin học", value: 30, color: "oklch(54.1% 0.281 293.009)" },
	{ name: "Tiểu thuyết", value: 15, color: "oklch(69.6% 0.17 162.48)" },
	{ name: "Khác", value: 10, color: "oklch(62.3% 0.214 259.815)" }
];

// Khởi tạo biểu đồ tròn
const pieCtx = document.getElementById('salesChart');
if (pieCtx) {
	const isDarkMode = document.documentElement.classList.contains('dark');
	const textColor = isDarkMode ? '#94a3b8' : '#64748b';

	const salesChart = new Chart(pieCtx, {
		type: 'doughnut',
		data: {
			labels: pieData.map(item => item.name),
			datasets: [{
				data: pieData.map(item => item.value),
				backgroundColor: pieData.map(item => item.color),
				borderWidth: 0,
				borderRadius: 4,
				spacing: 5,
				hoverOffset: 8
			}]
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			cutout: '60%',
			plugins: {
				legend: {
					display: false
				},
				tooltip: {
					backgroundColor: isDarkMode ? 'rgba(15, 23, 42, 0.95)' : 'rgba(255, 255, 255, 0.95)',
					titleColor: isDarkMode ? '#f1f5f9' : '#1e293b',
					bodyColor: isDarkMode ? '#cbd5e1' : '#475569',
					borderColor: isDarkMode ? 'rgba(51, 65, 85, 0.5)' : 'rgba(226, 232, 240, 0.5)',
					borderWidth: 1,
					cornerRadius: 12,
					boxPadding: 6,
					usePointStyle: true,
					callbacks: {
						label: function(context) {
							return `${context.label}: ${context.parsed}%`;
						}
					}
				}
			}
		}
	});
}

// Tạo HTML cho legend
const legendContainer = document.createElement('div');
legendContainer.className = 'space-y-3';
legendContainer.innerHTML = pieData.map((item, index) => `
    <div class="flex items-center justify-between">
        <div class="flex items-center space-x-3">
            <div class="w-3 h-3 rounded-full" style="background-color: ${item.color}"></div>
            <span class="text-sm text-slate-600 dark:text-slate-400">${item.name}</span>
        </div>
        <div class="text-sm font-semibold text-slate-800 dark:text-white">${item.value}%</div>
    </div>
`).join('');

const pie = document.getElementById("pieChart-legend");
pie.append(legendContainer);