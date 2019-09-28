package com.Moneymize.Dao;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.info.pendingpersonalrequests;

public class rejectRequestdao {
	
	String sql1 = "delete from pendingpersonalrequests where pid=?";
	 String sql4 = "select * from pendingpersonalrequests where borrower=?";
	 String sql7 = "select * from user where phone=?";

		String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&useSSL=false";
		String username = "root";
		String password = "#ironmanROCKX64";
		int pid;
		private Connection con;	
		
   
   public void reject(int pid,HttpServletRequest request) 
   {
	   HttpSession session = request.getSession();
	  
	   
	ArrayList<pendingpersonalrequests> requestr=(ArrayList<pendingpersonalrequests>) session.getAttribute("requests");	
	 try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
	   
		    con = DriverManager.getConnection(url,username,password);
			PreparedStatement st1 = con.prepareStatement(sql1);
			st1.setInt(1,pid);
			st1.executeUpdate();
			String uname = (String) session.getAttribute("phone");
			System.out.println(requestr.size());
			
			requestr.removeAll(requestr);
			
			PreparedStatement st3 = con.prepareStatement(sql4);
			st3.setString(1, uname);
			ResultSet rs3 = st3.executeQuery();
			if(rs3.absolute(1))
			{
				PreparedStatement st2 = con.prepareStatement(sql4);
				st2.setString(1, uname);
				ResultSet rs2 = st2.executeQuery();
				while(rs2.next())
				{
					pendingpersonalrequests newrequestss = new pendingpersonalrequests();
					newrequestss.setAmount((Integer.parseInt(rs2.getString(1))));
					newrequestss.setBorrower(rs2.getString(3));
					newrequestss.setLender(rs2.getString(2));
					newrequestss.setId(Integer.parseInt(rs2.getString(4)));
					requestr.add(newrequestss);
					session.setAttribute("requests",requestr);
				}
			
			}
			else
			{
				session.setAttribute("requests",requestr);
			}
			PreparedStatement st7 = con.prepareStatement(sql7);
			st7.setString(1, uname);
			ResultSet rs7 = st7.executeQuery();
			if(rs7.absolute(1))
			{
				String wallets = rs7.getString(4);
				session.setAttribute("walletst",wallets);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}
