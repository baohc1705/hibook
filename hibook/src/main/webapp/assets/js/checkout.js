$(document).ready(function() {

	$("#btn-checkout").on("click", function(e) {
		e.preventDefault();

		var txtName = $("#name").val();
		var txtEmail = $("#email").val();
		var txtPhone = $("#phone").val();
		var txtCity = $("#city").val();
		var txtDistrict = $("#district").val();
		var txtWard = $("#ward").val();
		var txtShipAddress = $("#address").val();
		var txtDelivery = $("input[name='delivery']:checked").val();;
		var txtTotalPrice = $("#totalPrice").val();
		var txtNote = "Đay la note doi them sau";

		$.ajax({
			url: "/hibook/checkout?action=add",
			method: "POST",
			data: {
				name : txtName,
				email : txtEmail,
				phone : txtPhone,
				city: txtCity,
				district: txtDistrict,
				ward: txtWard,
				address: txtShipAddress,
				delivery: txtDelivery,
				totalPrice: txtTotalPrice,
				note: txtNote
			},
			dataType: "JSON",
			success: function(res) {
				if (res.status === "success") {
					Swal.fire({
						icon: "success",
						title: "Thành công!",
						text: res.message,
						confirmButtonText: "Tiếp tục"
					}).then(() => {
						window.location.href="/hibook/cart";
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
			}
		});
	});
});