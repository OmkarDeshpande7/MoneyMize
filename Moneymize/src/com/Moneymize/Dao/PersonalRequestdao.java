package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Moneymize.info.notification;

public class PersonalRequestdao 
{
	String url = "jdbc:mysql://localhost:3306/Moneymize?allowPublicKeyRetrieval=true";
	String username = "root";
	String sql1 = "select * from pendingpersonalrequests where lender=?";
	String sql = "insert into  pendingpersonalrequests (amount,lender,borrower) values(?,?,?)";
	String sql2 = "insert into notification(time,descreption,user) values(NOW(),?,?)";
	 String sql7 = "select * from user where phone=?";
		String sql15 = "select * from notification where user=?";


	String password = "#ironmanROCKX64";
	private Connection con;	
	
	
	public boolean createrequest(String lender,String borrower,String amount,HttpServletRequest request){
		
	try {
		HttpSession session = request.getSession();
		ArrayList<notification> nevents=(ArrayList<notification>) session.getAttribute("nevents");  

		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection(url,username,password);
	    System.out.println("connecting...db");
	    if(Integer.parseInt((String)session.getAttribute("walletst"))>Integer.parseInt(amount)){
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,amount);
		st.setString(2,lender);
		st.setString(3,borrower);
		System.out.println("connecting...");
		int rs = st.executeUpdate();
	    }
		String uname = (String) session.getAttribute("phone");
		String phone = borrower; 
		String user_name = (String) session.getAttribute("user_name");
		String message = user_name + "(" + uname + ") has requested that you had borrowed amount :" + amount;
		PreparedStatement st2 = con.prepareStatement(sql2);
		
		st2.setString(1,message);
		st2.setString(2,borrower);
		System.out.println("connecting...");
		int rs2 = st2.executeUpdate();
		
		nevents.clear();
		
		PreparedStatement st15 = con.prepareStatement(sql15);
		st15.setString(1, uname);
		ResultSet rs15 = st15.executeQuery();
		
		while(rs15.next())
		{
			notification noificationevent = new notification();
			noificationevent.setDate(rs15.getString(1));
			noificationevent.setMessage(rs15.getString(2));
			nevents.add(noificationevent);
			session.setAttribute("nevents",nevents);
		}
		
		PreparedStatement st7 = con.prepareStatement(sql7);
		st7.setString(1, uname);
		ResultSet rs7 = st7.executeQuery();
		if(rs7.absolute(1))
		{
			String wallets = rs7.getString(4);
			session.setAttribute("walletst",wallets);
		}
		
		session.setAttribute("nevents",nevents);

		return true;
		
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}
		return false;
	}
}

