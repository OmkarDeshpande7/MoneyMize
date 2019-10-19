package com.Moneymize.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Moneymize.info.notification;
import com.Moneymize.info.pendinggrouprequest;
import com.Moneymize.info.pendingpersonalrequests;

public class rejectgrouprequestdao
{
	String sql1 = "select * from pendingpersonalrequests where pid=?";
	String sql = "delete from pendinggrouprequests where pid=?";
	String sql2 = "select * from pendinggrouprequests,groupevent where user=? and pendinggrouprequests.eid = groupevent.eventId";
	 String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&allowPublicKeyRetrieval=true";
		String username = "root";
		String password = "#ironmanROCKX64";
		int pid;
		private Connection con;	
		
		 public void reject(int pid,HttpServletRequest request) 
		   {
			   HttpSession session = request.getSession();
			    String uname = (String) session.getAttribute("phone");
				ArrayList<pendinggrouprequest> pendinggroupevent=(ArrayList<pendinggrouprequest>) session.getAttribute("pendinggroupevent");

			   try {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
				    con = DriverManager.getConnection(url,username,password);
					PreparedStatement st1 = con.prepareStatement(sql);
					st1.setInt(1, pid);
					st1.executeUpdate();
					
					PreparedStatement st2 = con.prepareStatement(sql1);
					st2.setString(1, uname);
					ResultSet rs2 = st2.executeQuery();
					pendinggroupevent.clear();

					while(rs2.next())
					{
						pendinggrouprequest pendingevent = new pendinggrouprequest();
						pendingevent.setAmount((Integer.parseInt(rs2.getString(1))));
						pendingevent.setId(Integer.parseInt(rs2.getString(3)));
						pendingevent.setOwner(rs2.getString(9));
						pendinggroupevent.add(pendingevent);
						session.setAttribute("pendinggroupevent",pendinggroupevent);
					}
					
					

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		}

