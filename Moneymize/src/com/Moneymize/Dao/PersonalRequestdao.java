package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class PersonalRequestdao 
{
	String url = "jdbc:mysql://localhost:3306/Moneymize?allowPublicKeyRetrieval=true";
	String username = "root";
	String sql1 = "select * from pendingpersonalrequests where lender=?";
	String sql = "insert into  pendingpersonalrequests (amount,lender,borrower) values(?,?,?)";
	 String sql7 = "select * from user where phone=?";

	String password = "123456";
	private Connection con;	
	
	
	public boolean createrequest(String lender,String borrower,String amount,HttpServletRequest request){
		
	try {
		HttpSession session = request.getSession();

		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection(url,username,password);
	    System.out.println("connecting...db");
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,amount);
		st.setString(2,lender);
		st.setString(3,borrower);

		System.out.println("connecting...");
		int rs = st.executeUpdate();
		String uname = (String) session.getAttribute("phone");
		PreparedStatement st7 = con.prepareStatement(sql7);
		st7.setString(1, uname);
		ResultSet rs7 = st7.executeQuery();
		if(rs7.absolute(1))
		{
			String wallets = rs7.getString(4);
			session.setAttribute("walletst",wallets);
		}
		return true;
		
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}
		return false;
	}
}

