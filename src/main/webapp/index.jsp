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
<title>EBook-App</title>
<%@ include file="components/allCSS.jsp"%>
<style type="text/css">
.background-img {
	background: url("img/b2.jpg");
	height: 50vh;
	width: 100%;
	background-size: auto;
}
</style>
</head>
<body>
	<%
	User us = (User) session.getAttribute("userobj");
	%>
	<%@ include file="components/Navbar.jsp"%>
	<div class=" container-fluid background-img">
		<marquee style="direction: LTR; transition-delay: 0.5s;">
			<h2 class="text-center text-danger">E-Book management system</h2>
		</marquee>
	</div>




	<!-- Recent book setion  -->
	<div class="container">
		<h1>Recent Book</h1>
		<div class="mycontain">
			<%
			BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list1 = dao1.getRecentBook();
			for (BookDtls b1 : list1) {
			%>
			<div class="myitems">
				<img alt="" src="books/<%=b1.getPhotoName()%>" />
				<p><%=b1.getBookname()%></p>
				<p><%=b1.getAuthor()%></p>
				<p>
					<%
					if (b1.getBookCategory().equals("old")) {
					%>
					Category:
					<%=b1.getBookCategory()%></p>
				<a href="view_books.jsp?bid=<%=b1.getBookid()%>"
					class="btn btn-success btn-sm mt-4 p-2">View Details</a> <a href=""
					class="btn btn-danger btn-sm mt-4 p-2"><i
					class="fa-solid fa-indian-rupee-sign mr-1"></i><%=b1.getPrice()%></a>
				<%
				} else {
				%>

				<p>
					Category:<%=b1.getBookCategory()%></p>

				      <%
				       if (us == null) {
				      %>
				      <a href="Login.jsp" class="btn btn-danger btn-sm p-2 "><i
					  class="fas fa-cart-plus mr-1"></i>Add cart</a>
				     <%
				     } else {
				     %>

				    <a href="cart?bid=<%=b1.getBookid()%>&&uid=<%=us.getId()%>"
					class="btn btn-danger btn-sm p-2 "><i
					class="fas fa-cart-plus mr-1"></i>Add cart</a>
				    <%
				    }
				    %>


				 <a href="view_books.jsp?bid=<%=b1.getBookid()%>"
					class="btn btn-success btn-sm p-2">View Details</a> 
					
					<a href=""
					class="btn btn-danger btn-sm p-2"><i
					class="fa-solid fa-indian-rupee-sign mr-1"></i><%=b1.getPrice()%></a>
				<%
				}
				%>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- end recent book  -->

	<!-- new book section -->
	<div class="container">
		<h1>New Book</h1>

		<div class="mycontain">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>


			<div class="myitems">
				<img alt="" src="books/<%=b.getPhotoName()%> " />
				<p><%=b.getBookname()%></p>
				<p><%=b.getAuthor()%></p>
				<p>
					Category :<%=b.getBookCategory()%></p>

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
					class="btn btn-success btn-sm p-2">View Details</a> <a href=""
					class="btn btn-danger btn-sm p-2"><i
					class="fa-solid fa-indian-rupee-sign mr-1"></i><%=b.getPrice()%></a>

			</div>




			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>

	<!-- end new book -->

	<!--old book section  -->
	<div class="container">
		<h1>Old Book</h1>
		<div class="mycontain">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getOldBook();
			for (BookDtls b2 : list2) {
			%>
			<div class="myitems">
				<img alt="" src="books/<%=b2.getPhotoName()%>" />
				<p><%=b2.getBookname()%></p>
				<p><%=b2.getAuthor()%></p>
				<p>
					Category :<%=b2.getBookCategory()%></p>


				<a href="view_books.jsp?bid=<%=b2.getBookid()%>"
					class="btn btn-success btn-sm p-2">View Details</a> <a href=""
					class="btn btn-danger btn-sm p-2"><i
					class="fa-solid fa-indian-rupee-sign mr-1"></i><%=b2.getPrice()%></a>

			</div>
			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<%@ include file="components/footer.jsp"%>
</body>
</html>