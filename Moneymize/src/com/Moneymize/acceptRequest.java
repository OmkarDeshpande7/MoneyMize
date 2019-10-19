package com.Moneymize;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.Dao.LoginDao;
import com.Moneymize.Dao.acceptRequestdao;
import com.Moneymize.Dao.rejectRequestdao;
import com.Moneymize.info.pendingpersonalrequests;

/**
 * Servlet implementation class rejectRequest
 */
@WebServlet("/acceptS")
public class acceptRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
		int pid;
		
		
    public acceptRequest() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		

		pid = Integer.parseInt(request.getParameter("reqId"));
		System.out.println(pid);
		acceptRequestdao daor = new acceptRequestdao();
		daor.accept(pid,request);
		response.sendRedirect("personal.jsp");
		
		
}
}
