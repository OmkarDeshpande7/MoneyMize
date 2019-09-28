package com.Moneymize;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.Dao.RegisterDao;
import com.Moneymize.Dao.Walletdao;

/**
 * Servlet implementation class walletS
 */
@WebServlet("/walletS")
public class walletS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public walletS() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		int addwallet = Integer.parseInt(request.getParameter("amount"));
		String phone = (String) session.getAttribute("phone");
		String wallets = (String) session.getAttribute("walletst");
		int wallet = Integer.parseInt(wallets);
		wallet = wallet + addwallet;
		
		Walletdao daoW = new Walletdao();
		
		daoW.add(phone, wallet,request);
		
		response.sendRedirect("wallet.jsp");
	}

}
