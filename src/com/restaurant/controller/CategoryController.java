package com.restaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant.dao.CategoryDao;
import com.restaurant.entity.Category;

@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
    public CategoryController()
    {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			Category category = new Category();
			String categoryName = request.getParameter("cName");
			category.setcName(categoryName);
			category.setcImg("default.png");
			
			CategoryDao categoryDao = new CategoryDao();
			categoryDao.saveCategory(category);
			response.setContentType("text/html");
			request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);

		} 
		catch (Exception e)
		{
			System.out.println("***************catogory not saved");
		}
	}

}
