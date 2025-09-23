$(document).ready(function() {

	$("#btn-checkout").on("click", function(e) {
		e.preventDefault();

		// validate
		if (!validateCheckoutForm()) {
			return false; // nếu không hợp lệ thì dừng ở đây
		}

		var txtName = $("#name").val();
		var txtEmail = $("#email").val();
		var txtPhone = $("#phone").val();
		var txtCity = $("#city").val();
		var txtDistrict = $("#district").val();
		var txtWard = $("#ward").val();
		var txtShipAddress = $("#address").val();
		var txtDelivery = $("input[name='delivery']:checked").val();
		var txtTotalPrice = $("#totalPrice").val();
		var txtNote = $("#note").val().trim();
		var txtPayMethod = $("input[name='payMethod']:checked").val();

		if (!txtPayMethod) {
			Swal.fire({
				icon: "warning",
				title: "Thông báo",
				text: "Vui lòng chọn phương thức thanh toán!"
			});
			return;
		}
		$("#btn-checkout").empty();
		$("#btn-checkout").html(
			`<div class="loader-button d-flex justify-content-center align-items-center">
				 <div class="spinner-border" role="status">
				  	<span class="visually-hidden">Loading...</span>
				 </div>
				 <span class="ms-2">ĐANG HOÀN TẤT</span>
			 </div>
			 `
		);

		$.ajax({
			url: "/hibook/checkout?action=add",
			method: "POST",
			data: {
				name: txtName,
				email: txtEmail,
				phone: txtPhone,
				city: txtCity,
				district: txtDistrict,
				ward: txtWard,
				address: txtShipAddress,
				delivery: txtDelivery,
				totalPrice: txtTotalPrice,
				note: txtNote,
				payMethod: txtPayMethod
			},
			success: function(res) {
				if (res.status === "success") {
					Swal.fire({
						icon: "success",
						title: "Thành công!",
						text: res.message,
						confirmButtonText: "Tiếp tục"
					}).then(() => {
						window.location.href = "/hibook/cart";
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
				console.log("Không thể đến server /checkout")
			},
			complete: function() {
				$(".loader-button").addClass("d-none");
				$("#btn-checkout").html(`XÁC NHẬN THANH TOÁN`);
			}

		});
	});
	function validateCheckoutForm() {
		if (!checkFullName()) return false;
		if (!checkPhone()) return false;
		if (!checkEmail()) return false;
		if (!checkCity()) return false;
		if (!checkDistrict()) return false;
		if (!checkWard()) return false;
		if (!checkAddress()) return false;

		let delivery = $("input[name='delivery']:checked").val();
		let payMethod = $("input[name='payMethod']:checked").val();

		if ($("#checkOTP").length > 0) {
			let otp = $("#checkOTP").val().trim();
			if (otp === "") {
				$("#checkOTP").addClass("is-invalid").removeClass("is-valid");
				Swal.fire("Lỗi", "Vui lòng nhập mã OTP!", "warning");
				return false;
			} else {
				$("#checkOTP").removeClass("is-invalid").addClass("is-valid");
			}
		}

		if (!delivery) {
			Swal.fire("Lỗi", "Vui lòng chọn hình thức giao hàng!", "warning");
			return false;
		}
		if (!payMethod) {
			Swal.fire("Lỗi", "Vui lòng chọn phương thức thanh toán!", "warning");
			return false;
		}
		return true; // tất cả hợp lệ
	}


	checkFullName = () => {
		let name = $("#name").val().trim();
		if (name === "") {
			$("#name").addClass("is-invalid").removeClass("is-valid");
			return false;
		}
		$("#name").removeClass("is-invalid").addClass("is-valid");
		return true;
	};

	checkEmail = () => {
		let email = $("#email").val().trim();
		let regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		if (email === "" || !regex.test(email)) {
			$("#email").addClass("is-invalid").removeClass("is-valid");
			return false;
		}
		$("#email").removeClass("is-invalid").addClass("is-valid");
		return true;
	};

	checkPhone = () => {
		let phone = $("#phone").val().trim();
		let regex = /^(0[0-9]{9,10})$/;
		if (phone === "" || !regex.test(phone)) {
			$("#phone").addClass("is-invalid").removeClass("is-valid");
			return false;
		}
		$("#phone").removeClass("is-invalid").addClass("is-valid");
		return true;
	};

	checkCity = () => {
		let city = $("#city").val();
		if (!city || city === "") {   // check cả null và ""
			$("#city").addClass("is-invalid").removeClass("is-valid");
			return false;
		}
		$("#city").removeClass("is-invalid").addClass("is-valid");
		return true;
	};

	checkDistrict = () => {
		let district = $("#district").val();
		if (!district || district === "") {
			$("#district").addClass("is-invalid").removeClass("is-valid");
			return false;
		}
		$("#district").removeClass("is-invalid").addClass("is-valid");
		return true;
	};

	checkWard = () => {
		let ward = $("#ward").val();
		if (!ward || ward === "") {
			$("#ward").addClass("is-invalid").removeClass("is-valid");
			return false;
		}
		$("#ward").removeClass("is-invalid").addClass("is-valid");
		return true;
	};


	checkAddress = () => {
		let address = $("#address").val().trim();
		if (address === "") {
			$("#address").addClass("is-invalid").removeClass("is-valid");
			return false;
		}
		$("#address").removeClass("is-invalid").addClass("is-valid");
		return true;
	};



	$("#btn-get-otp").on("click", function() {
		let txtEmail = $("#email").val();
		let loader = $("#loading-spinner");
		let btnText = $("#btn-text");
		if (txtEmail === "") {
			Swal.fire("Lỗi", "Email rỗng!", "warning");
			return;
		}

		if (txtEmail === "" || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(txtEmail)) {
			Swal.fire("Lỗi", "Email không hợp lệ!", "warning");
			return;
		}
		loader.removeClass('d-none'); // show spinner
		btnText.empty();
		btnText.textContent = "Đang gửi...";
		$.ajax({
			url: "/hibook/verify/email",
			method: "POST",
			headers: {
				"X-CSRF-Token": $('#csrfTokenEmail').val()
			},
			data: {
				action: "otp",
				email: txtEmail
			},
			success: function(res) {
				if (res.status === "success") {
					
					Swal.fire({
						icon: "success",
						title: "Thành công!",
						text: res.message,
						confirmButtonText: "Tiếp tục"
					});
					if (res.expireTime) {
			           startOtpCountdown(res.expireTime);
			       	}					
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
				console.log("Không thể gửi đến server verify");
			},
			complete: function() {
				loader.addClass('d-none');
			}
		});
	});

	$("#btn-verify-otp").on("click", function() {
		let txtOTP = $("#checkOTP").val();

		if (txtOTP === "") {
			Swal.fire("Lỗi", "Nhập vào mã OTP!", "warning");
			return;
		}

		$.ajax({
			url: "/hibook/verify/email",
			method: "POST",
			headers: {
				"X-CSRF-Token": $('#csrfTokenVerify').val()
			},
			data: {
				action: "verify-otp-email",
				otp_user: txtOTP
			},
			success: function(res) {
				if (res.status === "success") {
					Swal.fire({
						icon: "success",
						title: "Thành công!",
						text: res.message,
						confirmButtonText: "Tiếp tục"
					});
				}
				else {
					Swal.fire({
						icon: "error",
						title: "Thất bại",
						text: res.message
					});
				}
				if (res.isVerified) {
					$("#email").removeClass("is-invalid");
					$("#checkOTP").removeClass("is-invalid");
					$("#email").addClass("is-valid");
					$("#checkOTP").addClass("is-valid");
				}
				else {
					$("#email").removeClass("is-valid");
					$("#checkOTP").removeClass("is-valid");
					$("#email").addClass("is-invalid");
					$("#checkOTP").addClass("is-invalid");
				}
			},
			error: function(xhr, status, error) {
				console.error("AJAX error:", status, error);
				console.error("Response text:", xhr.responseText);
				Swal.fire("Lỗi", "Không thể kết nối đến server verify", "error");
			}
		});
	});

	$("input[name='delivery']").on("change", function() {
		let priceDelivery = parseInt($(this).data("price")) || 0;
		let baseTotal = parseInt($("#totalPriceTmp").val()) || 0;
		let newTotal = baseTotal + priceDelivery;

		let formatted = new Intl.NumberFormat("vi-VN").format(priceDelivery) + " đ";
		let formattedTotal = new Intl.NumberFormat("vi-VN").format(newTotal) + " đ";
		$("#price-delivery").text("+ " + formatted);

		// chèn ra chỗ tổng tiền
		$("#totalPriceDisplay").empty();
		$("#totalPriceDisplay").text(formattedTotal);

		// cập nhật lại input hidden để gửi về backend
		$("#totalPrice").val(newTotal);
	});

	
	
	startOtpCountdown(null);
	
	function startOtpCountdown(expireTime) {
	    const btnsend = document.getElementById("btn-get-otp");
	    const btnText = document.getElementById("btn-text");
	    let timer = null;

	    function updateCountdown() {
	        const now = new Date().getTime();
	        const distance = expireTime - now;

	        if (!expireTime || distance <= 0) {
	            btnText.textContent = "Gửi xác minh";
	            btnsend.disabled = false;
	            if (timer) clearInterval(timer);
	            return;
	        }

	        const seconds = Math.floor((distance % (1000 * 60)) / 1000);
	        btnText.textContent = "Gửi lại sau: " + seconds + "s ";
	        btnsend.disabled = true;
	    }

	    if (timer) clearInterval(timer);
	    updateCountdown();
	    timer = setInterval(updateCountdown, 1000);
	}

});

