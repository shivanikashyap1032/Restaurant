package com.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant.dao.UserDao;

@WebServlet("/DeleteUser")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteUserController() 
    {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			int uId = Integer.parseInt(request.getParameter("uId"));
			UserDao deleteUser = new UserDao();
			deleteUser.deleteUser(uId);
			response.setContentType("text/html");
			request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
		}
		catch (Exception e) 
		{
			System.out.println("error while deleting user");
			e.printStackTrace();
		}
	}

}
