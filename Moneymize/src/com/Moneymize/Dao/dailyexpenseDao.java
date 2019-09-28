package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class dailyexpenseDao 
{
	String sql0 = "INSERT INTO dailyexpense (user,totalAmount,date) values (?,?,?)";
	String sql1 = "INSERT INTO dailycategory (expenseId,categoryId,amount) values (?,?,?)";
	String sql2 = "select name from categories where categoryId=?";
	String sql3 = "select * from dailycategory where expenseId=?";
	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&useSSL=false";
	
	String username = "root";
	String password = "123456";
	private Connection con;	
	public boolean insertDaily(int category,int categoryamount,java.sql.Date date,String uname)
	{
	
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
		    System.out.println("connecting...db");
			PreparedStatement st = con.prepareStatement(sql0);
			st.setString(1, uname);
			st.setInt(2, categoryamount);
			st.setDate(3, date);
			System.out.println("connecting...");
			 st.executeUpdate();
			 ResultSet rs = st.getGeneratedKeys();
			int expenseid = rs.getInt("expenseIdd");
			
			
			PreparedStatement st1 = con.prepareStatement(sql1);
			System.out.println("connecting...");
			st1.setInt(1, expenseid);
			st1.setInt(2, category);
			st1.setInt(3, categoryamount);
			int rs1 = st1.executeUpdate();			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return true;
	}
}
