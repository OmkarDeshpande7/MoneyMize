package com.Moneymize;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.Dao.RegisterDao;




@WebServlet("/RegisterS")
public class RegisterS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RegisterS() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    private Connection con;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String phone = request.getParameter("phone-no");
		String email = request.getParameter("email-address");
		String name = request.getParameter("full-name");
		int wallet = Integer.parseInt(request.getParameter("wallet"));
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RegisterDao dao = new RegisterDao();
		if(dao.check(phone))
		{
			if(dao.insert(phone, password,email,name,wallet))
			{
				session.setAttribute("errorRegisterMessage","null");
				response.sendRedirect("index.jsp");
			}
		}
		else
		{
			session.setAttribute("errorRegisterMessage","NO");
			response.sendRedirect("Register.jsp");
		}
		
	}

}
