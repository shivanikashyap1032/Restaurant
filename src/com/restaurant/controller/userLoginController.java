package com.restaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.dao.UserDao;
import com.restaurant.entity.User;

@WebServlet("/userLoginController")
public class userLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public userLoginController() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession sessionMessage = request.getSession(false);
		if (sessionMessage != null)
		{
			sessionMessage.removeAttribute("message");
		}
		try
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User user = new User();
			user.setPassword(password);
			user.setEmail(email);
		
			UserDao userDao = new UserDao();
			User userDetails = userDao.getUserDetails(user);
			if(userDetails != null)
			{
				
				if(userDetails.getRole().equals("ROLE_USER"))
				{
					HttpSession session = request.getSession();
					session.setAttribute("user", userDetails);
					response.setContentType("text/html");
					request.getRequestDispatcher("/views/home.jsp").forward(request, response);
				}
				else if(userDetails.getRole().equals("ROLE_ADMIN"))
				{
					HttpSession session = request.getSession();
					session.setAttribute("admin", userDetails);
					response.setContentType("text/html");
					request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
				}
			}
			else 
			{
				HttpSession session = request.getSession();
				session.setAttribute("message", "Please Enter Valid Credentials");
				response.setContentType("text/html");
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
