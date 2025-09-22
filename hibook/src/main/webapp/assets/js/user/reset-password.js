function validateConfirmPassword() {
  const newPassEl = document.getElementById("new-password");
  const confirmPassEl = document.getElementById("confirm-password");
  const feedback = confirmPassEl.nextElementSibling;

  if (newPassEl.value != confirmPassEl.value) {
    confirmPassEl.classList.add("is-invalid");
    confirmPassEl.classList.remove("is-valid");
    feedback.innerHTML = "Mật khẩu không trùng.";
    return false;
  } else {
    confirmPassEl.classList.remove("is-invalid");
    confirmPassEl.classList.add("is-valid");
    feedback.innerHTML = "";
    return true;
  }
}

function validatePassword() {
	document.getElementById("strength-bar").className = 'strength-bar';
	const pass = document.getElementById("new-password").value;
	const strengthBar = document.getElementById("password-strength");
	let strength = 0;
	
	if (pass.length >= 8) 
		strength++;
	if (/[a-z]/.test(pass)) strength++;
	if (/[A-Z]/.test(pass)) strength++;
	if (/[0-9]/.test(pass)) strength++;
	if (/[^a-zA-Z0-9]/.test(pass)) strength++;
	
	strengthBar.style.width = (strength * 20) + '%';
	if(strength < 2) {
		strengthBar.className = 'password-strength strength-weak';
	} 
	else if (strength <= 4) {
		strengthBar.className = 'password-strength strength-medium';
	}
	else {
		strengthBar.className = 'password-strength strength-strong';
	}
}

$(document).ready(function () {
    $('#form-reset-pass').on('submit', function (e) {
        e.preventDefault();

        if (!validateConfirmPassword()) {
            alert("Mật khẩu nhập lại không trùng!");
            return;
        }

        let txtOldPass = $('#old-password').val();
        let txtNewPass = $('#new-password').val();
        const url = "/hibook/user-information?action=reset-password";

        $.ajax({
            url: url,
            type: "POST",
            data: {
                "old-password": txtOldPass,
                "new-password": txtNewPass
            },
            dataType: "json",
            success: function (res) {
                if (res.status === 'success') {
					Swal.fire({
                        icon: "success",
                        title: "Thành công!",
                     	text: res.message,
                        confirmButtonText: "OK"
                	}).then(()=>{
						$('#form-reset-pass').trigger("reset");
                        $('.is-valid, .is-invalid').removeClass('is-valid is-invalid');
                        $('#password-strength').attr("class", "").css("width", "0");
					})
                } else {
					Swal.fire({
						icon: "error",
						title: "Thất bại",
						text: res.message
					});
                }
            },
            error: function () {
				Swal.fire({
					icon: "error",
					title: "Thất bại",
					text: "Không thể gọi đến server"
				});
            }
        });
    });
});

