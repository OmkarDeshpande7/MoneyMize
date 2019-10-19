package com.Moneymize;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Moneymize.Dao.payDao;
import com.Moneymize.Dao.paygroupDao;


@WebServlet("/paygroupmoney")
public class paygroupmoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public paygroupmoney() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int eid = Integer.parseInt(request.getParameter("eid"));
		paygroupDao daor = new paygroupDao();
		daor.pay(eid,request);
		response.sendRedirect("group.jsp");
	}

}
