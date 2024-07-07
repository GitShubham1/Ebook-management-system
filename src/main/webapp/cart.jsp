<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List, com.DAO.CartDAOImpl" %>
<%@ page import="java.util.List, com.entity.Cart" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart page</title>
<%@ include file="components/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="components/Navbar.jsp"%>
	<c:if test="${empty userobj}">
	   <c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty successMsg}">
	  <div class="alert alert-success" role="alert">${successMsg}
	  </div>
	  <c:remove var="successMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty errMsg}">
	  <div class="alert alert-danger text-center" role="alert">${errMsg}
	  </div>
	  <c:remove var="errMsg" scope="session"/>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="my table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							    
							    <%
							      User u=(User)session.getAttribute("userobj");
							      CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
							      List<Cart> cart=dao.getBookByUser(u.getId());
							      Double totalPrice=0.00;
							      for(Cart c:cart)
							      {
							    	 totalPrice=c.getTotal(); 
							      %>
							    	<tr>
									<th scope="row"><%=c.getBookname()%></th>
									<td><%=c.getAuthor() %></td>
									<td><%=c.getPrice() %></td>
									<td>
									 <a href="removeBook?bid=<%=c.getBid() %>&&uid=<%=c.getUid() %>&&cid=<%=c.getCid() %>" class="btn btn-danger">Remove</a>
									</td>
								</tr>  
							      <%}
							      
							      %>
							  
							  <tr>
							  <td>Total Price</td>
							  <td></td>
							  <td></td>
							  <td><%=totalPrice %></td>
							  </tr>

								
							</tbody>
						</table>

					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post" >
						    <input type="hidden" value="${userobj.id}" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputName4" placeholder="Name" value="${userobj.name }" readonly="readonly" name="username" required>
								</div>

								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input type="email"
										class="form-control" id="inputEmail4" placeholder="Email" value="${userobj.email }" readonly="readonly" name="email" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPhoneNo4">Phone No</label> <input
										type="number" class="form-control" id="inputNumber4" value="${userobj.phno}" name="phno" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputAddress4">Address</label> <input type="text"
										class="form-control" id="inputAddress4" name="address" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4" name="city" required>
								</div>
							</div>
                            
                            <div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Pincode</label> <input type="text"
										class="form-control" id="inputEmail4" name="pincode" required>
								</div>
							</div>
							
							<div class="form-group">
							<label>Payment Mode</label>
							<select class="form-control" name="paymentType">
							    <option value="noselect">--Select--</option>
							    <option value="COD">Cash On Delivery</option>
							</select>
							</div>
							
							<div class="text-center">
							    <button class="btn btn-warning">Order Now</button>
							    <a href="index.jsp" class="btn btn-success">Continue shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>