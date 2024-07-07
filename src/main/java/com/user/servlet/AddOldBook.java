package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
@WebServlet("/addOldBook")
@MultipartConfig
public class AddOldBook extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String category="Old";
			String status="Active";
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			String useremail=req.getParameter("user");
		
			
			BookDtls b=new BookDtls(bookname,author,price,category,status,fileName,useremail);
			 BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			    
			 boolean f=dao.addBooks(b);
			 HttpSession session=req.getSession();
			 if(f) {
				 String path=getServletContext().getRealPath("")+"books";
				 System.out.println(path);
			     File file=new File(path);
			     part.write(path+File.separator+fileName);
				 session.setAttribute("successmsg","book add successfully!");
				 resp.sendRedirect("sellBook.jsp");
			 }else {
				 session.setAttribute("errMsg","something went wrong");
				 resp.sendRedirect("sellBook.jsp");
			 }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
