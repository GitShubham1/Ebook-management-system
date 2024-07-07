<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.util.List,com.entity.BookDtls"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.entity.User"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Books Page</title>
<%@ include file="components/allCSS.jsp"%>
<style type="text/css">
  #toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}


  
</style>
</head>
<body>
<%
	User us = (User) session.getAttribute("userobj");
	%>
<c:if test="${not empty addCart}">
<div id="toast">${addCart}</div>
<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addCart"/>
</c:if>
<%@ include file="components/Navbar.jsp" %>
<div class="container">
		<h1>New Book</h1>
		
        <div class="mycontain">
		<%
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		List<BookDtls> list = dao.getAllNewBook();
		for (BookDtls b : list) {
		%>

		
			<div class="myitems">
				<img alt="" src="books/<%=b.getPhotoName() %> "/>
				<p><%=b.getBookname()%></p>
				<p><%=b.getAuthor()%></p>
				<p>Category :<%=b.getBookCategory() %></p>


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
				 
					<a href="view_books.jsp?bid=<%=b.getBookid() %>"
					class="btn btn-success btn-sm p-2">View Details</a> 
					<a href=""
					class="btn btn-danger btn-sm p-2"><i class="fa-solid fa-indian-rupee-sign mr-1"></i><%=b.getPrice()%></a>

			</div>


		
	
	<%
	}
	%>
	</div>
	</div>
  <%@ include file="components/footer.jsp" %>
</body>
</html>