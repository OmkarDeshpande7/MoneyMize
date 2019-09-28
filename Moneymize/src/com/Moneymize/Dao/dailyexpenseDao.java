package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class dailyexpenseDao 
{
	String sql0 = "INSERT INTO dailyexpenses (user,total_amount,date) values (?,?,?)";
	String sql1 = "INSERT INTO dailycategory (expenseId,categoryId,amount) values (?,?,?)";
	String sql2 = "select name from categories where categoryId=?";
	String sql3 = "select * from dailycategory where expenseId=?";
	 String sql7 = "select * from user where phone=?";

	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&useSSL=false";
	
	String username = "root";
	String password = "#ironmanROCKX64";
	private Connection con;	
	public boolean insertDaily(int category,int categoryamount,Date date,String uname,HttpServletRequest request)
	{
		HttpSession session = request.getSession();

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
		    System.out.println("connecting...db");
			PreparedStatement st = con.prepareStatement(sql0);
			st.setString(1, uname);
			st.setInt(2, categoryamount);
			st.setDate(3, (java.sql.Date) date);
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
			
			PreparedStatement st7 = con.prepareStatement(sql7);
			st7.setString(1, uname);
			ResultSet rs7 = st7.executeQuery();
			if(rs7.absolute(1))
			{
				String wallets = rs7.getString(4);
				session.setAttribute("walletst",wallets);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return true;
	}
}
