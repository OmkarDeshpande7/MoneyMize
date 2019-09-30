package com.Moneymize;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.Dao.dailyexpenseDao;

/**
 * Servlet implementation class showbyDateS
 */
@WebServlet("/showbyDateS")
public class showbyDateS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public showbyDateS() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		String date = (request.getParameter("Date")); 
	    dailyexpenseDao daos = new dailyexpenseDao();
	   
	    	daos.showdatewise(date,request);
	    	session.setAttribute("show", "YES");
	    	response.sendRedirect("daily.jsp");
	    

	}
}
