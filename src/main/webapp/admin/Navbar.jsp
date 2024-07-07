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
          
          <div class="third" style="margin-left:57rem;">
           <c:if test="${not empty userobj}">
             <a>
                <button type="button" class="btn btn-success"><i class="fas fa-user"></i>${userobj.name}</button>
              </a>
              <a data-toggle="modal" data-target="#exampleModalCenter">
                <button type="button" class="btn btn-primary"><i class="fas fa-sign-out"></i>Logout</button>
              </a>
              
           </c:if>
           <c:if test="${empty userobj}">
             <a href="../Login.jsp">
                <button type="button" class="btn btn-success"><i class="fas fa-sign-in-alt"></i>Login</button>
              </a>
              
              
              <a href="../register.jsp">
                <button type="button" class="btn btn-primary"><i class="fas fa-user-plus" ></i>Register</button>
              </a>
           </c:if>
             
          </div>
      </div>   
   
   </div>
   
   <!-- logout modal -->

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
   
   <nav class="navbar">
       <div class="navdiv">
          <ul class="myul">
              <li><a href="home.jsp"><i class="fa-solid fa-house-chimney"></i>Home</a></li>
              </ul>
              
       
       </div>
   
   </nav>