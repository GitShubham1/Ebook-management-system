package com.admin.servlet;

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

@WebServlet("/add_book")
@MultipartConfig

public class BooksAdd extends HttpServlet {

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
			String category=req.getParameter("btype");
			String status=req.getParameter("bstatus");
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			//System.out.println(bookname+" "+author+" "+price+" "+category+" "+status+" "+fileName);
			
			BookDtls b=new BookDtls(bookname,author,price,category,status,fileName,"admin");
			 BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			    
			 boolean f=dao.addBooks(b);
			 HttpSession session=req.getSession();
			 if(f) {
				 String path=getServletContext().getRealPath("")+"books";
				 System.out.println(path);
			     File file=new File(path);
			     part.write(path+File.separator+fileName);
				 session.setAttribute("successmsg","book add successfully!");
				 resp.sendRedirect("admin/add_books.jsp");
			 }else {
				 session.setAttribute("errMsg","something went wrong");
				 resp.sendRedirect("admin/add_books.jsp");
			 }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
