package com.Moneymize;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logout
 */
@WebServlet("/logout")
public class logout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("poweing off....");
		session.removeAttribute("phone");
		session.removeAttribute("wallet");
		session.removeAttribute("errorMessage");
		session.removeAttribute("errorRegisterMessage");
		session.removeAttribute("events");
		session.removeAttribute("requests");
		session.removeAttribute("pevents");
		session.removeAttribute("requests");
		session.removeAttribute("gevents");
		session.removeAttribute("devents");
		session.removeAttribute("nevents");
		session.removeAttribute("pendinggroupevent");
		session.removeAttribute("logevent");
		session.invalidate();
		response.sendRedirect("index.jsp");
	}

}
