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

public class paygroupDao
{
	String sql1 = "call paygroupmoney(?,?)";
	String sql4 = "select * from useringroup,groupevent where user=? and useringroup.eventId = groupevent.eventId";
	 String sql7 = "select * from user where phone=?";

	String url = "jdbc:mysql://localhost:3306/Moneymize?allowPublicKeyRetrieval=true";
	String username = "root";
	String password = "#ironmanROCKX64";
	int pid;
	private Connection con;	
	

public void pay(int pid,HttpServletRequest request) 
{
	HttpSession session = request.getSession();
	ArrayList<groupevent> gevents=(ArrayList<groupevent>) session.getAttribute("gevents"); 
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection(url,username,password);
	    PreparedStatement st = con.prepareStatement(sql1);
		st.setInt(1, pid);
		String uname = (String) session.getAttribute("phone");

		st.setString(2, uname);
		st.executeUpdate();
		
		if (gevents!=null)
		gevents.clear();
		PreparedStatement st3 = con.prepareStatement(sql4);
		st3.setString(1, uname);
		ResultSet rs3 = st3.executeQuery();
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
			
			session.setAttribute("gevents",gevents);
			PreparedStatement st7 = con.prepareStatement(sql7);
			st7.setString(1, uname);
			ResultSet rs7 = st7.executeQuery();
			if(rs7.absolute(1))
			{
				System.out.println("wallet");
				String wallets = rs7.getString(4);
				session.setAttribute("walletst",wallets);
			}

	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}


}
