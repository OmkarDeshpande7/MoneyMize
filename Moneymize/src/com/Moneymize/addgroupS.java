package com.Moneymize;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.Dao.LoginDao;
import com.Moneymize.Dao.PersonalRequestdao;
import com.Moneymize.Dao.addgroupDao;


@WebServlet("/addgroupS")
public class addgroupS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    	HttpSession session = request.getSession();
    	int totalamt = Integer.parseInt(request.getParameter("totalamt"));
    	String description = (String) request.getParameter("description");
    	String owner = (String) session.getAttribute("phone");
		addgroupDao daoP = new addgroupDao();
		daoP.addGroup(description,totalamt,owner,request);
		response.sendRedirect("group.jsp");
		
	}

}
