package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

@WebServlet("/verifyUser")
public class VerifyUserServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     try {
    	 UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
    	 HttpSession session = req.getSession();
    	 String email = req.getParameter("email");
    	 System.out.println("email at line 29 :"+email);
    	 boolean f=dao.checkEmail(email);
    	 System.out.println("line30--->"+f);
    	 if(f) {
				
				  session.setAttribute("userEmail", email);
				  resp.sendRedirect("changepassword.jsp");
				  
				 
    		 
    		 }else {
    		 session.setAttribute("errMsg", "email does not exist.");
    		 resp.sendRedirect("verifyUser.jsp");
    	 }
    	 
    	 
     }catch(Exception e) {
    	 e.printStackTrace();
     }
     
	}
	

}
