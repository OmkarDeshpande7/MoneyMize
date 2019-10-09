package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Moneymize.info.pendingpersonalrequests;
import com.Moneymize.info.personalevent;

public class groupeventDao {
	
	String sql1 = "call savegroupevent(?,?,?,?)";
	String sql2 = "select * from personalevent where lender=? or borrower=?";
	 String sql4 = "select * from pendingpersonalrequests where borrower=?";
	 String sql7 = "select * from user where phone=?";

		String url = "jdbc:mysql://localhost:3306/Moneymize?allowPublicKeyRetrieval=true";
		String username = "root";
		String password = "#ironmanROCKX64";
		int pid;
		private Connection con;	
		
   public void savegroupevent(String description,String date,int totalamt,String owner,HttpServletRequest request) 
   {
	   HttpSession session = request.getSession();
	   @SuppressWarnings("unchecked")
	ArrayList<personalevent> peventstr=(ArrayList<personalevent>) session.getAttribute("pevents");
	@SuppressWarnings("unchecked")
	ArrayList<pendingpersonalrequests> requestr=(ArrayList<pendingpersonalrequests>) session.getAttribute("requests");	
	 try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
			PreparedStatement st1 = con.prepareStatement(sql1);
			st1.setString(1,description);
			st1.setString(2,date);
			st1.setInt(3,totalamt);
			st1.setString(4,owner);
			st1.executeQuery();
			String uname = (String) session.getAttribute("phone");
			
			peventstr.clear();
			requestr.removeAll(requestr);
			
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
