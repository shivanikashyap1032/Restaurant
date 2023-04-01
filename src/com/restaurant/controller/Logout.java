package com.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Logout() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String logoutBtn = request.getParameter("logoutBTn");
		if(logoutBtn.equals("userLogOut"))
		{
			HttpSession session = request.getSession(false);
		    if (session != null) {
		        session.removeAttribute("user");
		    }
		    request.getRequestDispatcher("/views/home.jsp").forward(request, response);
		}
		else if(logoutBtn.equals("adminLogOut"))
		{
			HttpSession session = request.getSession(false);
		    if (session != null) {
		        session.removeAttribute("admin");
		    }
		    request.getRequestDispatcher("/views/home.jsp").forward(request, response);
		}
	}

}
