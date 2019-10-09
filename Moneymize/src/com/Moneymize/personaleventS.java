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


@WebServlet("/personaleventS")
public class personaleventS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public personaleventS() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	HttpSession session = request.getSession();
    	String lender = (String) session.getAttribute("phone");
		String borrower = request.getParameter("borrower");
		String amount = request.getParameter("amount");			
		PersonalRequestdao daoP = new PersonalRequestdao();
		daoP.createrequest(lender,borrower,amount,request);
		response.sendRedirect("personal.jsp");
		
	}

}
