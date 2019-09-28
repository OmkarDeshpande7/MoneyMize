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
	String sql0 ="call savedailyexpenses(?,?,?)"; 
	 String sql7 = "select * from user where phone=?";

	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&useSSL=false";
	
	String username = "root";
	String password = "#ironmanROCKX64";
	private Connection con;	
	public boolean insertDaily(String category,int categoryamount,String uname,HttpServletRequest request)
	{
		HttpSession session = request.getSession();

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
		    System.out.println("connecting...db");
			
		    PreparedStatement st = con.prepareStatement(sql0);
			st.setString(1, uname);
			st.setInt(2, categoryamount);
			st.setString(3, category);
			System.out.println("connecting...");
			st.executeUpdate();
			 
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
