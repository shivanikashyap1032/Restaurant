package com.restaurant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant.dao.UserDao;
import com.restaurant.entity.User;

@WebServlet("/UserDetailsController")
public class UserDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public UserDetailsController() 
    {
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		UserDao getAllUser = new UserDao();
		List<User> listOfUsers =  getAllUser.getAllUserDetails();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}

}
