$(document).ready(function() {

	let currentPage = 1;
	let currentPageFlashSale = 1;
	let currentPageSpecialOffer = 1;
	let hasLoadMore = true;
	let isLoading = false;
	// load book trend
	loadMore();

	$("#btn-loadmore").on("click", loadMore);

	loadFlashSale();
	loadSpecialOffer();

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
			url: "/hibook/books?action=new-trend",
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
		                                    <img src="/hibook/assets/images/books/${coverImage}" alt="${bookName}" 
											class="img-fluid object-fit-contain" 
											style="height: 210px;">
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

	function loadFlashSale() {
		$.ajax({
			url: "/hibook/books?action=flash-sale",
			method: "GET",
			dataType: "JSON",
			data: {
				page: currentPageFlashSale
			},
			success: function(res) {
				console.log("FLASH SALE: " + res.books);
				$.each(res.books, function(i, book) {
					let cover = res.mapCoverPhoto[book.id];
					let bookName = book.name || 'Tên sách không có';
					let bookPrice = book.price || '0';
					let bookPriceFMT = bookPrice.toLocaleString("vi-VN") + " đ";
					let bookAmount = book.amount || '0';
					let coverImage = cover || 'default-cover.jpg';
					let percentAmonunt = bookAmount / 200 * 100;
					let bookHTML =
						`<div class="col-md-3 p-3">
		                   <div class="card h-100 rounded-4 shadow-sm bg_dark-blue-50">
		                        <!-- Image  -->
		                        <div class="view-book text-center mt-3" data-id="${book.id}">
		                            <img src="/hibook/assets/images/books/${cover}" 
									class="img-fluid object-fit-contain" 
									alt="${cover}"
									style="height: 210px;">
		                        </div>
		
		                        <!-- Card Body -->
		                        <div class="card-body pt-2 pb-3 px-3">
		                            <p class="truncate-muitiline" style="height: 3rem;">${bookName}</p> 
		
		                            <div class="d-flex align-items-center mb-1">
		                                <span class="fw-bold text-danger me-2">${bookPriceFMT}</span>
		                                <span class="badge bg-danger">-10%</span>
		                            </div>
		
		                            <del class="text-muted small">${bookPriceFMT}</del>
		
		                            <div class="progress mt-3" role="progressbar" aria-label="shortage" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
		                                <div class="progress-bar bg_dark-blue-800" style="width: ${percentAmonunt + 10}%;">${bookAmount}</div>
		                            </div>
		                        </div>
		                    </div>
						 </div>`;
					$(".books-flash-sale").append(bookHTML);
				});
				
				currentPageFlashSale++;
			},
			error: function() {
				console.log("Cant connect to getBook Server");
			}

		});
	}

	function loadSpecialOffer() {
		$.ajax({
			url: "/hibook/books?action=special-offer",
			method: "GET",
			dataType: "JSON",
			data: {
				page: currentPageSpecialOffer
			},
			success: function(res) {
				console.log("SPECIAL OFFER: " + res.books);
				$.each(res.books, function(i, book) {
					let cover = res.mapCoverPhoto[book.id];
					let bookName = book.name || 'Tên sách không có';
					let bookPrice = book.price || '0';
					let bookPriceFMT = bookPrice.toLocaleString("vi-VN") + " đ";
					let bookAmount = book.amount || '0';
					let coverImage = cover || 'default-cover.jpg';
					
					let bookHTML=
					`<div class="col-md-4">
		                <div class="card h-100 rounded-4 overflow-hidden">
		                      <!-- Coupon -->
		                    <div class="coupon bg-danger text_dark-blue-50 text-center" style="width: 200px; height: 30px;" >
		                        <p class="text-center p-0 m-0">Sale 10%</p>
		                    </div>
		                    
		                    <!-- Book Image -->
		                    <img src="/hibook/assets/images/books/${coverImage}" class="card-img-top object-fit-cover" style="height: 220px;" alt="Hoàng hôn màu đỏ">
		
		                    <!-- Card Body -->
		                    <div class="card-body d-flex flex-column justify-content-between">
		                        <!-- Title -->
		                        <h5 class="card-title fw-bold mb-2">${bookName}</h5>
		
		                        <!-- Tags -->
		                        <ul class="md-2 d-flex p-0">
		                            <li class="list-group-item"><a href="" class="nav-link badge rounded-pill text-primary border border-primary me-1">Tiểu thuyết</a></li>
		                            <li class="list-group-item"><a href="" class="nav-link badge rounded-pill text-success border border-success">Truyện ngắn</a></li>
		                        </ul>
		
		                        <!-- Description -->
		                        <p class="card-text-description text-secondary small" style="height:6rem;">
		                        	${book.description}
		                        </p>
		
		                        <!-- Author -->
		                        <a href="" class="nav-link text_dark-blue-950 fw-semibold mb-3">${book.author.fullname}</a>
		
		                        <!-- Price & Add to cart -->
		                        <div class="d-flex justify-content-between align-items-center mt-auto">
		                             <button type="button" 
											 class="btn_add-to-cart button-fill rounded-3 d-flex align-items-center" 
											 data-bookid="${book.id}"
											 data-quantity="1">
		                               <span>
		                                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
		                                    <path d="M9.5 19C9.5 19.8284 8.82843 20.5 8 20.5C7.17157 20.5 6.5 19.8284 6.5 19C6.5 18.1716 7.17157 17.5 8 17.5C8.82843 17.5 9.5 18.1716 9.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		                                    <path d="M17.5 19C17.5 19.8284 16.8284 20.5 16 20.5C15.1716 20.5 14.5 19.8284 14.5 19C14.5 18.1716 15.1716 17.5 16 17.5C16.8284 17.5 17.5 18.1716 17.5 19Z" stroke="var(--dark-blue-50)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		                                    <path d="M3 2.75C2.58579 2.75 2.25 3.08579 2.25 3.5C2.25 3.91421 2.58579 4.25 3 4.25V2.75ZM18.459 13.3703L17.7918 13.0277L18.459 13.3703ZM8 6.25H17.5873V4.75H8V6.25ZM19.5889 9.52771L17.7918 13.0277L19.1262 13.7128L20.9233 10.2128L19.5889 9.52771ZM15.7903 14.25H8V15.75H15.7903V14.25ZM5.75 12V11.5H4.25V12H5.75ZM5.75 11.5V8.5H4.25V11.5H5.75ZM5.75 11.5V5.5H4.25V11.5H5.75ZM8 14.25C6.75736 14.25 5.75 13.2426 5.75 12H4.25C4.25 14.0711 5.92893 15.75 8 15.75V14.25ZM17.7918 13.0277C17.4065 13.7781 16.6338 14.25 15.7903 14.25V15.75C17.1962 15.75 18.484 14.9636 19.1262 13.7128L17.7918 13.0277ZM17.5873 6.25C19.2705 6.25 20.3577 8.0304 19.5889 9.52771L20.9233 10.2128C22.2046 7.71733 20.3926 4.75 17.5873 4.75V6.25ZM5.75 5.5C5.75 3.98122 4.51878 2.75 3 2.75V4.25C3.69036 4.25 4.25 4.80964 4.25 5.5H5.75ZM8 4.75C5.92893 4.75 4.25 6.42893 4.25 8.5H5.75C5.75 7.25736 6.75736 6.25 8 6.25V4.75Z" fill="var(--dark-blue-50)"></path>
		                                    </svg>
		                               </span>
		                                 Thêm vào giỏ hàng
		                            </button>
		                            <div class="text-end">
		                                <div class="fw-bold fs-5 text-dark">${bookPriceFMT}</div>
		                                <del class="text-muted">${bookPriceFMT}</del>
		                            </div>
		                        </div>
		                    </div>
		                </div>
					</div>`;
					
					$(".special-books").append(bookHTML);
					
					currentPageSpecialOffer++;
				});
			},
			error: function() {
				console.log("Cant connect to server get special offer");
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
			let btnRemove = $("#btn-remove-" + $(this).data("id"));
			btnRemove.click();
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