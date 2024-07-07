package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
	   /* System.out.println("Bookid :"+bid);
	    System.out.println("UserId :"+uid);
		*/
		BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		BookDtls b=dao.getBookById(bid);
		
		Cart c=new Cart();
		   c.setBid(bid);
		   c.setUid(uid);
		   c.setBookname(b.getBookname());
		   c.setAuthor(b.getAuthor());
		   c.setPrice(Double.parseDouble(b.getPrice()));
		   c.setTotal(Double.parseDouble(b.getPrice()));
		   
		 CartDAOImpl dao1=new CartDAOImpl(DBConnect.getConn());
		     boolean f=dao1.addToCart(c);
		     HttpSession sess=req.getSession();
		     if(f) {
		    	 sess.setAttribute("addCart","Book added to cart");
		    	 resp.sendRedirect("all_new_book.jsp");
		     }else {
		    	 sess.setAttribute("failedMsg","Opps! Something went wrong on server...");
		    	 resp.sendRedirect("all_new_book.jsp");
		    	
		     }
	}catch(Exception e) {
		e.printStackTrace();
	}
	}
	

}
