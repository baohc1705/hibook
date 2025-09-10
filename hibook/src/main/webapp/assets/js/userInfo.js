$(document).ready(function() {
	
	// Single Page Application Basic Logic
	$(".menu-item").on("click", function() {
		$(".menu-item").removeClass("active");
		$(this).addClass("active");
		let page = $(this).data("page");
		if (page === "") {
			console.log("PAGE NOT FOUND");
			return;
		}

		$.ajax({
			url: "/hibook/user-infomation",
			method: "GET",
			data: { page: page },
			success: function(res) {
				$("#main-content").html(res);
			},
			error: function(xhr, status, error) {
				console.error("AJAX error:", status, error);
				console.error("Response text:", xhr.responseText);
				Swal.fire("Lỗi", "Không thể kết nối đến server verify", "error");
			}
		});
	});
});
const sidebar = document.querySelector(".sidebar");
toggleSubmenu = (button) => {
	button.nextElementSibling.classList.toggle('show');
	button.classList.toggle('rotate');
}

function closeAllSubMenus(){
  Array.from(sidebar.getElementsByClassName('show')).forEach(ul => {
    ul.classList.remove('show')
    ul.previousElementSibling.classList.remove('rotate')
  })
}

document.querySelectorAll(".sidebar-menu > li.menu-item").forEach(item => {
    item.addEventListener("click", () => {
        closeAllSubMenus();
    });
});