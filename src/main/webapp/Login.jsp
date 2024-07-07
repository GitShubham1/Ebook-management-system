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
</style>
</head>
<body style="background-color:#f0f1f2;">
<%@ include file="components/Navbar.jsp" %>
<div class="container p-3">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					 <c:if test="${not empty successMsg }">
					   <h5 class="text-center text-success">${successMsg}</h5>
					   <c:remove var="successMsg"/>
					 </c:if>
					 <h4 class="text-center">Login Form</h4>
					 <c:if test="${ not empty errmsg}">
					   <h5 class="text-center text-danger">${errmsg}</h5>
					   <c:remove var="errmsg" />
					 </c:if>
					 
					
					 
					 
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1" placeholder="email">Email address<em>*</em></label> 
								<input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp"required="required" name="email">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password<em>*</em></label> <input
									type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
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