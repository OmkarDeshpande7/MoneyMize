package com.Moneymize.Dao;
import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Moneymize.info.dailyexpense;
import com.Moneymize.info.groupevent;
import com.Moneymize.info.pendingpersonalrequests;
import com.Moneymize.info.personalevent;



public class LoginDao {
	String sql1 = "select * from user where phone=? and password=?";
	String sql2 = "select * from personalevent where lender=? or borrower=?";
	String sql3 = "select * from pendingpersonalrequests where borrower=?";
	String sql4 = "select * from groupevent where owner=?";
	 String sql7 = "select * from user where phone=?";
	 String sql8 = "select * from dailycategory where expenseId=(select expenseId from dailyexpenses where user =? and Date=CURRENT_DATE)";
	 

	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&useSSL=false";
	String username = "root";
	String password = "#ironmanROCKX64";
	
	private Connection con;	
	
	List<pendingpersonalrequests> requests = new ArrayList<pendingpersonalrequests>();
	List<pendingpersonalrequests> sample = new ArrayList<pendingpersonalrequests>();
	List<personalevent> pevents = new ArrayList<personalevent>();
	List<groupevent> gevents = new ArrayList<groupevent>();
	List<dailyexpense> devents = new ArrayList<dailyexpense>();
	


	public boolean check(String uname,String pass,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
		    System.out.println("connecting...db");
			PreparedStatement st = con.prepareStatement(sql1);
			st.setString(1, uname);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			if(rs.absolute(1))
			{
				PreparedStatement st1 = con.prepareStatement(sql2);
				st1.setString(1, uname);
				st1.setString(2, uname);
				ResultSet rs1 = st1.executeQuery();
				
				PreparedStatement st2 = con.prepareStatement(sql3);
				st2.setString(1, uname);
				ResultSet rs2 = st2.executeQuery();
				
				PreparedStatement st3 = con.prepareStatement(sql4);
				st3.setString(1, uname);
				ResultSet rs3 = st3.executeQuery();
				
				PreparedStatement st8 = con.prepareStatement(sql8);
				st8.setString(1, uname);
				ResultSet rs8 = st8.executeQuery();
				
				PreparedStatement st7 = con.prepareStatement(sql7);
				st7.setString(1, uname);
				ResultSet rs7 = st7.executeQuery();
				if(rs7.absolute(1))
				{
					String wallet = rs7.getString(4);
					session.setAttribute("walletst",wallet);
				}
				
				while(rs1.next())
				{
					
	
					personalevent newevent = new personalevent();
					newevent.setAmount((Integer.parseInt(rs1.getString(1))));
					newevent.setBorrower(rs1.getString(3));
					newevent.setLender(rs1.getString(2));
					newevent.setEid(Integer.parseInt(rs1.getString(4)));
					pevents.add(newevent);
					session.setAttribute("pevents",pevents);
	
				}
	
				while(rs2.next())
				{
					
	
					pendingpersonalrequests newrequest = new pendingpersonalrequests();
					newrequest.setAmount((Integer.parseInt(rs2.getString(1))));
					newrequest.setBorrower(rs2.getString(3));
					newrequest.setLender(rs2.getString(2));
					newrequest.setId(Integer.parseInt(rs2.getString(4)));
					
					requests.add(newrequest);
					session.setAttribute("requests",requests);
	
				}
				
				while(rs3.next())
				{
					
	
					groupevent newevent = new groupevent();
					newevent.setTotalAmt((Integer.parseInt(rs3.getString(4))));
					newevent.setOwner(rs3.getString(5));
					newevent.setDescription(rs3.getString(2));
					gevents.add(newevent);
					session.setAttribute("gevents",gevents);
	
				}
				
				while(rs8.next())
				{
					dailyexpense dailyevent = new dailyexpense();
					dailyevent.setAmount((Integer.parseInt(rs8.getString(4))));
					dailyevent.setCategory(rs8.getString(3));
					devents.add(dailyevent);
					session.setAttribute("devents",devents);
				}
				
				session.setAttribute("pevents",pevents);
				session.setAttribute("requests",requests);
				session.setAttribute("gevents",gevents);
				session.setAttribute("devents",devents);
				return true;	
			}
			else
				return false;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return false;
		
	}
	
	public boolean checkPersonalevent(String uname,HttpServletRequest request)
	{
		
		try {
			PreparedStatement st1;
			st1 = con.prepareStatement(sql2);
			st1.setString(1, uname);
			st1.setString(2, uname);
			ResultSet rs1 = st1.executeQuery();
			while(rs1.next())
			{
				HttpSession session = request.getSession();

				personalevent newevent = new personalevent();
				newevent.setAmount((Integer.parseInt(rs1.getString(1))));
				newevent.setBorrower(rs1.getString(3));
				newevent.setLender(rs1.getString(4));
				pevents.add(newevent);
				session.setAttribute("pevents",pevents);

			}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean checkpendingrequest(String uname,HttpServletRequest request)
	{
		
		try {
			PreparedStatement st2;
			st2 = con.prepareStatement(sql3);
			st2.setString(1, uname);
			ResultSet rs2 = st2.executeQuery();
			while(rs2.next())
			{
				HttpSession session = request.getSession();

				pendingpersonalrequests newrequest = new pendingpersonalrequests();
				newrequest.setAmount((Integer.parseInt(rs2.getString(1))));
				newrequest.setBorrower(rs2.getString(3));
				newrequest.setLender(rs2.getString(2));
				newrequest.setId(Integer.parseInt(rs2.getString(4)));
				
				requests.add(newrequest);
				session.setAttribute("requests",requests);

			}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	public boolean groupevent(String uname,HttpServletRequest request)
	{
		
		try {
			PreparedStatement st3 = con.prepareStatement(sql4);
			st3.setString(1, uname);
			ResultSet rs3 = st3.executeQuery();
			while(rs3.next())
			{
				HttpSession session = request.getSession();

				groupevent newevent = new groupevent();
				newevent.setTotalAmt((Integer.parseInt(rs3.getString(4))));
				newevent.setOwner(rs3.getString(5));
				newevent.setDescription(rs3.getString(2));
				gevents.add(newevent);
				session.setAttribute("gevents",gevents);

			}
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
}
