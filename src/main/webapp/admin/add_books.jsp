<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add_Books</title>
<%@ include file="allCSS.jsp"%>
 <script type="text/javascript">
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
<body style="background-color: #f0f1f2;">
	<%@ include file="Navbar.jsp"%>
    <c:if test="${empty userobj}">
     <c:redirect url="../Login.jsp"/>
    </c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					    <c:if test="${not empty successmsg }">
					     <p class="text-center text-success" id="textSuccMsg">${successmsg}</p>
					     <c:remove var="successmsg" scope="session"/>
					    </c:if>
					    <c:if test="${not empty errMsg}">
					       <p class="text-center text-danger" id="textdangerMsg">${errMsg}</p>
					       <c:remove var="errMsg" scope="session"/>
					    </c:if>
						<h4 class="text-center">Add Books</h4>
						<form action="../add_book" method="post"
						enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Book Categories</label> <select
									id="inputState" class="form-control" name="btype">
									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Book Status</label> <select
									id="inputState" class="form-control" name="bstatus">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label><input
									type="file" class="form-control-file" name="bimg"
									id="exampleFormControlFile1">

							</div>

							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>