<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<%@ include file="components/allCSS.jsp" %>
<style type="text/css">
em {
	color: red;
}
.error {
	color: red;
	font-size: 12px;
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

function validateForm(){
	var email = document.getElementById('email').value.trim();
	var password = document.getElementById('password').value.trim();
	
	var isValid = true;
	
	//Validate Email
	if(email===''){
		document.getElementById('emailError').textContent = 'Please enter your email address.';
		isValid=false;
	}else{
		document.getElementById('emailError').textContent = '';
	}
	
	//Validate Password
	if(password===''){
		document.getElementById('passwordError').textContent = 'Please enter a password.';
		isValid=false;
	}else{
		document.getElementById('passwordError').textContent = '';
	}
  return isValid;	
}

//function to clear success and error message after a delay

function clearMessage(){
	var succMsgElement = document.getElementById('textSuccMsg');
	var errMsgElement = document.getElementById('textdangerMsg');
	
	if(succMsgElement){
		setTimeout(function(){
		   	succMsgElement.textContent='';
		},2000); //2000 milisecond = 2 second
	}
	
	if(errMsgElement){
		setTimeout(function(){
			errMsgElement.textContent='';
		},2000); //2000 milisecond = 2 second
	}
}

//call clearMessages function when the page loads
window.onload = function(){
	clearMessage();
};
</script>
</head>
<body style="background-color:#f0f1f2;">
<%@ include file="components/Navbar.jsp" %>
<div class="container p-3">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					 <c:if test="${not empty successMsg }">
					   <h5 class="text-center text-success" id="textSuccMsg" >${successMsg}</h5>
					   <c:remove var="successMsg"/>
					 </c:if>
					 <h4 class="text-center">Login Form</h4>
					 <c:if test="${ not empty errmsg}">
					   <h5 class="text-center text-danger" id="textdangerMsg" >${errmsg}</h5>
					   <c:remove var="errmsg" />
					 </c:if>
					 
					
					 
					 
						<form action="login" method="post" onsubmit="return validateForm()">
							<div class="form-group">
								<label for="exampleInputEmail1" placeholder="email">Email address<em>*</em></label>
								<div class="input-group-prepend"> 
								<span class="input-group-text"><i class="fa fa-user"></i></span>
								<input
									type="email" class="form-control" id="email"
									aria-describedby="emailHelp" name="email">
								</div>
								<span id="emailError" class="error"></span>
							</div>

							<div class="form-group">
							<label for="exampleInputPassword1">Password<em>*</em></label>
							    <div class="input-group-prepend">
							      <span class="input-group-text"> <i class="fas fa-lock"></i>
								  </span>
							      
								 <input
									type="password" class="form-control" id="password" name="password">
								
								<span class="input-group-append">
									 <span
										class="input-group-text"> <i class="fa fa-eye-slash"
											id="togglePassword" aria-hidden="true"
											onclick="togglePassword()"></i>
									</span>
									</span>
									
								</div>
								<span id="passwordError" class="error"></span>
								<a href="verifyUser.jsp">forgot password</a>
							</div>

							

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button><br>
								<a href="register.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="components/footer.jsp" %>

</body>
</html>