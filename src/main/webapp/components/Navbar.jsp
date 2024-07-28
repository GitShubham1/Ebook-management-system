 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
 
 
 
 <div class="container-fluid" style= "background-color:#303f9f; height:10px;">
      
   </div>
   <div class="container-fluid p-3 bg-light">
      <div class="row">
          <div class="first text-success">
             <h3>
                <i class="fa-solid fa-book "></i>Ebooks
             </h3>
          </div>
          <div class="second">
              <form action="search.jsp" class="one" method="post">
                <input type="search" placeholder="Search" aria-label="Search" name="ch">
                <button type="submit" class="btn btn-primary" type="submit">Search</button>
              
              </form>
          
          </div>
          
          <c:if test="${not empty userobj}">
            <div class="third">
              <a href="cart.jsp"><i class="fas fa-cart-plus fa-2x mr-1 text-danger"></i></a>
              <a href="Login.jsp">
              <button  class="btn btn-success"><i class="fa-solid fa-user mr-1"></i>${userobj.name}</button>
              </a>
              <a href="logout">
                <button type="button" class="btn btn-primary"><i class="fas fa-sign-out"></i>Logout</button>
              </a>
          </div>
          </c:if>
          
          <c:if test="${empty userobj}">
            <div class="third">
          
              <a href="Login.jsp">
                <button type="button" class="btn btn-success"><i class="fas fa-sign-in-alt"></i>Login</button>
              </a>
              <a href="register.jsp">
                <button type="button" class="btn btn-primary"><i class="fas fa-user-plus"></i>Register</button>
              </a>
          </div>
          </c:if>
          
      </div>   
   
   </div>
   
   <nav class="navbar">
       <div class="navdiv">
          <ul class="myul">
              <li><a href="index.jsp"><i class="fa-solid fa-house-chimney"></i>Home</a></li>
              <li><a href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>Recent Book</a></li>
              <li><a href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>New Book</a></li>
              <li><a href="all_old_book.jsp"><i class="fa-solid fa-book"></i>Old Book</a></li>
              
          </ul>
          
          <div class="mybtns">
            <a href="setting.jsp">
              <button type="button" class="btn"><i class="fa-solid fa-gear"></i>setting</button>
            </a>
            <a href="helpline.jsp">
               <button type="button" class="btn"><i class="fa-solid fa-phone"></i>contact us</button>
            </a>
          </div>
       
       </div>
   
   </nav>