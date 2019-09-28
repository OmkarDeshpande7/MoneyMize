package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Walletdao 
{
	String sql1 = "update user set wallet=? where phone=?";
	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&useSSL=false";
	String username = "root";
	String password = "123456";
	private Connection con;	
	public boolean add(String phone,int wallet)
	{
	
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
		    System.out.println("connecting...db");
			PreparedStatement st = con.prepareStatement(sql1);
			st.setInt(1, wallet);
			st.setString(2, phone);
			System.out.println("connecting...");
			st.executeUpdate();
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return true;
	}
	
}
