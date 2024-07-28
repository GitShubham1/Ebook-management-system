<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password Page</title>
<%@ include file="components/allCSS.jsp" %>
<style type="text/css">
em {
	color: red;
}
.error {
	color: red;
	font-size: 12px;
}

body{
   background-image: url('resources/img/bgimg3.jpg');
   background-repeat: no-repeat;
   background-attachment: fixed;
   background-size: cover;
   }
</style>

<script type="text/javascript">
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
 function togglePassword1() {
	var passwordField = document.getElementById('cnfpassword');
	
	var toggleIcon = document.getElementById('togglePassword1');

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
	/* var email = document.getElementById('email').value.trim(); */
	var password = document.getElementById('password').value.trim();
	var cnfpassword = document.getElementById('cnfpassword').value.trim();
	
	var isValid = true;
	
	//Validate New Password
	if (password === '') {
		document.getElementById('passwordError').textContent = 'Please Enter a Password.';
		isValid = false;
	} else if (password.length < 8) {
		document.getElementById('passwordError').textContent = 'Password Must be at least 8 characters long.';
		isValid = false;
	} else if (!isStrongPassword(password)) {
		document.getElementById('passwordError').textContent = 'Password Must be strong: include at least one uppercase letter, one lowercase letter, one number, and one special character.';
		isValid = false;
	} else {
		document.getElementById('passwordError').textContent = '';
	}
	 //Validate confirm Password
	 if(cnfpassword===''){
		 document.getElementById('cnfpasswordError').textContent = 'Please Enter Confirm Password.';
		 isValid=false;
	 } else if(cnfpassword.length < 8){
		 document.getElementById('cnfpasswordError').textContent = 'Password Must be at least 8 characters long.';
		 isValid = false;
	 }else if(!isStrongPassword(cnfpassword)){
		 document.getElementById('cnfpasswordError').textContent ='Password Must be strong: include at least one uppercase letter, one lowercase letter, one number, and one special character.';
		 isValid=false;
	 }else if(cnfpassword!=password){
		 document.getElementById('cnfpasswordError').textContent = 'Confirm and new Password must be same.';
		 isValid=false;
	 }else{
		 document.getElementById('cnfpasswordError').textContent = '';
	 }

	return isValid;
	
}
    
    function isStrongPassword(password) {
	  var strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	  return strongPasswordRegex.test(password);
   }

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
		},10000); //
	}
}

//call clearMessages function when the page loads
window.onload = function(){
	clearMessage();
};
</script>

</head>
<body style="background-color:#f0f1f2";>
<% 
      session.getAttribute("userEmail");
%>
   <div class="container p-5">
    <div class="row">
     <div class="col-md-6 offset-md-3">
      <div class="card">
         <div class="card-body">
         <c:if test="${not empty errMsg }">
	         <h5 class="text-center text-danger" id="textdangerMsg">${errMsg }</h5>
			<c:remove var="errMsg"/>
	     </c:if>
         <h5 class="text-center">Change Password</h5>
            <form action="changePassword" method="post" id="loginForm" onsubmit="return validateForm()">
            <input type="hidden" value="${userEmail}" name="userEmail">
           <div class="form-group">
			<label>NEW PASSWORD<em>*</em></label>
			 <div class="input-group-prepend">
			  <span class="input-group-text"><i class="fas fa-lock"></i></span>
			  <input type="password" name="password" class="form-control" id="password"> <span class="input-group-append">
				<span class="input-group-text"> <i class="fa fa-eye-slash" id="togglePassword" aria-hidden="true" onclick="togglePassword()"></i>
				</span>
				</span>
			 </div>
			<span id="passwordError" class="error"></span>
		 </div>
		 <div class="form-group">
			<label> CONFIRM NEW PASSWORD<em>*</em></label>
			 <div class="input-group-prepend">
			  <span class="input-group-text"><i class="fas fa-lock"></i></span>
			  <input type="password" name="cnfpassword" class="form-control" id="cnfpassword"> <span class="input-group-append">
				<span class="input-group-text"> <i class="fa fa-eye-slash" id="togglePassword1" aria-hidden="true" onclick="togglePassword1()"></i>
				</span>
				</span>
			 </div>
			<span id="cnfpasswordError" class="error"></span>
		 </div>
         <button class="btn btn-primary" type="submit">Submit</button>
           
        </form>
         </div>
      </div>
       
     </div>
    </div>
   </div>
</body>
</html>