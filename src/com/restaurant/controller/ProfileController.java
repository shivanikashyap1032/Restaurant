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

@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProfileController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			int uId = Integer.parseInt(request.getParameter("uId"));
			String uName = request.getParameter("uName");
			String phoneNo = request.getParameter("phoneNo");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			
			User user = new User();
			user.setuId(uId);
			user.setuName(uName);
			user.setAddress(address);
			user.setPhoneNo(phoneNo);
			user.setEmail(email);
			
			UserDao userDao = new UserDao();
			userDao.updateUser(user);
			HttpSession session = request.getSession(false);
		    if (session != null) {
		        session.removeAttribute("user");
		    }
			session.setAttribute("user", user);
			response.setContentType("text/html");
			request.getRequestDispatcher("/views/home.jsp").forward(request, response);
		} 
		catch (Exception e) 
		{
			System.out.println("***************User not saved");
		}	}

}
