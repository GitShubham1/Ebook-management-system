<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting Page</title>
<%@ include file="components/allCSS.jsp"%>
<style type="text/css">
 a{
   text-decoration:none;
   color:black;
 }
 a:hover{
   text-decoration:none;
 }
</style>
</head>
<body style="background-color:#f7f7f7;">
<c:if test="${empty userobj}">
   <c:redirect url="Login.jsp"></c:redirect>
</c:if>
<%@ include file="components/Navbar.jsp"%>
<div class="container">

<h3>Hello,${userobj.name}</h3>


    <div class="row">
        <div class="col-md-4">
           <a href="sellBook.jsp">
               <div class="card">
                   <div class="card-body text-center">
                       <div class="text-primary">
                           <i class="fas fa-book-open fa-3x"></i>
                       </div>
                       
                       <h3>Sell Old Book</h3>
                   </div>
               </div>
           </a>
        </div>
        
        <div class="col-md-4">
           <a href="OldBook.jsp">
               <div class="card">
                   <div class="card-body text-center">
                       <div class="text-primary">
                           <i class="fas fa-book-open fa-3x"></i>
                       </div>
                       
                       <h3>Old Book</h3>
                   </div>
               </div>
           </a>
        </div>
        
        <div class="col-md-4">
           <a href="editProfile.jsp">
               <div class="card">
                   <div class="card-body text-center">
                       <div class="text-primary">
                           <i class="fas fa-edit fa-3x"></i>
                       </div>
                       
                       <h4>Edit Profile</h4>
                   </div>
               </div>
           </a>
        </div>
        
        
        
        <div class="col-md-6 mt-3">
           <a href="order.jsp">
               <div class="card">
                   <div class="card-body text-center">
                       <div class="text-danger">
                           <i class="fas fa-box-open fa-3x"></i>
                       </div>
                       
                       <h3>My Order</h3>
                       <p>Track Your Order</p>
                   </div>
               </div>
           </a>
        </div>
        
        <div class="col-md-6 mt-3">
           <a href="helpline.jsp">
               <div class="card">
                   <div class="card-body text-center">
                       <div class="text-primary">
                           <i class="fas fa-user-circle fa-3x"></i>
                       </div>
                       
                       <h3>Help Center</h3>
                       <p>24*7 Service</p>
                   </div>
               </div>
           </a>
        </div>
    </div>
</div>
<%@ include file="components/footer.jsp"%>
</body>
</html>