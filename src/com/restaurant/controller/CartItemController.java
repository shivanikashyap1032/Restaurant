package com.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant.dao.CartItemDao;
import com.restaurant.dao.OrderDao;
import com.restaurant.entity.Cart;
import com.restaurant.entity.Order;

@WebServlet("/CartItemController")
public class CartItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartItemController() 
    {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String clickedBtn = request.getParameter("addBtn");
		if(clickedBtn.equals("add"))
		{
			Cart cartitems = new Cart();
			int scId = Integer.parseInt(request.getParameter("scId"));
			int uId = Integer.parseInt(request.getParameter("uId"));
			cartitems.setScId(scId);
			cartitems.setuId(uId);
			CartItemDao cartItemDao = new CartItemDao();
			cartItemDao.addToCart(cartitems);
			response.setContentType("text/html");
			request.getRequestDispatcher("/views/home.jsp").forward(request, response);
		}
		else if(clickedBtn.equals("remove"))
		{	
			int uId = Integer.parseInt(request.getParameter("uId"));
			int cartId = Integer.parseInt(request.getParameter("cartId"));
			CartItemDao cartItemDao = new CartItemDao();
			cartItemDao.deleteCartItem(uId , cartId);
			response.setContentType("text/html");
			request.getRequestDispatcher("/views/home.jsp").forward(request, response);
		}
		else if(clickedBtn.equals("orderNow"))
		{
			int scId = Integer.parseInt(request.getParameter("dishNameOrder"));
			int uId = Integer.parseInt(request.getParameter("uNameOrder"));
			String pEmail = request.getParameter("email");
			String pNumber = request.getParameter("phoneNo");
			String orderAddress = request.getParameter("address");
			String total = request.getParameter("total");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			Order newOrder = new Order();
			newOrder.setuId(uId);
			newOrder.setScId(scId);
			newOrder.setpEmail(pEmail);
			newOrder.setpNumber(pNumber);
			newOrder.setorderAddress(orderAddress);
			newOrder.setTotal(total);
			newOrder.setQuantity(quantity);
			newOrder.setStatus("Pending");
			OrderDao placeOrder = new OrderDao();
			placeOrder.placeAnOrder(newOrder);
			response.setContentType("text/html");
			request.getRequestDispatcher("/views/home.jsp").forward(request, response);
		}
	}

}
