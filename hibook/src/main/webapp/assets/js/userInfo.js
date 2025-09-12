$(document).ready(function() {
	
	// Single Page Application Basic Logic
	$(".menu-item").on("click", function() {
		
		//$(".loader").removeClass("d-none");
		$(".menu-item").removeClass("active");
		$(this).addClass("active");
		let page = $(this).data("page");
		if (page === "") {
			console.log("PAGE NOT FOUND");
			return;
		}
		
		let loaderTimeout = setTimeout(() => {
		        $("#main-content").html(`
		            <div class="d-flex justify-content-center align-items-center" style="min-height:300px;">
		                <span class="loader"></span>
		            </div>
		        `);
		}, 150); // chỉ show loader nếu request lâu hơn 150ms
		
		$.ajax({
			url: "/hibook/user-information",
			method: "GET",
			data: { page: page },
			success: function(res) {
				clearTimeout(loaderTimeout);
				$("#main-content").html(res);
			},
			error: function(xhr, status, error) {
				clearTimeout(loaderTimeout);
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