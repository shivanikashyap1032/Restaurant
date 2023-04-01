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

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() 
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
			sessionMessage.removeAttribute("registerMessage");
		}
		try
		{
			String uName = request.getParameter("uName");
			String phoneNo = request.getParameter("phoneNo");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			
			User user = new User();
			user.setRole("ROLE_USER");
			user.setuName(uName);
			user.setAddress(address);
			user.setPhoneNo(phoneNo);
			user.setPassword(password);
			user.setEmail(email);
			
			UserDao userDao = new UserDao();
			String registerMessage = userDao.saveUser(user);
			if(registerMessage.equals("Registered Successfully"))
			{
				response.setContentType("text/html");
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			}
			else
			{
				HttpSession session = request.getSession();
				session.setAttribute("registerMessage", registerMessage);
				response.setContentType("text/html");
				request.getRequestDispatcher("/views/register.jsp").forward(request, response);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
