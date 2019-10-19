package com.Moneymize;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.Dao.LoginDao;
import com.Moneymize.Dao.PersonalRequestdao;
import com.Moneymize.Dao.groupeventDao;


@WebServlet("/groupeventS")
public class groupeventS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	HttpSession session = request.getSession();
		String description = request.getParameter("description");	
    	String date = (String) request.getParameter("date");
    	System.out.println(request.getParameter("totalamt"));
		int totalamt = Integer.parseInt(request.getParameter("totalamt"));		
    	String owner = (String) request.getParameter("owner");
		groupeventDao daoP = new groupeventDao();
		daoP.savegroupevent(description,date,totalamt,owner,request);
		response.sendRedirect("group.jsp");
		
	}

}
