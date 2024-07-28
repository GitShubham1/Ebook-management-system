<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify Email</title>
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
function validateForm(){
	var email = document.getElementById('email').value.trim();
	
	
	var isValid = true;
	
	//Validate Email
	if(email===''){
		document.getElementById('emailError').textContent = 'Please enter your email address.';
		isValid=false;
	}else{
		document.getElementById('emailError').textContent = '';
	}
	
	
  return isValid;	
}
function clearMessage(){

	var errMsgElement = document.getElementById('textdangerMsg');
	
	
	
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
<body style="background-color:#f0f1f2";>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					 <c:if test="${not empty errMsg }">
				      <h5 class="text-center text-danger" id="textdangerMsg">${errMsg }</h5>
				      <c:remove var="errMsg"/>
				     </c:if>
					
						<form action="verifyUser" method="post" id="verifyForm"
							onsubmit="return validateForm()">
							<div class="form-group">
								<label>Please Enter Your Email here<em>*</em></label>
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-envelope"></i></span>
									<input type="email" name="email" class="form-control"
										id="email">
								</div>
								<span id="emailError" class="error"></span>
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