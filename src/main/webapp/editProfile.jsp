<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile Page</title>
<%@ include file="components/allCSS.jsp"%>
<!-- <script type="text/javascript">
function clearMessage(){
	var succMsgElement = document.querySelector('.text-success');
	var errMsgElement = document.querySelector('.text-danger');
	
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
 -->
 </head>
<body style="background-color:#f0f1f2;">
<%@ include file="components/Navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                  <h4 class="text-center text-primary">Edit Profile</h4>
                  <c:if test="${not empty successMsg }">
                    <h5 class="text-center text-success">${successMsg}</h5>
                    <c:remove var="successMsg" scope="session"/>
                  </c:if>
                  
                  <c:if test="${not empty errMsg}">
                    <h5 class="text-center text-danger">${errMsg}</h5>
                    <c:remove var="errMsg" scope="session"/>
                  </c:if>
                  
                  <form action="updateProfile" method="post">
                      <input type="hidden" value="${userobj.id}" name="id">
						    <div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name}" >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" value="${userobj.email }" >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No.</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno" value="${userobj.phno}">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									 required="required" required="required" name="password">
							</div>
							
							
						<div class="text-center"><button type="submit" class="btn btn-primary">Update</button></div>	
						</form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>