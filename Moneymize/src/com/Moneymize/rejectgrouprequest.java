package com.Moneymize;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.Dao.rejectRequestdao;
import com.Moneymize.Dao.rejectgrouprequestdao;


@WebServlet("/rejectgrouprequest")
public class rejectgrouprequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public rejectgrouprequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    int pid;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();

		pid = Integer.parseInt(request.getParameter("reqId"));
		System.out.println(pid);
		rejectgrouprequestdao daogr = new rejectgrouprequestdao();
		daogr.reject(pid,request);
		response.sendRedirect("group.jsp");
	}

}
