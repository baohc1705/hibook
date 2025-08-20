checkPass = () => {
	var txtPass = document.getElementById('password').value.trim();
	var errMsg = document.getElementById('errMsg-pass');
	
	const hasUppercase = /[A-Z]/.test(txtPass);
	const hasLowercase = /[a-z]/.test(txtPass);
	const hasNumber = /[0-9]/.test(txtPass);
	const hasSpecialChar = /[^A-Za-z0-9]/.test(txtPass);

  	if (!hasUppercase) {
        errMsg.innerHTML = "Mật khẩu phải chứa ít nhất 1 chữ in hoa (A-Z).";
     	document.querySelector(".successPassword").style.display = "none";
        return false;
    }

    if (!hasLowercase) {
        errMsg.innerHTML = "Mật khẩu phải chứa ít nhất 1 chữ thường (a-z).";
     	document.querySelector(".successPassword").style.display = "none";
        return false;
    }

    if (!hasNumber) {
        errMsg.innerHTML = "Mật khẩu phải chứa ít nhất 1 số (0-9).";
     	document.querySelector(".successPassword").style.display = "none";
        return false;
    }

    if (!hasSpecialChar) {
        errMsg.innerHTML = "Mật khẩu phải chứa ít nhất 1 ký tự đặc biệt (vd: !@#$%^&*).";
     	document.querySelector(".successPassword").style.display = "none";
        return false;
    }
    if (txtPass.length < 10) {
		errMsg.innerHTML = "Mật khẩu phải có ít nhất 10 ký tự";
		document.querySelector(".successPassword").style.display = "none";
		return false;
	}
    errMsg.innerHTML = "";
 	document.querySelector(".successPassword").style.display = "block";
    return true;
}
    	
checkPassword = () => {
	txtpassword = document.getElementById('password').value;
	txtpasswordCheck = document.getElementById('passwordCheck').value;
	if (txtpassword != txtpasswordCheck) {
		document.getElementById('error-msg-password').innerHTML = "Mật khẩu không khớp";
		document.querySelector(".successConfirmPasswword").style.display = "none";
		return false;
	} else {
		document.getElementById('error-msg-password').innerHTML = "";
		document.querySelector(".successConfirmPasswword").style.display = "block";
		return true;
	}
}

const validateEmail = (email) => {
	return email.match(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	); // stackoverflow
};

checkEmail = () => {
	let txtEmail = document.getElementById('email').value;
	var flag = false;
	if (txtEmail.trim().length == 0) {
		document.getElementById('errMsg-email').innerHTML = `<i class="fa-solid fa-triangle-exclamation"></i> Hãy điền vào email..`;
		document.querySelector(".successEmail").style.display = "none";
		return false;
	} 
	else if (!validateEmail(txtEmail)) {
		document.getElementById('errMsg-email').innerHTML = `<i class="fa-solid fa-triangle-exclamation"></i> Email không đúng dạng`;
		document.querySelector(".successEmail").style.display = "none";
		return false;
	}
	document.getElementById('errMsg-email').innerHTML = "";
	document.querySelector(".successEmail").style.display = "block";
	return true;
}

checkFullname = () => {
	var txtFullname = document.getElementById('fullname').value.trim();
	var errMsg =  document.getElementById('errMsg-fullname');
	if (txtFullname.length == 0) {
		errMsg.innerHTML = "Hãy điền vào họ tên";
		document.querySelector(".successFullname").style.display = "none";
		return false;
	}
	else if (/[0-9]/.test(txtFullname)) {
		errMsg.innerHTML = "Họ tên không tồn tại số";
		document.querySelector(".successFullname").style.display = "none";
		return false;
	}
	else if (/[`~!@#$%^&*()_\-+={}[\]|\\:;"'<>,.?/]/.test(txtFullname)) {
		errMsg.innerHTML = "Họ tên không có ký tự đặc biệt";
		document.querySelector(".successFullname").style.display = "none";
		return false;
	}
	errMsg.innerHTML = "";
	document.querySelector(".successFullname").style.display = "block";
	return true;
}

const checkAgreement = () => {
	return document.getElementById('checkAgree').checked;
}

validateForm = () =>{
	
	if (!checkPassword()) {
		document.getElementById('passwordCheck').focus();
		return false;
	}
	else if (!checkEmail()) {
		document.getElementById('email').focus();
		return false;
	}
	else if (!checkPass()) {
		document.getElementById('password').focus();
		return false;
	}
	else if (!checkFullname()) {
		document.getElementById('fullname').focus();
		return false;
	}
	else if (!checkAgreement()) {
		document.getElementById('checkAgree').focus();
		Swal.fire("Hãy chấp nhận điều khoản của chúng tôi!");
		return false;
	}
	return true;
}