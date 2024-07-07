<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List, com.DAO.BookDAOImpl" %>
<%@page import="java.util.List, com.entity.BookDtls" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@ include file="allCSS.jsp"%>
</head>
<body>
	<%@ include file="Navbar.jsp"%>
	<c:if test="${empty userobj}">
     <c:redirect url="../Login.jsp"/>
    </c:if>
	<h3 class="text-center">Hello Admin</h3>
	                    <c:if test="${not empty successmsg }">
							<h5 class="text-center text-success">${successmsg}</h5>
							<c:remove var="successmsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty errMsg}">
							<h5 class="text-center text-danger">${errMsg}</h5>
							<c:remove var="errMsg" scope="session" />
						</c:if>
	<table class="my table">
		<thead class="bg-primary text-white">
			<tr>
			    <th>Id</th>
				<th>Image</th>
				<th>Book Name</th>
				<th>Author</th>
				<th>Price</th>
				<th>Categories</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<% 
		   BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		   List<BookDtls> list=dao.getAllBooks();
		   for(BookDtls b:list){
		%>
			<tr>
				<td><%=b.getBookid() %></td>
				<td><img src="../books/<%=b.getPhotoName()%>" 
				style="width:50px; height:50px;"></td>
				<td><%=b.getBookname() %></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus() %></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookid() %>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>Edit</a> <a
					href="../delete?id=<%=b.getBookid() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>Delete</a></td>
			</tr>
	        <% 
			}
			%>
		</tbody>
	</table>
	<%@ include file="footer.jsp"%>
</body>
</html>