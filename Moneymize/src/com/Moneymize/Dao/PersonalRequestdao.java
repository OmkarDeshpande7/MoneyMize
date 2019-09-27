package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class PersonalRequestdao 
{
	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&useSSL=false";
	String username = "root";
	String sql1 = "select * from pendingpersonalrequests where lender=?";
	String sql = "insert into  pendingpersonalrequests (amount,lender,borrower) values(?,?,?)"; 
	String password = "#ironmanROCKX64";
	private Connection con;	
	
	
	public boolean createrequest(String lender,String borrower,String amount){
		
	try {
		
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection(url,username,password);
	    System.out.println("connecting...db");
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,amount);
		st.setString(2,lender);
		st.setString(3,borrower);

		System.out.println("connecting...");
		int rs = st.executeUpdate();
		return true;
		
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}
		return false;
	}
}

