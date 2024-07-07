<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/allCSS.jsp"%>
</head>
<body style="background-color:#f0f1f2">
<%@ include file="components/Navbar.jsp"%>
<div class="container text-center mt-3">
   <i class="fas fa-check-circle fa-5x text-success"></i>
   <h1>Thank You</h1>
   <h2>Your Order Placed Successfully</h2>
   <h5>with in 7 Days Your order will be Delivered at Your Address</h5>
   <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
   <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
</div>
</body>
</html>