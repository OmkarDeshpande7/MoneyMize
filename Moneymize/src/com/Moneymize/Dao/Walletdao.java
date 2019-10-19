package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Walletdao 
{
	String sql1 = "update user set wallet=? where phone=?";
	 String sql7 = "select * from user where phone=?";

	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&allowPublicKeyRetrieval=true";
	String username = "root";
	String password = "#ironmanROCKX64";
	private Connection con;	
	public boolean add(String phone,int wallet,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
		    System.out.println("connecting...db");
			PreparedStatement st = con.prepareStatement(sql1);
			st.setInt(1, wallet);
			st.setString(2, phone);
			System.out.println("connecting...");
			st.executeUpdate();
			
			String uname = (String) session.getAttribute("phone");
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
