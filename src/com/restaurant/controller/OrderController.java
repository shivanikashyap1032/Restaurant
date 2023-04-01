package com.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant.dao.OrderDao;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderController() 
    {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			String status = request.getParameter("orderBtns");
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			OrderDao orderDao = new OrderDao();
			orderDao.updateOrder(status, orderId);
			if(status.equals("Canceled"))
			{
				response.setContentType("text/html");
				request.getRequestDispatcher("/views/orders.jsp").forward(request, response);
			}
			else
			{
				response.setContentType("text/html");
				request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Failed To update order");
			e.printStackTrace();
		}
	}

}
