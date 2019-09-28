package com.Moneymize;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.Dao.dailyexpenseDao;

import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    

@WebServlet("/dailyexenseS")
public class dailyexpenseS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public dailyexpenseS() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		String phone = (String) session.getAttribute("phone");
		int category = Integer.parseInt(request.getParameter("category"));
		int categoryamount = Integer.parseInt(request.getParameter("dailyamount"));
		java.util.Date utildate = new java.util.Date();
		java.sql.Date date = new java.sql.Date(utildate.getTime()); 
	    dailyexpenseDao daod = new dailyexpenseDao();
	    daod.insertDaily(category,categoryamount,date,phone);
	    response.sendRedirect("dashboard.jsp");
	}

}
