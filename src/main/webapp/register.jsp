<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="components/allCSS.jsp"%>

<title>Registration Page</title>
<style>
.error {
	color: red;
	font-size: 12px;
}

em {
	color: red;
}
</style>
<script>
	function togglePassword() {
		var passwordField = document.getElementById('password');
		var toggleIcon = document.getElementById('togglePassword');

		if (passwordField.type === 'password') {
			passwordField.type = 'text';
			toggleIcon.classList.remove('fa-eye-slash');
			toggleIcon.classList.add('fa-eye');
		} else {
			passwordField.type = 'password';
			toggleIcon.classList.remove('fa-eye');
			toggleIcon.classList.add('fa-eye-slash');
		}
	}
	function validateForm() {
		var fname = document.getElementById('fname').value.trim();
		var email = document.getElementById('email').value.trim();
		var phno = document.getElementById('phno').value.trim();
		var password = document.getElementById('password').value.trim();
		var check = document.getElementById('exampleCheck1');

		var isValid = true;

		// Validate Full Name
		if (fname === '') {
			document.getElementById('fNameError').textContent = 'Please enter your full name.';
			isValid = false;
		} else {
			document.getElementById('fNameError').textContent = '';
		}

		// Validate Email
		if (email === '') {
			document.getElementById('emailError').textContent = 'Please enter your email address.';
			isValid = false;
		} else if (!isValidEmail(email)) {
			document.getElementById('emailError').textContent = 'Please enter a valid email address.';
			isValid = false;
		} else {
			document.getElementById('emailError').textContent = '';
		}

		// Validate Phone Number
		if (phno === '') {
			document.getElementById('phnoError').textContent = 'Please enter your phone number.';
			isValid = false;
		} else if (!isValidPhone(phno)) {
			document.getElementById('phnoError').textContent = 'Please enter a valid phone number.';
			isValid = false;
		} else {
			document.getElementById('phnoError').textContent = '';
		}

		// Validate Password
		if (password === '') {
			document.getElementById('passwordError').textContent = 'Please enter a password.';
			isValid = false;
		} else if (password.length < 8) {
			document.getElementById('passwordError').textContent = 'Password must be at least 8 characters long.';
			isValid = false;
		} else {
			document.getElementById('passwordError').textContent = '';
		}

		// Validate Terms & Conditions checkbox
		if (!check.checked) {
			document.getElementById('checkError').textContent = 'Please agree to the terms & conditions.';
			isValid = false;
		} else {
			document.getElementById('checkError').textContent = '';
		}

		return isValid;
	}

	function isValidEmail(email) {
		// Basic email validation using regex
		var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		return emailRegex.test(email);
	}

	function isValidPhone(phno) {
		// Basic phone number validation using regex (digits only)
		var phoneRegex = /^\d+$/;
		return phoneRegex.test(phno);
	}
</script>
</head>
<body style="background-color: #f0f1f2;">

	<%@ include file="components/Navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Form</h4>

						<c:if test="${not empty successmsg }">
							<p class="text-center text-success">${successmsg}</p>
							<c:remove var="successmsg" />
						</c:if>

						<c:if test="${not empty errmsg }">
							<p class="text-center text-danger">${errmsg}</p>
							<c:remove var="errmsg" />
						</c:if>

						<form action="register" method="post" id="registrationform"
							onsubmit="return validateForm()">
							<div class="form-group">
								<label for="fname">Full Name<em>*</em></label>
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-user"></i></span>
									<input type="text" class="form-control" id="fname" name="fname">
								</div>
								<span id="fNameError" class="error"></span>
							</div>
							<div class="form-group">
								<label for="email">Email address<em>*</em></label>
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-envelope"></i></span>
									<input type="email" class="form-control" id="email"
										name="email">
								</div>
								<span id="emailError" class="error"></span>
							</div>
							<div class="form-group">
								<label for="phno">Phone No.<em>*</em></label>
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-phone"></i></span>
									<input type="text" class="form-control" id="phno" name="phno">
								</div>
								<span id="phnoError" class="error"></span>
							</div>
							<div class="form-group">
								<label for="password">Password<em>*</em></label>
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fas fa-lock"></i>
										</span>
										 <input type="password" class="form-control" id="password"
											name="password">
									<span class="input-group-append"> <span
										class="input-group-text"> <i class="fa fa-eye-slash"
											id="togglePassword" aria-hidden="true"
											onclick="togglePassword()"></i>
									</span>
									</span>
								</div>
								<span id="passwordError" class="error"></span>
							</div>


							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Agree
									terms & Condition<em>*</em>
								</label><br> <span id="checkError" class="error"></span>
							</div>

							<div class="text-center mt-3">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>