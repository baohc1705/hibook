
$(document).ready(function() {
	
	$(document).on('click', '.btn-submenu', function() {
		let submenu = $(this).next("div");
		let arrowDown = $(this).find(".arrow");

		if (submenu.hasClass("hidden")) {
			submenu.removeClass("hidden").hide().slideDown(200);
			if (!$('#menuItem').hasClass('w-72')) {
				$('#menuItem').addClass('w-72');
				$('.toggleMenu').toggleClass('hidden');
			}
		} else {
			submenu.slideUp(200, function() {
				submenu.addClass("hidden");
			});
		}
		arrowDown.toggleClass('rotate-180');

	});
	$(document).on('click', '.btnSubmenu', function() {
			let submenu = $(this).next("div");
			let arrowDown = $(this).find(".arrowToggle");

			if (submenu.hasClass("hidden")) {
				submenu.removeClass("hidden").hide().slideDown(200);
			} else {
				submenu.slideUp(200, function() {
					submenu.addClass("hidden");
				});
			}
			arrowDown.toggleClass('rotate-180');

	});

	$(document).on('click', '.btn-menu-item', function() {
		$('.btn-menu-item').removeClass('bg-gradient-to-r from-violet-600 via-pink-500 to-orange-500 text-white');
		$(this).addClass('bg-gradient-to-r from-violet-600 via-pink-500 to-orange-500 text-white');
	});

	$(document).on('click', '#btn-toggle-menu', function() {
		let menu = $('#menuItem');

		if (menu.hasClass('w-72')) {
			menu.removeClass('w-72').addClass('w-20');

			$('.submenu').each(function() {
				if (!$(this).hasClass('hidden')) {
					$(this).slideUp(200, function() {
						$(this).addClass("hidden");
					});
				}
			});
		} else {
			menu.addClass('w-72').removeClass('w-20');
		}

		$('.toggleMenu').toggleClass('hidden');
		$(this).find('#btn-toggle-icon').toggleClass('rotate-180');
	});

	let theme = localStorage.getItem("theme") || "light";

	// Set initial theme
	$("html").toggleClass("dark", theme === "dark");
	setButtonIcon(theme);

	// Toggle on click
	$(document).on("click", "#btn-toggle-darkmode", function () {
	    if (theme === "light") {
	        theme = "dark";
	        $("html").addClass("dark");
	    } else {
	        theme = "light";
	        $("html").removeClass("dark");
	    }
	    setButtonIcon(theme);
	    localStorage.setItem("theme", theme);
	});

	// Hàm cập nhật icon
	function setButtonIcon(theme) {
	    if (theme === "dark") {
	        $('#btn-toggle-darkmode').html(`
	            <span class="material-symbols-rounded">mode_night</span>
	        `);
	    } else {
	        $('#btn-toggle-darkmode').html(`
	            <span class="material-symbols-rounded">sunny</span>
	        `);
	    }
	}
});
