package com.Moneymize;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Moneymize.Dao.acceptRequestdao;
import com.Moneymize.Dao.payDao;

/**
 * Servlet implementation class paymoney
 */
@WebServlet("/payS")
public class paymoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public paymoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int eid = Integer.parseInt(request.getParameter("eid"));
		payDao daor = new payDao();
		daor.pay(eid,request);
		response.sendRedirect("personal.jsp");
	}

}
