<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@ include file="allCSS.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.myitems {
	margin: 10px 0px;
	text-align: center;
	box-shadow: 0px 0px 10px 3px lightgrey;
	background: white;
	padding: 10px 0px;
	box-sizing: border-box;
	height: auto;
	width: 250px;
}

.myitems:hover {
	background: white;
}
</style>
</head>
<body>
	<%@ include file="Navbar.jsp"%>
	
	<c:if test="${empty userobj}">
	  <c:redirect url="../Login.jsp"/>
	</c:if>
	<%--  <div class="container">
      <div class="row">
          <div class="col-md-3">
             <div class="card">
               <div class="card-body text-center">
               <h4>Add Books</h4>
               </div>
             </div>
          </div>
      </div>
   </div>--%>
	<div class="container">
		<div class="mycontain">
			<a href="add_books.jsp">
				<div class="myitems">
					<i class="fas fa-plus-square fa-3x text-primary"></i><br>
					<h4>Add Books</h4>
					----------------
				</div>
			</a> <a href="all_books.jsp">
				<div class="myitems">
					<i class="fas fa-book-open fa-3x text-danger"></i><br>
					<h4>All Books</h4>
					----------------
				</div>
			</a> <a href="order_books.jsp">
				<div class="myitems">
					<i class="fas fa-box-open fa-3x text-warning"></i><br>
					<h4>Orders</h4>
					----------------
				</div>
			</a> <a data-toggle="modal" data-target="#exampleModalCenter">
				<div class="myitems">
					<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
					<h4>Logout</h4>
					----------------
				</div>
			</a>
		</div>
	</div>
	<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="text-center">
           <h4>Do you want to logout?</h4>
           <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
           <a  href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
       </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
   
   <!-- end logout modal -->
	
	<%@ include file="footer.jsp"%>
</body>
</html>