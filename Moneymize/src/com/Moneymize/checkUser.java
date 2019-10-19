package com.Moneymize;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
@WebServlet("/checkUser")
public class checkUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url = "jdbc:mysql://localhost:3306/Moneymize?autoReconnect=true&allowPublicKeyRetrieval=true";
	String username = "root";
	String password = "#ironmanROCKX64";
	String str = "select exists(select * from user where phone=?)";
	private Connection con;	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		JSONObject json = new JSONObject();

		try{
		HttpSession session = request.getSession();
		String checkval = (String) request.getParameter("checkval");
		System.out.println(checkval);
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection(url,username,password);
	    System.out.println("c");
		PreparedStatement st = con.prepareStatement(str);
		st.setString(1, checkval);
		st.executeQuery();
		ResultSet rs7 = st.executeQuery();
		if(rs7.absolute(1))
			System.out.println(rs7.getInt(1));
		json.put("value", rs7.getInt(1));
		response.setContentType("application/json");
		response.getWriter().write(json.toString());

		
		}
		catch(Exception e)
		{}
	}

}
