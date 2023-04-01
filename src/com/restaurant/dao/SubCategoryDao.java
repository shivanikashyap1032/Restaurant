package com.restaurant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.restaurant.entity.SubCategory;

public class SubCategoryDao {

	 private String jdbcURL = "jdbc:mysql://localhost:3306/restaurant";
	    private String jdbcUsername = "root";
	    private String jdbcPassword = "root";
	    
	    protected Connection getConnection() 
	    {
	        Connection connection = null;
	        try 
	        {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	        } 
	        catch (Exception e) 
	        {
	            e.printStackTrace();
	        }
	        return connection;
	    }
	    
	    public void addSubCategory(SubCategory subCategory)
	    {
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO subcategory (cId, sName, price, details) VALUES (?, ?, ?, ?)");
				preparedStatement.setInt(1, subCategory.getcId());
				preparedStatement.setString(2, subCategory.getsName());
				preparedStatement.setString(3, subCategory.getPrice());
				preparedStatement.setString(4, subCategory.getDetails());
		        preparedStatement.executeUpdate();
			}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from dao************************");
	    		 e.printStackTrace();
			}
	    }
}
