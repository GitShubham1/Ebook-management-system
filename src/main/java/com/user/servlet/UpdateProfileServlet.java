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
import com.entity.User;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        	int id=Integer.parseInt(req.getParameter("id"));
        	String name=req.getParameter("fname");
        	String email=req.getParameter("email");
        	String phno=req.getParameter("phno");
        	String pass=req.getParameter("password");
			
        	User us=new User();
        	us.setId(id);
        	us.setName(name);
        	us.setEmail(email);
        	us.setPhno(phno);
        	
        	UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
        	HttpSession session=req.getSession();
        	boolean f=dao.checkPassword(id, pass);
        	if(f) {
        		 boolean f2=dao.updateProfile(us);
        		 
        		 if(f2) {
        			 session.setAttribute("successMsg","Profile Update successfully.");
        			 resp.sendRedirect("editProfile.jsp");
        		 }else {
        			 session.setAttribute("errMsg","Opps, something went wrong on server.");
        			 resp.sendRedirect("editProfile.jsp");
        		 }
        	}else {
        		session.setAttribute("errMsg","Your password is incorrect");
   			 resp.sendRedirect("editProfile.jsp");
        	}
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
