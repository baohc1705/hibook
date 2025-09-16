let activeFilters = [];

$(document).ready(function() {
	let sortBy = 'createDate';
	let sortOrder = 'DESC';
	console.log("JS đã load!");
	loadFilter(1, 8, sortBy, sortOrder);

	$(".category").on("change", function() {
		$(".category").not(this).prop("checked", false);

	});

	$(".author").on("change", function() {
		$(".author").not(this).prop("checked", false);

	});

	$(".price").on("change", function() {
		$(".price").not(this).prop("checked", false);

	});

	$(".category, .author, .price").on("change", function() {
		let filterId = $(this).attr("id");

		if ($(this).is(":checked")) {
			// Nếu chưa có thì thêm vào mảng
			if ($.inArray(filterId, activeFilters) === -1) {
				activeFilters.push(filterId);
			}
		} else {
			// Nếu bỏ check thì xóa khỏi mảng
			activeFilters = $.grep(activeFilters, function(value) {
				return value !== filterId;
			});
		}

		loadFilter(1, 8, sortBy, sortOrder);
	});

	$(document).on("click", ".clear-filter", function() {
		$(".category, .author, .price").prop("checked", false);
		activeFilters = [];

		$("#all-categories").closest("li").nextAll("li").remove();

		$("#category").val('');
		
		loadFilter(1, 8, sortBy, sortOrder);
	});

	$(document).on('click', '.quick-sort-link', function() {
		$(".quick-sort-link").removeClass('active');
		$(this).addClass('active');
		sortBy = $(this).data('sort-by');
		sortOrder = $(this).data('sort-order');
		loadFilter(1, 8, sortBy, sortOrder);
	});

	$(document).on('click', '#all-categories', function() {

		$(".category").prop("checked", false);

		activeFilters = [];
		//Xóa breadcrumb item phía sau "Tất cả danh mục"
		
		$("#all-categories").closest("li").nextAll("li").remove();
		
		$("#category").val('');

		renderFilterList();

		loadFilter(1, 8, sortBy, sortOrder);
	});
});

function loadFilter(page, pageSize, sortBy, sortOrder) {
	let txtCategory = $("#category").val() || null;

	let category = parseInt(txtCategory);

	if (txtCategory) {
		$.each($(".category"), function(i, item) {
			if ($(item).data('id') == category) {
				$(item).prop("checked", true);

				let filterId = $(item).attr("id");
				if ($.inArray(filterId, activeFilters) === -1) {
					activeFilters.push(filterId);
				}
			}
		});
		// Xóa dữ liệu để chỉ dùng 1 lần
		$("#category").val('');
	}
	let txtcateBookId = $(".category:checked").data("id") || null;
	let txtauthorId = $(".author:checked").data("id") || null;
	let txtMinPrice = $(".price:checked").data("min-price") || null;
	let txtMaxPrice = $(".price:checked").data("max-price") || null;
	let txtsortBy = sortBy || null;
	let txtsortOrder = sortOrder || null;

	renderFilterList();

	$.ajax({
		url: "/hibook/books/category",
		type: "GET",
		data: {
			action: "filter",
			cateBookId: txtcateBookId,
			authorId: txtauthorId,
			minPrice: txtMinPrice,
			maxPrice: txtMaxPrice,
			page: page,
			pageSize: pageSize,
			sortBy: txtsortBy,
			sortOrder: txtsortOrder
		},
		success: function(res) {
			$(".wrapper-book-filter").html(res);
			$("#pagination").empty();
			let currentPagetxt = $("#currentPage").val();
			let totalPagestxt = $("#totalPages").val();
			let paginationStr = $("#paginationData").text().trim();
			let pagination = [];
			if (paginationStr) {
				try {
					pagination = JSON.parse(paginationStr);
				} catch (e) {
					console.error("Parse pagination JSON fail:", paginationStr, e);
				}
			}

			let currentPage = parseInt(currentPagetxt);
			let totalPages = parseInt(totalPagestxt);

			// Prev
			if (currentPage > 1) {
				let html = `
                   <span onclick="loadFilter(${currentPage - 1}, ${pageSize}, '${sortBy}', '${sortOrder}')"
                         class='material-symbols-rounded'>
                         keyboard_arrow_left
                   </span>
			    `;
				$("#pagination").append(html);
			}

			// Pages
			$.each(pagination, function(i, p) {
				if (p === "...") {
					$("#pagination").append("<span> ... </span>");
				} else {
					if (parseInt(p) === currentPage) {
						let html = `<span class='active'>${p}</span>`;
						$("#pagination").append(html);
					} else {
						let html = `
                           <span onclick="loadFilter(${p}, ${pageSize}, '${sortBy}', '${sortOrder}')">
                               ${p}
                           </span>
                       	`;
						$("#pagination").append(html);
					}
				}
			});

			// Next
			if (currentPage < totalPages) {
				let html = `
                   <span onclick="loadFilter(${currentPage + 1}, ${pageSize}, '${sortBy}', '${sortOrder}')"
                         class="material-symbols-rounded">
                         keyboard_arrow_right
                   </span>
               	`;
				$("#pagination").append(html);
			}

			if (totalPages <= 1) {
				$("#pagination").addClass('d-none');
			}
		},
		error: function() {
			alert("KHÔNG THỂ KẾT NỐI ĐẾN SERVER");
		},
	});
}

function renderFilterList() {
	let listFilter = $(".list-filter");
	listFilter.empty();
	let hasFilter = false;
	listFilter.append(`<li class='list-group-item me-2 fs-base'>Lọc theo:</li>`);
	$.each(activeFilters, function(index, filterId) {
		let $input = $("#" + filterId);

		if ($input.is(":checked")) {
			let label = $input.next("label").text();
			listFilter.append("<li class='filter-text'>" + label + "</li>");
			hasFilter = true;
		}
	});

	if (hasFilter) {

		listFilter.append('<li class="filter-text clear-filter" style="cursor:pointer;color:red">Xóa bộ lọc</li>');
		listFilter.removeClass("d-none").addClass("mb-3");
	} else {
		listFilter.addClass("d-none").removeClass("mb-3");
	}
}
