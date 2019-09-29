package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Moneymize.info.dailyexpense;
import com.Moneymize.info.pendingpersonalrequests;

public class dailyexpenseDao 
{
	String sql0 ="call savedailyexpenses(?,?,?)"; 
	 String sql7 = "select * from user where phone=?";
	 String sql8 = "select * from dailycategory where expenseId=(select expenseId from dailyexpenses where user =? and Date=CURRENT_DATE)";

	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&useSSL=false";
	
	String username = "root";
	String password = "#ironmanROCKX64";
	private Connection con;	
	public boolean insertDaily(String category,int categoryamount,String uname,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		ArrayList<dailyexpense> devents=(ArrayList<dailyexpense>) session.getAttribute("devents"); 

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection(url,username,password);
		    System.out.println("connecting...db");
			
		    PreparedStatement st = con.prepareStatement(sql0);
			st.setString(1, uname);
			st.setInt(2, categoryamount);
			st.setString(3, category);
			System.out.println("connecting...");
			st.executeUpdate();
			
			
			
			devents.removeAll(devents);
			
			PreparedStatement st3 = con.prepareStatement(sql8);
			st3.setString(1, uname);

			ResultSet rs3 = st3.executeQuery();
			if(rs3.absolute(1))
			{
				PreparedStatement st2 = con.prepareStatement(sql8);
				st2.setString(1, uname);

				ResultSet rs2 = st2.executeQuery();
				while(rs2.next())
				{
					dailyexpense newdeventss = new dailyexpense();
					newdeventss.setAmount((Integer.parseInt(rs2.getString(3))));
					newdeventss.setCategory(rs2.getString(2));
					devents.add(newdeventss);
					session.setAttribute("devents",devents);
				}
			
			}
			else
			{
				session.setAttribute("devents",devents);
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
			
			e.printStackTrace();
		}
		return true;
	}
}
