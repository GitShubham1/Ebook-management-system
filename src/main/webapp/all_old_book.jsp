<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.util.List,com.entity.BookDtls"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Books Page</title>
<%@ include file="components/allCSS.jsp"%>
</head>
<body>
<%@ include file="components/Navbar.jsp" %>

<div class="container">
		<h1>Old Book</h1>
		<div class="mycontain">
		
		<%
		 BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		  List<BookDtls> list=dao.getAllOldBook();
		  for(BookDtls b:list){
		%>
			<div class="myitems">
				<img alt="" src="books/<%=b.getPhotoName() %>" />
				<p><%=b.getBookname() %></p>
				<p><%=b.getAuthor() %></p>
				<p>Category :<%=b.getBookCategory() %></p>


				<a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm p-2">View Details</a> <a
					href="" class="btn btn-danger btn-sm p-2"><i class="fa-solid fa-indian-rupee-sign mr-1"></i><%=b.getPrice() %></a>
</div>
<%
	}
	%>
</div>
</div>
 <%@ include file="components/footer.jsp" %>
</body>
</html>