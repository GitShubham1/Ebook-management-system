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
@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 try {
		 String email=req.getParameter("userEmail");
		 String newPassword = req.getParameter("password");
		 
		 UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
		 HttpSession session=req.getSession();
		 
		 User us=dao.getCurrentPassword(email);
		 
		 if(us==null) {
			 session.setAttribute("errMsg","user not found.");
			 resp.sendRedirect("changepassword.jsp");
			 return;
		 }
		 
		 if(us.getPassword().equals(newPassword)) {
			 session.setAttribute("errMsg","you have used this password earlier 3-4 times.Please use another password.");
			 resp.sendRedirect("changepassword.jsp");
			 return;
		 }
		 
		 
			 User updatedUser=new User();
			 updatedUser.setEmail(email);
			 updatedUser.setPassword(newPassword);
			 
			
			 boolean isUpdated=dao.updatePassword(updatedUser);
			 
			 if(isUpdated) {
					/* System.out.println("password update successfully."); */
				 session.setAttribute("succMsg", "password update successfully.");
				 resp.sendRedirect("Login.jsp");
			 }else {
					/* System.out.println("password can not be update due to technical issue."); */
				 session.setAttribute("errMsg","can not update password.");
				 resp.sendRedirect("changepassword");
			 }
			 
		 
		 
		 
		
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
	}

	
	

}
