package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO{
 private Connection conn;

public UserDAOImpl(Connection conn) {
	super();
	this.conn = conn;
}

@Override
public boolean userRegister(User us) {
	boolean f=false;
	
	try {
		String sql="insert into users(name, email, phoneno,password) values(?,?,?,?)";
		   PreparedStatement ps=conn.prepareStatement(sql);
		   ps.setString(1, us.getName());
		   ps.setString(2, us.getEmail());
		   ps.setString(3, us.getPhno());
		   ps.setString(4, us.getPassword());
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
public User login(String email, String password) {
	User us=null;
			try {
				String sql="select * from users where email=? and password=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2,password);
				
				ResultSet rs=ps.executeQuery();
				 while(rs.next()) {
					 us=new User();
					 us.setId(rs.getInt(1));
					 us.setName(rs.getString(2));
					 us.setEmail(rs.getString(3));
					 us.setPhno(rs.getString(4));
					 us.setPassword(rs.getString(5));
					 us.setAddress(rs.getString(6));
					 us.setLandmark(rs.getString(7));
					 us.setCity(rs.getString(8));
					 us.setState(rs.getString(9));
					 us.setPincode(rs.getString(10));
					 
				 }
				
			}catch(Exception e) {
				e.printStackTrace();
			}
    return us;
}

@Override
public boolean checkPassword(int id, String pass) {
	boolean f=false;
	try {
		String sql="select * from users where id=? and password=?";
		 PreparedStatement ps=conn.prepareStatement(sql);
		 ps.setInt(1, id);
		 ps.setString(2, pass);
		 
		 ResultSet rs=ps.executeQuery();
		 while(rs.next()) {
			 f=true;
		 }
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
}

@Override
public boolean updateProfile(User us) {
	boolean f=false;
	try {
		String sql="update users set name=?,email=?,phoneno=? where id=? ";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,us.getName());
		ps.setString(2, us.getEmail());
		ps.setString(3, us.getPhno());
		ps.setInt(4, us.getId());
		int i=ps.executeUpdate();
		
		if(i==1) {
			f=true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
}

@Override
public boolean checkUser(String email) {
	boolean f=true;
	 try {
		String sql="select * from users where email=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			f=false;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
}

@Override
public User getCurrentPassword(String email) {
	User us =null;
	String sql = "select * from users where email=?";
	try (PreparedStatement ps = conn.prepareStatement(sql)){
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			us = new User();
			us.setEmail(rs.getString("email"));
			us.setPassword(rs.getString("password"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return us;
}

@Override
public boolean updatePassword(User u) {
	boolean f=false;
	try {
		String sql="update users set password=? where email=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, u.getPassword());
		ps.setString(2, u.getEmail());
		int i=ps.executeUpdate();
		if(i==1) {
			f=true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
}

@Override
public boolean checkEmail(String email) {
	boolean f=false;
	try {
		String sql="select * from users where email=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, email);
		  try(ResultSet rs=ps.executeQuery()){
		     f=rs.isBeforeFirst();	 
		 
		  };
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return f;
}



}


