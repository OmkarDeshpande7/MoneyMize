package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Moneymize.info.groupevent;
import com.Moneymize.info.notification;
import com.Moneymize.info.pendinggrouprequest;
import com.Moneymize.info.pendingpersonalrequests;
import com.Moneymize.info.personalevent;

public class acceptgrouprequestdao 
{
	String sql1 = "call insertuseringroup(?,?,?,?)";
	String sql2 = "select * from pendinggrouprequests where pid=?";
	String sql3 = "select * from useringroup,groupevent where user=? and useringroup.eventId = groupevent.eventId";
	String sql4 = "select * from pendinggrouprequests,groupevent where user=? and pendinggrouprequests.eid = groupevent.eventId";
	String url = "jdbc:mysql://localhost:3306/Moneymize?allowPublicKeyRetrieval=true";
	String username = "root";
	String password = "#ironmanROCKX64";
	int amount;
	int eventId;
	String user;
	  
	private Connection con;	
	 public void accept(int pid,HttpServletRequest request) 
	   {
		 HttpSession session = request.getSession();
			ArrayList<pendinggrouprequest> pendinggroupevent=(ArrayList<pendinggrouprequest>) session.getAttribute("pendinggroupevent");
			ArrayList<groupevent> gevents=(ArrayList<groupevent>) session.getAttribute("gevents");
		   try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			    con = DriverManager.getConnection(url,username,password);
				String uname = (String) session.getAttribute("phone");

				PreparedStatement st2 = con.prepareStatement(sql2);
				st2.setInt(1, pid);
				ResultSet rs2 = st2.executeQuery();
				if(rs2.absolute(1))
				{
					amount = Integer.parseInt(rs2.getString(1));
					eventId = Integer.parseInt(rs2.getString(4));
					user = (String)rs2.getString(2);
					System.out.println(pid + "from groupdao");

				
				PreparedStatement st1 = con.prepareStatement(sql1);
				st1.setInt(1, amount);
				st1.setInt(2, eventId);
				st1.setString(3, user);
				st1.setInt(4, pid);
				ResultSet rs1 = st1.executeQuery();
				
				}	
				
				PreparedStatement st3 = con.prepareStatement(sql3);
				st3.setString(1, uname);
				ResultSet rs3 = st3.executeQuery();
				
				PreparedStatement st4 = con.prepareStatement(sql4);
				st4.setString(1, uname);
				ResultSet rs4 = st4.executeQuery();
				pendinggroupevent.clear();
				gevents.clear();
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
				
				while(rs4.next())
				{
					pendinggrouprequest pendingevent = new pendinggrouprequest();
					pendingevent.setAmount((Integer.parseInt(rs4.getString(1))));
					pendingevent.setId(Integer.parseInt(rs4.getString(3)));
					pendingevent.setOwner(rs4.getString(9));
					pendinggroupevent.add(pendingevent);
					session.setAttribute("pendinggroupevent",pendinggroupevent);
				}
				session.setAttribute("pendinggroupevent",pendinggroupevent);
				session.setAttribute("gevents",gevents);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	}

