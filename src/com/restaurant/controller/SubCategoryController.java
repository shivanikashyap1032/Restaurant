package com.restaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant.dao.SubCategoryDao;
import com.restaurant.entity.SubCategory;

@WebServlet("/SubCategoryController")
public class SubCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SubCategoryController() 
    {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			int cId = Integer.parseInt(request.getParameter("cId")); 
			String sName = request.getParameter("sName");
			String price = request.getParameter("price");
			String details = request.getParameter("details");
			SubCategory subCategory = new SubCategory();
			subCategory.setcId(cId);
			subCategory.setsName(sName);
			subCategory.setPrice(price);
			if(details == null || details == "" || details.isEmpty())
			{
				details = sName;
				subCategory.setDetails(details);
			}
			else
			{
				subCategory.setDetails(details);
			}
			subCategory.setDetails(details);
			SubCategoryDao subCategoryDao = new SubCategoryDao();
			subCategoryDao.addSubCategory(subCategory);
			response.setContentType("text/html");
			request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("***************subcatogory not saved");
		}
	}

}
