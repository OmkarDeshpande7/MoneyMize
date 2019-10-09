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
import com.Moneymize.info.personalevent;

public class payDao {
	
	String sql1 = "call paymoney(?)";
	String sql2 = "select * from personalevent where lender=? or borrower=?";
	String sql3 = "select * from personalevent where eid=?";
	 String sql4 = "select * from pendingpersonalrequests where borrower=?";
	 String sql7 = "select * from user where phone=?";
		String sql12 = "insert into notification(time,descreption,user) values(NOW(),?,?)";
		String sql15 = "select * from notification where user=?";

		String url = "jdbc:mysql://localhost:3306/Moneymize?allowPublicKeyRetrieval=true";
		String username = "root";
		String password = "#ironmanROCKX64";
		int pid;
		private Connection con;	
		
   
   public void pay(int eid,HttpServletRequest request) 
   {
	   HttpSession session = request.getSession();
		ArrayList<notification> nevents=(ArrayList<notification>) session.getAttribute("nevents");  

	   ArrayList<personalevent> peventstr=(ArrayList<personalevent>) session.getAttribute("pevents");
	ArrayList<pendingpersonalrequests> requestr=(ArrayList<pendingpersonalrequests>) session.getAttribute("requests");	
	 try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
	   
		    con = DriverManager.getConnection(url,username,password);
		    
		    PreparedStatement st = con.prepareStatement(sql3);
			st.setInt(1, eid);
			ResultSet rs = st.executeQuery();
			rs.next();
			String Lender = rs.getString(2);
		    String uname = (String) session.getAttribute("phone");
		    String user_name = (String) session.getAttribute("user_name");
		    int amount = Integer.parseInt(rs.getString(1));
			String message = user_name + "(" + uname + ") has paid you amount :" + amount;

			PreparedStatement st12 = con.prepareStatement(sql12);
			st12.setString(1,message);
			st12.setString(2,Lender);
			System.out.println("connecting...");
			int rs12 = st12.executeUpdate();
			
		    if(Integer.parseInt((String)session.getAttribute("walletst"))>amount){
			PreparedStatement st1 = con.prepareStatement(sql1);
			st1.setInt(1,eid);
			st1.executeUpdate();
		    }
			
			peventstr.clear();
			requestr.removeAll(requestr);
			nevents.clear();
			
			PreparedStatement st15 = con.prepareStatement(sql15);
			st15.setString(1, uname);
			ResultSet rs15 = st15.executeQuery();
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
				
				
				PreparedStatement st4 = con.prepareStatement(sql2);
				st4.setString(1, uname);
				st4.setString(2, uname);
				ResultSet rs4 = st4.executeQuery();
				while(rs4.next())
				{
					
					
					personalevent neweventss = new personalevent();
					
					neweventss.setAmount((Integer.parseInt(rs4.getString(1))));
					neweventss.setBorrower(rs4.getString(3));
					neweventss.setLender(rs4.getString(2));
					neweventss.setEid(Integer.parseInt(rs4.getString(4)));
					peventstr.add(neweventss);
					session.setAttribute("pevents",peventstr);
					
				}
				
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

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}
