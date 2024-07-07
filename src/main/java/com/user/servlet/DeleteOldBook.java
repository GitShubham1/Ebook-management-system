package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/deleteOldBook")
public class DeleteOldBook extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em=req.getParameter("em");
			int bid=Integer.parseInt(req.getParameter("bid"));
			System.out.println("line28:"+bid);
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.oldBookDelete(em,"Old",bid);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("successMsg","Old Book Deleted Successfully👍");
				resp.sendRedirect("OldBook.jsp");
			}else {
				session.setAttribute("errMsg","Opps🙄!Something went wrong on server");
				resp.sendRedirect("OldBook.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
