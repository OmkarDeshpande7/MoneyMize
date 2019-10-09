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
import com.Moneymize.info.pendingpersonalrequests;
import com.Moneymize.info.personalevent;
import com.mysql.cj.protocol.Resultset;

public class paygroupdao
{
	String sql1 = "call paygroupmoney(?)";
	String sql2 = "select * from useringroup,groupevent where user=? and useringroup.eventId = groupevent.eventId";
	 String sql7 = "select * from user where phone=?";
		String sql15 = "select * from notification where user=?";

	String url = "jdbc:mysql://localhost:3306/Moneymize?allowPublicKeyRetrieval=true";
	String username = "root";
	String password = "#ironmanROCKX64";
	int pid;
	private Connection con;	
	   public void payg(int eid,HttpServletRequest request)
	   {
		   HttpSession session = request.getSession();
		   ArrayList<groupevent> gevents=(ArrayList<groupevent>) session.getAttribute("gevents");

		   try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
		   
			    con = DriverManager.getConnection(url,username,password);
			    String uname = (String) session.getAttribute("phone");
				PreparedStatement st1 = con.prepareStatement(sql1);
				st1.setInt(1, eid);
				st1.executeUpdate();
				
				PreparedStatement st2 = con.prepareStatement(sql2);
				st2.setString(1, uname);
				ResultSet rs2 = st2.executeQuery();
				
				PreparedStatement st7 = con.prepareStatement(sql7);
				st7.setString(1, uname);
				ResultSet rs7 = st7.executeQuery();
				
				gevents.clear();
				
				while(rs2.next())
				{
					groupevent newgevent = new groupevent();
					newgevent.setTotalAmt((Integer.parseInt(rs2.getString(1))));
					newgevent.setOwner(rs2.getString(9));
					newgevent.setDescription(rs2.getString(6));
					newgevent.setEid(rs2.getInt(2));
					newgevent.setPid(rs2.getInt(4));
					gevents.add(newgevent);
					session.setAttribute("gevents",gevents);
				}
				if(rs7.absolute(1))
				{
					String wallets = rs7.getString(4);
					session.setAttribute("walletst",wallets);
				}
				
				
				session.setAttribute("gevents",gevents);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	private Resultset executeQuery() {
		// TODO Auto-generated method stub
		return null;
	}
	}
