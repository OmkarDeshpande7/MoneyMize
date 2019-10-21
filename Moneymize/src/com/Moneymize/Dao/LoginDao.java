package com.Moneymize.Dao;
import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Moneymize.info.alllog;
import com.Moneymize.info.dailyexpense;
import com.Moneymize.info.friends;
import com.Moneymize.info.groupevent;
import com.Moneymize.info.notification;
import com.Moneymize.info.pendinggrouprequest;
import com.Moneymize.info.pendingpersonalrequests;
import com.Moneymize.info.personalevent;



public class LoginDao {
	String sql1 = "select * from user where phone=? and password=?";
	String sql2 = "select * from personalevent where lender=? or borrower=?";
	String sql3 = "select * from pendingpersonalrequests where borrower=?";
	String sql4 = "select * from useringroup,groupevent where user=? and useringroup.eventId = groupevent.eventId";
	String sql10 = "select * from pendinggrouprequests,groupevent where user=? and pendinggrouprequests.eid = groupevent.eventId";
	String sql5 = "select * from notification where user=? limit 10";
	 String sql7 = "select * from user where phone=?";
	 String sql9 = "select * from alllog where user=?";
	 String sql8 = "select * from dailycategory where expenseId=(select expenseId from dailyexpenses where user =? and Date=CURRENT_DATE)";
	 String sql11 = "call findfriends(?)";

	String url = "jdbc:mysql://localhost:3306/Moneymize?allowPublicKeyRetrieval=true";
	String username = "root";
	String password = "#ironmanROCKX64";
	
	private Connection con;	
	
	List<pendingpersonalrequests> requests = new ArrayList<pendingpersonalrequests>();
	List<pendingpersonalrequests> sample = new ArrayList<pendingpersonalrequests>();
	List<personalevent> pevents = new ArrayList<personalevent>();
	List<groupevent> gevents = new ArrayList<groupevent>();
	List<dailyexpense> devents = new ArrayList<dailyexpense>();
	List<notification> nevents = new ArrayList<notification>();
	List<alllog> logevent = new ArrayList<alllog>();
	List<pendinggrouprequest> pendinggroupevent = new ArrayList<pendinggrouprequest>();
	List<friends> friendsevent = new ArrayList<friends>();


	

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
				String user_name = rs.getString(3);
				session.setAttribute("user_name",user_name);
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
				
				PreparedStatement st5 = con.prepareStatement(sql5);
				st5.setString(1, uname);
				ResultSet rs5 = st5.executeQuery();
				
				PreparedStatement st8 = con.prepareStatement(sql8);
				st8.setString(1, uname);
				ResultSet rs8 = st8.executeQuery();
				
				PreparedStatement st9 = con.prepareStatement(sql9);
				st9.setString(1, uname);
				ResultSet rs9 = st9.executeQuery();
				
				PreparedStatement st10 = con.prepareStatement(sql10);
				st10.setString(1, uname);
				ResultSet rs10 = st10.executeQuery();
				
				PreparedStatement st11 = con.prepareStatement(sql11);
				st11.setString(1, uname);
				ResultSet rs11 = st11.executeQuery();
				
				PreparedStatement st7 = con.prepareStatement(sql7);
				st7.setString(1, uname);
				ResultSet rs7 = st7.executeQuery();
				rs7.absolute(1);
				
