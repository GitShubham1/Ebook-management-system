package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("paymentType");

			String fullAddress = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;

			/*
			 * System.out.println(id + " " + name + " " + email + " " + phno + " " +
			 * fullAddress + " " + paymentType);
			 */

		
			  CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			  List<Cart> blist=dao.getBookByUser(id);
			 
			  if(blist.isEmpty()) {
				  session.setAttribute("errMsg", "Add Items");
				  resp.sendRedirect("cart.jsp");
				  
			  }else {
				  BookOrderDAOImpl dao2=new BookOrderDAOImpl(DBConnect.getConn());
					 
				  
				  Book_Order o=null;
				   
				  ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
				  Random rnd=new Random();
				   for(Cart c:blist) {
					   o=new Book_Order();
					  o.setOrderId("Book-ORD-00"+rnd.nextInt(1000));
					  o.setUserName(name);
					  o.setEmail(email);
					  o.setPhno(phno);
					  o.setFullAddress(fullAddress);
					  o.setBookName(c.getBookname());
					  o.setAuthor(c.getAuthor());
					  o.setPrice(c.getPrice()+"");
					  o.setPaymentType(paymentType);
					  orderList.add(o);
					 
					 // System.out.println(c.getBookname()+" "+c.getAuthor()+" "+c.getPrice());
				  }
				 
				 if("noselect".equals(paymentType)) {
					 session.setAttribute("errMsg", "Please choose payment method");
					 resp.sendRedirect("cart.jsp"); 
				  }
				 else {
				     boolean f=dao2.saveOrder(orderList);
				     if(f) {
							/* System.out.println("Order Successful"); */
				    	 resp.sendRedirect("order_success.jsp");
				     }else {
				    	/* System.out.println("Order Failed");*/
				    	 session.setAttribute("errMsg","Your order failed");
				    	 resp.sendRedirect("cart.jsp");
				     }
				  }

			  }
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
