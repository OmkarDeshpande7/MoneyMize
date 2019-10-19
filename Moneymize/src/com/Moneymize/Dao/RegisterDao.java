package com.Moneymize.Dao;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class RegisterDao {
	String sql1 = "select * from user where phone=?";
	String sql2 = "insert into user values(?,?,?,?,?)";
	 String sql7 = "select * from user where phone=?";

	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&allowPublicKeyRetrieval=true";
	String username = "root";
	String password = "#ironmanROCKX64";
	private Connection con;	
	public boolean check(String uname)
	{
	
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
		    System.out.println("connecting...db");
			PreparedStatement st = con.prepareStatement(sql1);
			st.setString(1, uname);
		
			System.out.println("connecting...");
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
			System.out.println("successfullly connected");
				return false;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean insert(String username,String password,String email,String name,int wallet)
	{
		try {

		PreparedStatement st = con.prepareStatement(sql2);
		st.setString(1, username);
		st.setString(2, email);
		st.setString(3, name);
		st.setInt(4, wallet);
		st.setString(5, password);
	
		System.out.println("connecting...");
		int rs = st.executeUpdate();
		
		
		return true;
		
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}
		return false;
	}

}
