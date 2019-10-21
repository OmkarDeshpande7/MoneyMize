package com.Moneymize;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;


/**
 * Servlet implementation class walletS
 */
@WebServlet("/getChart")
public class getChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&useSSL=false";
	String username = "root";
	String password = "#ironmanROCKX64";
	String str = "call getLatestMonthly(?)";
	private Connection con;	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		JSONObject json = new JSONObject();

		try{
		HttpSession session = request.getSession();
		List<Integer> array = new ArrayList<Integer>();
		List<String> months = new ArrayList<String>();
		String uname = (String) session.getAttribute("phone");
		System.out.println(uname);
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection(url,username,password);
	    System.out.println("conn");
		PreparedStatement st = con.prepareStatement(str);
		st.setString(1, uname);
		st.executeQuery();
		ResultSet rs7 = st.executeQuery();
		while(rs7.next())
			{
			array.add(rs7.getInt(1));
			months.add(rs7.getString(2));
			}
		System.out.println(array);
		System.out.println(months);
		json.put("array", array);
		json.put("months", months);
		response.setContentType("application/json");
		response.getWriter().write(json.toString());
		
		}
		catch(Exception e)
		{}
	}

}
