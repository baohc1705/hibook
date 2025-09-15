$(document).ready(function() {

	loadFilter(1,8);

	$(".category").on("change", function() {
		$(".category").not(this).prop("checked", false);
		loadFilter(1,8);
	});

	$(".author").on("change", function() {
		$(".author").not(this).prop("checked", false);
		loadFilter(1,8);
	});

	$(".price").on("change", function() {
		$(".price").not(this).prop("checked", false);
		loadFilter(1,8);
	});

	$(document).on("click", ".clear-filter", function() {
		$(".category, .author, .price").prop("checked", false);
		loadFilter(1,8);
	});
});

function loadFilter(page, pageSize) {
		let txtcateBookId = $(".category:checked").data("id") || null;
		let txtauthorId = $(".author:checked").data("id") || null;
		let txtMinPrice = $(".price:checked").data("min-price") || null;
		let txtMaxPrice = $(".price:checked").data("max-price") || null;

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
				pageSize: pageSize
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

				if (currentPage > 1) {
					$("#pagination").append(
						"<a href='#' class='p-2 border border-danger' onclick='loadFilter(" + (currentPage - 1) + ",8)'>Prev</a>"
					);
				} else {
					$("#pagination").append("<span class='p-2 border border-danger text-muted'>Prev</span>");
				}

				$.each(pagination, function(i, p) {
					if (p === "...") {
						$("#pagination").append("<span class='p-2 border border-danger'> ... </span>");
					} else {
						if (parseInt(p) === currentPage) {
							$("#pagination").append("<b class='p-2 border border-danger'>" + p + "</b>");
						} else {
							$("#pagination").append("<a href='#' class='p-2 border border-danger' onclick='loadFilter(" + p + ",8)'>" + p + "</a>");
						}
					}
				});

				if (currentPage < totalPages) {
					$("#pagination").append(
						"<a href='#' class='p-2 border border-danger' onclick='loadFilter(" + (currentPage + 1) + ",8)'>Next</a>"
					);
				} else {
					$("#pagination").append("<span class='p-2 border border-danger text-muted'>Next</span>");
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

		let cateName = $(".category:checked").next("label").text();
		if (cateName) {
			listFilter.append(`<li>${cateName}</li>`);
			hasFilter = true;
		}

		let authorName = $(".author:checked").next("label").text();
		if (authorName) {
			listFilter.append(`<li>${authorName}</li>`);
			hasFilter = true;
		}

		let priceName = $(".price:checked").next("label").text();
		if (priceName) {
			listFilter.append(`<li>${priceName}</li>`);
			hasFilter = true;
		}

		if (hasFilter) {
			listFilter.append(`<li class="clear-filter" style="cursor:pointer;color:red">Xóa bộ lọc</li>`);
			listFilter.removeClass('d-none');
		}
	}
