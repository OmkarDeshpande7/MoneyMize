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

import com.Moneymize.info.notification;
import com.Moneymize.info.pendingpersonalrequests;

public class rejectRequestdao {
	String sql = "select * from pendingpersonalrequests where pid=?";
	String sql1 = "delete from pendingpersonalrequests where pid=?";
	String sql2 = "insert into notification(time,descreption,user) values(NOW(),?,?)";
	 String sql4 = "select * from pendingpersonalrequests where borrower=?";
	 String sql7 = "select * from user where phone=?";
		String sql15 = "select * from notification where user=?";

		String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&allowPublicKeyRetrieval=true";
		String username = "root";
		String password = "#ironmanROCKX64";
		int pid;
		private Connection con;	
		
   
   public void reject(int pid,HttpServletRequest request) 
   {
	   HttpSession session = request.getSession();
	  
		ArrayList<notification> nevents=(ArrayList<notification>) session.getAttribute("nevents");  

	ArrayList<pendingpersonalrequests> requestr=(ArrayList<pendingpersonalrequests>) session.getAttribute("requests");	
	 try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
	   
		    con = DriverManager.getConnection(url,username,password);
		    
		    PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, pid);
			ResultSet rs = st.executeQuery();
			rs.next();
		    String Lender = rs.getString(2);
		    String uname = (String) session.getAttribute("phone");
		    String user_name = (String) session.getAttribute("user_name");

		    int amount = Integer.parseInt(rs.getString(1));
			String message = user_name + "(" + uname + ") has rejected your request that you had lend amount :" + amount + "to" + user_name;

			PreparedStatement st12 = con.prepareStatement(sql2);
			st12.setString(1,message);
			st12.setString(2,Lender);
			System.out.println("connecting...");
			int rs12 = st12.executeUpdate();
			
			PreparedStatement st1 = con.prepareStatement(sql1);
			st1.setInt(1,pid);
			st1.executeUpdate();
			System.out.println(requestr.size());
			
			requestr.removeAll(requestr);
			nevents.clear();
			
			PreparedStatement st15 = con.prepareStatement(sql15);
			st15.setString(1, uname);
			ResultSet rs15 = st15.executeQuery();
			
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
				
				while(rs15.next())
				{
					notification noificationevent = new notification();
					noificationevent.setDate(rs15.getString(1));
					noificationevent.setMessage(rs15.getString(2));
					nevents.add(noificationevent);
					session.setAttribute("nevents",nevents);
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
			session.setAttribute("nevents",nevents);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}
