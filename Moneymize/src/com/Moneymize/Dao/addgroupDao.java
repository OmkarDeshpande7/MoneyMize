package com.Moneymize.Dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Moneymize.info.notification;
import com.Moneymize.info.pendingpersonalrequests;
import com.Moneymize.info.personalevent;

public class addgroupDao {
	
	String sql1 = "call insertuseringroup(?,?,?)";
	String sql3 = "call savegroupevent(?,NOW(),?,?)";
	String sql2 = "select * from personalevent where lender=? or borrower=?";
	String sql4 = "select * from pendingpersonalrequests where borrower=?";
	String sql5 = "select * from pendingpersonalrequests where pid = ?";
	String sql6 = "	select *  from groupevent where owner = ? and totalAmt =? and description=?";
	String sql7 = "select * from user where phone=?";
	String sql15 = "select * from notification where user=?";

		String url = "jdbc:mysql://localhost:3306/Moneymize?allowPublicKeyRetrieval=true";
		String username = "root";
		String password = "123456";
		int pid;
		private Connection con;	
		
   public void addGroup(String description,int totalamt,String owner,HttpServletRequest request) 
   {
	   HttpSession session = request.getSession();
		ArrayList<notification> nevents=(ArrayList<notification>) session.getAttribute("nevents");  
		String outerArray=request.getParameter("list");
		String[] innerArray=outerArray.split(",");
		String uname = (String)session.getAttribute("phone");
	   //pid = Integer.parseInt(request.getParameter("reqId"));
	   ArrayList<personalevent> peventstr=(ArrayList<personalevent>) session.getAttribute("pevents");
	   ArrayList<pendingpersonalrequests> requestr=(ArrayList<pendingpersonalrequests>) session.getAttribute("requests");	
	 try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
	   
		    con = DriverManager.getConnection(url,username,password);
		    
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
				
				PreparedStatement st8 = con.prepareStatement(sql3);
				st8.setString(1, description);
				st8.setInt(2, totalamt);
				st8.setString(3, owner);
				ResultSet rs8 = st8.executeQuery();
				System.out.println("group added");
				if(rs8.last())
				{
					System.out.println(rs8.getInt(1));
					PreparedStatement st9 = con.prepareStatement(sql1);

					for(int i=0;i<innerArray.length;i++){
					st9.setInt(1, totalamt/(innerArray.length + 1));
					st9.setInt(2, rs8.getInt(1));
					st9.setString(3, innerArray[i]);
					ResultSet rs9 = st9.executeQuery();
					System.out.println("user added");
					}
				}
				session.setAttribute("nevents",nevents);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}
