$(document).ready(function() {

	$("#btn-submit-book").on('click', function(e) {
		e.preventDefault();
		let name = $("#name").val().trim();
		let category = $("select[name='category']").val();
		let author = $("select[name='author']").val();
		let description = $("textarea[name='description']").val().trim();
		let price = $("#price").val().trim();
		let inventory = $("#inventory").val().trim();
		let promotion = $("select[name='promotion']").val();
		if (name === "" || category === null || author === null || price === "" || inventory === "") {
			Swal.fire({
				icon: "warning",
				title: "Thiếu thông tin!",
				text: "Vui lòng nhập đầy đủ các trường bắt buộc."
			});
			return;
		}

		$.ajax({
			url: '/hibook/admin/book?action=add',
			method: 'POST',
			dataType: 'JSON',
			data: {
				name: name,
				category: category,
				author: author,
				description: description,
				price: price,
				inventory: inventory,
				promotion: promotion,
			},
			success: function(res) {
				if (res.status === 'success') {
					let bookId = res.bookId;
					let formUpload = $('#formUpload')[0];
					let formData = new FormData(formUpload);
					formData.append('bookId', bookId);

					// Thêm ảnh vào db
					$.ajax({
						url: '/hibook/admin/upload/add-book',
						method: 'POST',
						dataType: 'JSON',
						data: formData,
						processData: false,
						contentType: false,
						success: function(resUpload) {
							if (resUpload.status === "success") {
								Swal.fire({
									icon: "success",
									title: "Thành công!",
									text: resUpload.message,
									confirmButtonText: "OK"
								});
							}
							else {
								Swal.fire({
									icon: "error",
									title: "Thất bại",
									text: resUpload.message
								});
							}
						},
						error: function() {
							Swal.fire({
								icon: "error",
								title: "Máy chủ bị lỗi",
								text: "Không thể kết nối đến UploadFile server!"
							});
						}

					});
				}
			},
			error: function() {
				Swal.fire({
					icon: "error",
					title: "Có lỗi xảy ra!",
					text: "Vui lòng thử lại."
				});

			}
		});
	});



	$("#btn-add-cover").on('click', function() {
		$('#uploadFile').click();
	});

	$("#uploadFile").on('change', function(e) {
		const file = e.target.files[0];
		if (!file) return;

		const render = new FileReader();
		render.onload = (e) => {
			if ($('#coverPhoto-preview').hasClass('hidden')) {
				$('#coverPhoto-preview').removeClass('hidden');
				$('#btn-add-cover').addClass('hidden');
				$('.label-cover-photo').removeClass('hidden');
			}
			$('#coverPhoto-preview').attr('src', e.target.result);
		};
		render.readAsDataURL(file);
	});

	$('#delete-cover-photo').on('click', function() {
		if ($('#btn-add-cover').hasClass('hidden')) {
			$('#coverPhoto-preview').addClass('hidden').attr('src', '');
			$('#btn-add-cover').removeClass('hidden');
			$('.label-cover-photo').addClass('hidden');
			$('#uploadFile').val('');
		}
	});

	$("#btn-add-photo").on('click', function() {
		$('#upload-multifile').click();
	});

	$("#upload-multifile").on('change', function(e) {
		const files = e.target.files;
		for (let i = 0; i < files.length; i++) {
			let file = files[i];
			let render = new FileReader();
			render.onload = (e) => {
				let html = `
	                <div class="relative rounded-xl border border-slate-200/50 dark:border-slate-700/50 
	                            flex items-center justify-center overflow-hidden group">
	                    <img 
	                        alt="book-photo" 
	                        src="${e.target.result}"
	                        class="object-contain h-24 w-full"
	                    >
	                    <!-- Nút xoá -->
	                    <div class="absolute top-2 right-2 p-1.5 bg-red-50 dark:bg-red-900/30 
	                                rounded-md cursor-pointer hidden group-hover:flex delete-photo">
	                        <span class="material-symbols-rounded text-red-500 text-sm">
	                            delete
	                        </span>
	                    </div>
	                </div>
	            `;
				$('#photo-preview').append(html);
			}
			render.readAsDataURL(file);
		}
	});

});