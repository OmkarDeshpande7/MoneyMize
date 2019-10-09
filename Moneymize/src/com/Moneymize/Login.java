package com.Moneymize;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Moneymize.Dao.LoginDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String phone = request.getParameter("mobile");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		
		LoginDao dao = new LoginDao();
		if(dao.check(phone, pass,request))
		{
			session.setAttribute("phone", phone);
			session.setAttribute("errorMessage", "NOO");
			response.sendRedirect("dashboard.jsp");
		}
		else
		{
			session.setAttribute("errorMessage", "NO");
			response.sendRedirect("index.jsp");
		}
	}

		
	}


