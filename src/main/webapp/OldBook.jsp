<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.DAO.BookDAOImpl"%>
<%@ page import="java.util.List,com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Old Book</title>
<%@ include file="components/allCSS.jsp" %>
<script type="text/javascript">
//function to clear success and error message after a delay

function clearMessage(){
	var succMsgElement = document.getElementById('textSuccMsg');
	
	
	if(succMsgElement){
		setTimeout(function(){
		   	succMsgElement.textContent='';
		},2000); //2000 milisecond = 2 second
	}
	
	
}

//call clearMessages function when the page loads
window.onload = function(){
	clearMessage();
};
</script>
</head>
<body>
<%@ include file="components/Navbar.jsp"%>

<c:if test="${not empty successMsg }">
    <p class="text-center text-success" id="textSuccMsg">${successMsg}</p>
    <c:remove var="successMsg" scope="session"/>
</c:if>
<div class="container p-5">
    <table class="table table-striped">
    <thead class="bg-primary text-white">
        <tr>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Category</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
        <%
         User u=(User)session.getAttribute("userobj");
        String email=u.getEmail();
        
         BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
          List<BookDtls> list=dao.getBookByOld(email,"Old");
          for(BookDtls b:list)
          {%>
        	 <tr>
            <td><%=b.getBookname() %></td>
            <td><%=b.getAuthor() %></td>
            <td><%=b.getPrice() %></td>
            <td><%=b.getBookCategory() %></td>
            <td><a href="deleteOldBook?em=<%=email %> && bid=<%=b.getBookid() %>" class="btn btn-sm btn-danger">Delete</a></td>
            </tr> 
         <%}
        %>
       
        
    </tbody>
</table>
    

</div>
</body>
</html>