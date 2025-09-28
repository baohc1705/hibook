
// Đợi DOM load xong
document.addEventListener('DOMContentLoaded', function() {
	// Dữ liệu biểu đồ
	const data = [
		{ month: "Jan", revenue: 45000, expenses: 32000 },
		{ month: "Feb", revenue: 52000, expenses: 34000 },
		{ month: "Mar", revenue: 48000, expenses: 34000 },
		{ month: "Apr", revenue: 61000, expenses: 23000 },
		{ month: "May", revenue: 55000, expenses: 65000 },
		{ month: "Jun", revenue: 67000, expenses: 12000 },
		{ month: "Jul", revenue: 72000, expenses: 25000 },
		{ month: "Aug", revenue: 69000, expenses: 44000 },
		{ month: "Sep", revenue: 78000, expenses: 76000 },
		{ month: "Oct", revenue: 74000, expenses: 34000 },
		{ month: "Nov", revenue: 82000, expenses: 64000 },
		{ month: "Dec", revenue: 41000, expenses: 56000 },
	];

	// Khởi tạo biểu đồ
	const ctx = document.getElementById('revenueChart');

	if (!ctx) {
		console.error('Canvas element with id "revenueChart" not found');
		return;
	}

	// Kiểm tra chế độ tối
	const isDarkMode = document.documentElement.classList.contains('dark');

	// Màu sắc cho chế độ sáng/tối
	const gridColor = isDarkMode ? 'rgba(100, 116, 139, 0.3)' : 'rgba(226, 232, 240, 0.3)';
	const textColor = isDarkMode ? '#94a3b8' : '#64748b';

	// Tạo gradient
	const revenueGradient = createGradient(ctx, ['#f97316', '#7c3aed']); // violet-600 to orange-500
	const expensesGradient = createGradient(ctx, ['#64748b', '#f1f5f9']); // slate-500 to slate-100
	const revenueChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: data.map(item => item.month),
			datasets: [
				{
					label: 'Thu',
					data: data.map(item => item.revenue),
					backgroundColor: revenueGradient,
					borderRadius: 4,
					barPercentage: 0.8,
				},
				{
					label: 'Chi',
					data: data.map(item => item.expenses),
					backgroundColor: expensesGradient,
					borderRadius: 4,
					barPercentage: 0.8,
				}
			]
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			plugins: {
				legend: {
					display: false,
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
							let label = context.dataset.label || '';
							if (label) {
								label += ': ';
							}
							if (context.parsed.y !== null) {
								label += new Intl.NumberFormat('vi-VN', {
									style: 'currency',
									currency: 'VND'
								}).format(context.parsed.y);
							}
							return label;
						}
					}
				}
			},
			scales: {
				x: {
					grid: {
						display: false,
						drawBorder: false,
					},
					ticks: {
						color: textColor,
						font: {
							size: 12
						}
					}
				},
				y: {
					grid: {
						color: gridColor,
						drawBorder: false,
					},
					ticks: {
						color: textColor,
						font: {
							size: 12
						},
						callback: function(value) {
							return (value / 1000) + 'k';
						}
					}
				}
			}
		}
	});

	// Hàm tạo gradient
	function createGradient(ctx, colorStops) {
		const gradient = ctx.getContext('2d').createLinearGradient(0, 0, 0, 400);
		gradient.addColorStop(0, colorStops[0]);
		gradient.addColorStop(1, colorStops[1]);
		return gradient;
	}
});
