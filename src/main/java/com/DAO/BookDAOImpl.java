package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO{
	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDtls b) {
		boolean f=false;
		try {
			String sql="insert into book_dtls(bookname,author,price,bookCategory,photo,user_email,status)values(?,?,?,?,?,?,?) ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3,b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5,b.getPhotoName());
			ps.setString(6, b.getEmail());
			ps.setString(7,b.getStatus());
			  int i=ps.executeUpdate();
			  if(i==1) {
				   f=true;
			  }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<BookDtls> getAllBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
		String sql	="select * from book_dtls";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			b=new BookDtls();
			b.setBookid(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookCategory(rs.getString(5));
			b.setPhotoName(rs.getString(6));
			b.setEmail(rs.getString(7));
			b.setStatus(rs.getString(8));
			list.add(b);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
		BookDtls b=null;
		try {
		String sql=	"select * from book_dtls where bookid=? ";
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ps.setInt(1, id);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next()) {
			  b=new BookDtls();
			  b.setBookid(rs.getInt(1));
			  b.setBookname(rs.getString(2));
			  b.setAuthor(rs.getString(3));
			  b.setPrice(rs.getString(4));
			  b.setBookCategory(rs.getString(5));
			  b.setPhotoName(rs.getString(6));
			  b.setEmail(rs.getString(7));
			  b.setStatus(rs.getString(8));
		  }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return b;
		
	}

	@Override
	public boolean updateEditBooks(BookDtls b) {
		boolean f=false;
		try {
			String sql="update book_dtls set bookname=?,author=?,price=?,status=? where bookid=?";
			 PreparedStatement ps=conn.prepareStatement(sql);
			 ps.setString(1, b.getBookname());
			 ps.setString(2, b.getAuthor());
			 ps.setString(3, b.getPrice());
			 ps.setString(4,b.getStatus());
			 ps.setInt(5,b.getBookid());
			 
			 int i=ps.executeUpdate();
			 
			 if(i==1) {
				 f=true;
			 }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql="delete from book_dtls where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getNewBook() {
		List<BookDtls> list=new ArrayList<>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2, "Active");
			  ResultSet rs=ps.executeQuery();
			  int i=1;
			  while(rs.next()&& i<=4) {
				  b=new BookDtls();
				  b.setBookid(rs.getInt(1));
				  b.setBookname(rs.getString(2));
				  b.setAuthor(rs.getString(3));
				  b.setPrice(rs.getString(4));
				  b.setBookCategory(rs.getString(5));
				  b.setPhotoName(rs.getString(6));
				  b.setEmail(rs.getString(7));
				  b.setStatus(rs.getString(8));
				  list.add(b);
				  i++;
			  }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBook() {
		List<BookDtls> list=new ArrayList<>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where status=? order by bookid desc";
			  PreparedStatement ps=conn.prepareStatement(sql);
			  ps.setString(1,"Active");
			  ResultSet rs=ps.executeQuery();
			  int i=1;
			  while(rs.next() && i<=4) {
				  b=new BookDtls();
				  b.setBookid(rs.getInt(1));
				  b.setBookname(rs.getString(2));
				  b.setAuthor(rs.getString(3));
				  b.setPrice(rs.getString(4));
				  b.setBookCategory(rs.getString(5));
				  b.setPhotoName(rs.getString(6));
				  b.setEmail(rs.getString(7));
				  b.setStatus(rs.getString(8));
				  list.add(b);
				  i++;
			  }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<BookDtls> getOldBook() {
		List<BookDtls> list2=new ArrayList<>();
		BookDtls b2=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			 ps.setString(1,"old");
			 ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4 ) {
				b2=new BookDtls();
				b2.setBookid(rs.getInt(1));
				b2.setBookname(rs.getString(2));
				b2.setAuthor(rs.getString(3));
				b2.setPrice(rs.getString(4));
				b2.setBookCategory(rs.getString(5));
				b2.setPhotoName(rs.getString(6));
				b2.setEmail(rs.getString(7));
				b2.setStatus(rs.getString(8));
				list2.add(b2);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list2;
	}

	@Override
	public List<BookDtls> getAllRecentBook() {
		List<BookDtls> list=new ArrayList<>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where status=? order by bookid desc";
			  PreparedStatement ps=conn.prepareStatement(sql);
			  ps.setString(1,"Active");
			  ResultSet rs=ps.executeQuery();
			  
			  while(rs.next()) {
				  b=new BookDtls();
				  b.setBookid(rs.getInt(1));
				  b.setBookname(rs.getString(2));
				  b.setAuthor(rs.getString(3));
				  b.setPrice(rs.getString(4));
				  b.setBookCategory(rs.getString(5));
				  b.setPhotoName(rs.getString(6));
				  b.setEmail(rs.getString(7));
				  b.setStatus(rs.getString(8));
				  list.add(b);
				 
			  }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list=new ArrayList<>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2, "Active");
			  ResultSet rs=ps.executeQuery();
			
			  while(rs.next()) {
				  b=new BookDtls();
				  b.setBookid(rs.getInt(1));
				  b.setBookname(rs.getString(2));
				  b.setAuthor(rs.getString(3));
				  b.setPrice(rs.getString(4));
				  b.setBookCategory(rs.getString(5));
				  b.setPhotoName(rs.getString(6));
				  b.setEmail(rs.getString(7));
				  b.setStatus(rs.getString(8));
				  list.add(b);
				 
			  }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	

	@Override
	public List<BookDtls> getAllOldBook() {
		List<BookDtls> list2=new ArrayList<>();
		BookDtls b2=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			 ps.setString(1,"Old");
			 ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b2=new BookDtls();
				b2.setBookid(rs.getInt(1));
				b2.setBookname(rs.getString(2));
				b2.setAuthor(rs.getString(3));
				b2.setPrice(rs.getString(4));
				b2.setBookCategory(rs.getString(5));
				b2.setPhotoName(rs.getString(6));
				b2.setEmail(rs.getString(7));
				b2.setStatus(rs.getString(8));
				list2.add(b2);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list2;
	}

	@Override
	public List<BookDtls> getBookByOld(String email, String category) {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and user_email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String category, int bid) {
		boolean f=false;
		try {
			String sql="delete from book_dtls where bookCategory=? and user_email=? and bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2,email);
			ps.setInt(3,bid);
			int i=ps.executeUpdate();
			 if(i==1) {
				 f=true;
			 }
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return f;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"%"+ch+"%");
			ps.setString(2,"%"+ch+"%");
			ps.setString(3,"%"+ch+"%");
			ps.setString(4,"Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	}
	
	
	
	
     
	

