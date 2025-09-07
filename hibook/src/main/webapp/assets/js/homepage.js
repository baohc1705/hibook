$(document).ready(function() {

	let currentPage = 1;
	let hasLoadMore = true;
	let isLoading = false;
	// load book trend
	loadMore();

	$("#btn-loadmore").on("click", loadMore);

	/*	window.addEventListener("scroll", () => {
			if (isLoading || !hasLoadMore) return;
	
			let booksTrend = document.getElementById("books-trend");
			if (!booksTrend) return;
	
			let rect = booksTrend.getBoundingClientRect();
			if (rect.bottom <= window.innerHeight + 200) {
				loadMore();
			}
		});*/

	function loadMore() {
		$("#loader").show();
		if (!hasLoadMore) return;
		isLoading = true;
		$.ajax({
			url: "/hibook/books",
			method: "GET",
			data: { page: currentPage },
			dataType: "json",
			success: function(res) {
				console.log("Kiểu:", typeof res);
				console.log(res.books);
				console.log(res.mapCoverPhoto);
				$.each(res.books, function(i, book) {
					let cover = res.mapCoverPhoto[book.id];
					console.log("Book:", book);
					console.log("Book name:", book.name);
					console.log("Book price:", book.price);
					console.log("Book amount:", book.amount);
					console.log("Book cover:", cover);

					// Kiểm tra và xử lý book.name
					let bookName = book.name || 'Tên sách không có';
					let bookPrice = book.price || '0';
					let bookPriceFMT = bookPrice.toLocaleString("vi-VN") + " đ";
					let bookAmount = book.amount || '0';
					let coverImage = cover || 'default-cover.jpg';

					let bookHtml = `
		                        <div class="col-md-3 p-3">
		                            <div class="item px-2 py-4">
									<form action="/hibook/cart" method="post" class="add-to-cart-form"> 
										<input  type="hidden" name="action" value="add">
										<input  type="hidden" name="bookId" value="${book.id}">
										<input  type="hidden" name="quantity" value="1">
		                                <!-- photo book -->
		                                <div  class="view-book text-center mb-3" data-id="${book.id}" style="height: 210px;">
		                                    <img src="/hibook/assets/images/books/${coverImage}" alt="${bookName}" class="img-fluid object-fit-contain" style="height: 210px;">
		                                </div>

		                                <!-- title -->
		                                <p class="lh-base truncate-muitiline" style="height: 3rem;">${bookName}</p>

		                                <!-- price & coupon -->
		                                <div class="price-coupon d-flex align-items-center">
		                                    <div class="price me-3">
		                                        <p class="text-danger fw-bold fs-5 m-0">${bookPriceFMT}</p> 
		                                        <del class="small mute">${bookPriceFMT}</del>
		                                    </div>
		                                    <span class="p-1 bg_dark-blue-800 text-center text_dark-blue-50 rounded-2 small">-10%</span>
		                                </div>

		                                <!-- rate & cart -->
		                                <div class="rate-quantity d-flex align-items-center justify-content-between">
		                                    <div class="rate d-flex align-items-center">
		                                        <i class="fa-solid fa-star text-warning"></i>
		                                        <span class="small text_gray-100">4.7</span>
		                                        <p class="small text_gray-100 m-0 ms-2">Chỉ còn: 
		                                            <span class="text_dark-blue-800">${bookAmount}</span>
		                                        </p>
		                                    </div>
		                                    <button type="submit" class="btn_add-to-cart btn bg_dark-blue-800" data-bookid="${book.id}" data-quantity="1">
		                                        <span>
													<i class="fa-solid fa-cart-shopping text_dark-blue-50"></i>
		                                        </span>
		                                    </button>
		                                </div>
									</form>              
		                            </div>
		                        </div>
		                    `;

					$("#books-trend").append(bookHtml);
				});

				/* Update current page */
				currentPage++;
				hasLoadMore = res.hasMore;

				// Ẩn nút load more nếu không còn dữ liệu
				if (!hasLoadMore) {
					$("#btn-loadmore").hide();
				}

				$("#loader").hide();

			},
			error: function(xhr, status, error) {
				console.log("Can't connect to server");
				console.log("Status:", status);
				console.log("Error:", error);
				console.log("Response:", xhr.responseText);
			},
			complete: function() {
				$("#loader").hide();
				isLoading = false;
			}
		});
	}

	$(document).on("click", ".view-book", function() {
		let bookId = $(this).data("id");
		window.location.href = "/hibook/books/view?bookId=" + bookId;
	});

	$(document).on("click", ".btn_add-to-cart", function(e) {
		e.preventDefault();

		let txtBookId = $(this).data("bookid");
		let txtQuantity = $(this).data("quantity");
		$.ajax({
			url: "/hibook/cart",
			method: "POST",
			data: {
				action: "add",
				bookId: txtBookId,
				quantity: txtQuantity
			},
			dataType: "json",
			success: function(res) {
				$("#total-quantity").text(res.itemCount).removeClass("d-none");;

				console.log("item count: " + res.itemCount);

				if (res.status === "success") {
					Swal.fire({
						icon: "success",
						title: "Thành công!",
						text: res.message,
						confirmButtonText: "Tiếp tục mua hàng"
					});
				}
				else {
					Swal.fire({
						icon: "error",
						title: "Thất bại",
						text: res.message
					});
				}
			},
			error: function() {
				console.log("Cant connect to server Cart");
			}
		});
	});

	$(".btn-minus").on("click", function() {
		var nQuantity = parseInt($("#quantity_" + $(this).data("id")).val(), 10);
		nQuantity = nQuantity - 1;
		if (nQuantity == 0) {
			$(".btn-remove").click();
		}
		else {
			$("#quantity_" + $(this).data("id")).attr("value", nQuantity);
			$("#button_" + $(this).data("id")).click();
		}

	});

	$(".btn-plus").on("click", function() {
		var nQuantity = parseInt($("#quantity_" + $(this).data("id")).val(), 10);
		nQuantity = nQuantity + 1;
		var nAmount = parseInt($(this).data("bookamount"), 10);
		if (nQuantity >= nAmount || nQuantity > 999) {
			Swal.fire({
				title: "Quá số lượng!",
				text: "Bạn chọn số lượng quá giới hạn số lượng của sản phẩm."
					+ " Chỉ còn: " + nAmount + " quyển sách.",
				icon: "warning",
				confirmButtonText: "Tiếp tục."
			});
		}
		else {
			$("#quantity_" + $(this).data("id")).attr("value", nQuantity);
			$("#button_" + $(this).data("id")).click();
		}

	});

	$(".btn-remove").on("click", function(e) {
		e.preventDefault();
		let form = $(this).closest(".form-remove");
		Swal.fire({
			title: "Bạn có chắc muốn xóa?",
			text: "Bạn sẽ không khôi phục lại được!",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#3085d6",
			cancelButtonColor: "#d33",
			confirmButtonText: "Vâng, xóa đi!",
			cancelButtonText: "Không, giữ lại"
		}).then((result) => {
			if (result.isConfirmed) {
				form.submit(); // submit form bình thường
			}
		});


	});
});