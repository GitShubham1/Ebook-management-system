<%@page import="com.entity.Book_Order"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.entity.Book_Order"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@ include file="allCSS.jsp"%>
</head>
<body>
	<%@ include file="Navbar.jsp"%>
	<c:if test="${empty userobj}">
     <c:redirect url="../Login.jsp"/>
    </c:if>
	<h3 class="text-center">Hello Admin</h3>
	<table class="my table">
		<thead class="bg-primary text-white">
			<tr>
				<th>OrderId</th>
				<th>Name</th>
				<th>Email</th>
				<th>Address</th>
				<th>Phone No</th>
				<th>Book Name</th>
				<th>Author</th>
				<th>Price</th>
				<th>payment Type</th>
			</tr>
		</thead>
		<tbody>
		  <%
		    BookOrderDAOImpl dao=new BookOrderDAOImpl(DBConnect.getConn());
		      List<Book_Order> blist=dao.getAllBook();
		      for(Book_Order b:blist)
		    	  {%>
		    	  <tr>
				 <th scope="row"><%=b.getOrderId() %></th>
				 <td><%=b.getUserName() %></td>
				 <td><%=b.getEmail() %></td>
				 <td><%=b.getFullAddress() %></td>
				 <td><%=b.getPhno() %></td>
				 <td><%=b.getBookName() %></td>
				 <td><%=b.getAuthor() %></td>
				 <td><%=b.getPrice() %></td>
				 <td><%=b.getPaymentType() %></td>
			   </tr>
		    	  
		    	  <%}
		      %>
		  
			
			
		</tbody>
	</table>
	<%@ include file="footer.jsp"%>
</body>
</html>