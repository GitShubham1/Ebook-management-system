<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.util.List,com.entity.BookDtls"%>
<%@ page import="com.entity.User"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Books Page</title>
<%@ include file="components/allCSS.jsp"%>
</head>
<body>
<%
	User us = (User) session.getAttribute("userobj");
	%>
<%@ include file="components/Navbar.jsp" %>
<div class="container">
		<h1>Recent Book</h1>
		<div class="mycontain">
		<%
		  String ch=request.getParameter("ch");
		  BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		          List<BookDtls> list=dao.getBookBySearch(ch);
		          for(BookDtls b:list)
		          {
		%>
			<div class="myitems">
				<img alt="" src="books/<%=b.getPhotoName() %>" />
				<p><%=b.getBookname() %></p>
				<p><%=b.getAuthor() %></p>
				<p>
				<%
				  if(b.getBookCategory().equals("old")){
					  %>
					  Category: <%=b.getBookCategory() %></p>
					   <a href="view_books.jsp?bid=<%=b.getBookid() %>"
								class="btn btn-success btn-sm mt-4 p-2">View Details</a> 
					   <a href=""
								class="btn btn-danger btn-sm mt-4 p-2"><i class="fa-solid fa-indian-rupee-sign mr-1"></i><%=b.getPrice() %></a> 
				 <% 
				 } else{
					 
				 
				%>
				
				<p>Category: <%=b.getBookCategory() %></p>
                 <%
				       if (us == null) {
				      %>
				      <a href="Login.jsp" class="btn btn-danger btn-sm p-2 "><i
					  class="fas fa-cart-plus mr-1"></i>Add cart</a>
				     <%
				     } else {
				     %>

				    <a href="cart?bid=<%=b.getBookid()%>&&uid=<%=us.getId()%>"
					class="btn btn-danger btn-sm p-2 "><i
					class="fas fa-cart-plus mr-1"></i>Add cart</a>
				    <%
				    }
				    %>
                 

				 
					
					<a href="view_books.jsp?bid=<%=b.getBookid()%>"
					class="btn btn-success btn-sm p-2">View Details</a> 
					<a href=""
					class="btn btn-danger btn-sm p-2"><i class="fa-solid fa-indian-rupee-sign mr-1"></i><%=b.getPrice() %></a>
                 <%
				 }
                 %>
			</div>
          <%
		          }
          %>
			
		</div>
	</div>
    <%@ include file="components/footer.jsp"%>
</body>
</html>