					String wallet = rs7.getString(4);
					session.setAttribute("walletst",wallet);
				
				
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
					newevent.setEid(Integer.parseInt(rs3.getString(4)));
					newevent.setTotalAmt((Integer.parseInt(rs3.getString(1))));
					newevent.setOwner(rs3.getString(9));
					newevent.setDescription(rs3.getString(6));
					gevents.add(newevent);
					session.setAttribute("gevents",gevents);
	
				}
				
				while(rs8.next())
				{
					dailyexpense dailyevent = new dailyexpense();
					dailyevent.setAmount((Integer.parseInt(rs8.getString(3))));
					dailyevent.setCategory(rs8.getString(2));
					devents.add(dailyevent);
					session.setAttribute("devents",devents);
				}
				
				while(rs9.next())
				{
					alllog alllogevent = new alllog();
					alllogevent.setAmount((Integer.parseInt(rs9.getString(1))));
					alllogevent.setDescription(rs9.getString(2));
					logevent.add(alllogevent);
					session.setAttribute("logevent",logevent);
				}
				
				while(rs10.next())
				{
					pendinggrouprequest pendingevent = new pendinggrouprequest();
					pendingevent.setAmount((Integer.parseInt(rs10.getString(1))));
					pendingevent.setId(Integer.parseInt(rs10.getString(3)));
					pendingevent.setOwner(rs10.getString(9));
					pendinggroupevent.add(pendingevent);
					session.setAttribute("pendinggroupevent",pendinggroupevent);
				}
				
				while(rs11.next())
				{
					friends friendevent = new friends();
					friendevent.setWallet((Integer.parseInt(rs11.getString(2))));
					friendevent.setName(rs11.getString(1));
					friendsevent.add(friendevent);
					session.setAttribute("friendsevent",friendsevent);
				}
				
				while(rs5.next())
				{
					notification noificationevent = new notification();
					noificationevent.setDate(rs5.getString(1));
					noificationevent.setMessage(rs5.getString(2));
					nevents.add(noificationevent);
					session.setAttribute("nevents",nevents);
				}
				
				
				session.setAttribute("pevents",pevents);
				session.setAttribute("requests",requests);
				session.setAttribute("gevents",gevents);
				session.setAttribute("devents",devents);
				session.setAttribute("nevents",nevents);
				session.setAttribute("pendinggroupevent",pendinggroupevent);
				session.setAttribute("logevent",logevent);

				return true;	
			}
			else
				return false;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return false;
		
	}
	
	public void Reloadall(String uname,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
		    System.out.println("connecting...db");
	
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
				
				PreparedStatement st5 = con.prepareStatement(sql5);
				st5.setString(1, uname);
				ResultSet rs5 = st5.executeQuery();
				
				PreparedStatement st8 = con.prepareStatement(sql8);
				st8.setString(1, uname);
				ResultSet rs8 = st8.executeQuery();
				
				PreparedStatement st9 = con.prepareStatement(sql9);
				st9.setString(1, uname);
				ResultSet rs9 = st9.executeQuery();
				
				PreparedStatement st10 = con.prepareStatement(sql10);
				st10.setString(1, uname);
				ResultSet rs10 = st10.executeQuery();
				
				PreparedStatement st11 = con.prepareStatement(sql11);
				st11.setString(1, uname);
				ResultSet rs11 = st11.executeQuery();
				
				PreparedStatement st7 = con.prepareStatement(sql7);
				st7.setString(1, uname);
				ResultSet rs7 = st7.executeQuery();
				rs7.absolute(1);
				
					String wallet = rs7.getString(4);
					session.setAttribute("walletst",wallet);
				
				
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
					newevent.setEid(Integer.parseInt(rs3.getString(4)));
					newevent.setTotalAmt((Integer.parseInt(rs3.getString(1))));
					newevent.setOwner(rs3.getString(9));
					newevent.setDescription(rs3.getString(6));
					gevents.add(newevent);
					session.setAttribute("gevents",gevents);
	
				}
				
				while(rs8.next())
				{
					dailyexpense dailyevent = new dailyexpense();
					dailyevent.setAmount((Integer.parseInt(rs8.getString(3))));
					dailyevent.setCategory(rs8.getString(2));
					devents.add(dailyevent);
					session.setAttribute("devents",devents);
				}
				
				while(rs9.next())
				{
					alllog alllogevent = new alllog();
					alllogevent.setAmount((Integer.parseInt(rs9.getString(1))));
					alllogevent.setDescription(rs9.getString(2));
					logevent.add(alllogevent);
					session.setAttribute("logevent",logevent);
				}
				
				while(rs10.next())
				{
					pendinggrouprequest pendingevent = new pendinggrouprequest();
					pendingevent.setAmount((Integer.parseInt(rs10.getString(1))));
					pendingevent.setId(Integer.parseInt(rs10.getString(3)));
					pendingevent.setOwner(rs10.getString(9));
					pendinggroupevent.add(pendingevent);
					session.setAttribute("pendinggroupevent",pendinggroupevent);
				}
				
				while(rs11.next())
				{
					friends friendevent = new friends();
					friendevent.setWallet((Integer.parseInt(rs11.getString(2))));
					friendevent.setName(rs11.getString(1));
					friendsevent.add(friendevent);
					session.setAttribute("friendsevent",friendsevent);
				}
				
				while(rs5.next())
				{
					notification noificationevent = new notification();
					noificationevent.setDate(rs5.getString(1));
					noificationevent.setMessage(rs5.getString(2));
					nevents.add(noificationevent);
					session.setAttribute("nevents",nevents);
				}
				
				
				session.setAttribute("pevents",pevents);
				session.setAttribute("requests",requests);
				session.setAttribute("gevents",gevents);
				session.setAttribute("devents",devents);
				session.setAttribute("nevents",nevents);
				session.setAttribute("pendinggroupevent",pendinggroupevent);
				session.setAttribute("logevent",logevent);

				
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
	}
	
		
}