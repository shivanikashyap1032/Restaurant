package com.restaurant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.entity.Category;
import com.restaurant.entity.SubCategory;

public class CategoryDao {

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
	    
	    public void saveCategory(Category category)
	    {
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO category (cName, cImg) VALUES (?, ?)");
				preparedStatement.setString(1, category.getcName());
				preparedStatement.setString(2, category.getcImg());
		        preparedStatement.executeUpdate();
			}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from dao************************");
	    		 e.printStackTrace();
			}
	    }
	    
	    public List<Category> getAllCategoriesList()
	    {
	    	List<Category> allCategories = new ArrayList<>();
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM category");
		        ResultSet rs = preparedStatement.executeQuery();
		        while (rs.next()) 
		        {
		            Category category = new Category();
		            category.setcId(rs.getInt(1));
		            category.setcName(rs.getString(2));
		            category.setcImg(rs.getString(3));
		            List<SubCategory> allDishes = getSubCategoryFromCid(rs.getInt(1));
		            category.setAllDishes(allDishes);
		            allCategories.add(category);
		        }
		        con.close();  
			}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from dao************************");
	    		 e.printStackTrace();
			}
	    	
	    	return allCategories;
	    }
	    
	    public List<SubCategory> getSubCategoryFromCid(int cId)
	    {
	    	List<SubCategory> subCategoryList = new ArrayList<SubCategory>();
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM subcategory WHERE cID = ?");
				preparedStatement.setInt(1, cId);
				ResultSet rs = preparedStatement.executeQuery();
				while (rs.next()) 
		        {
		            SubCategory subCategory = new SubCategory();
		            subCategory.setcId(rs.getInt(1));
		            subCategory.setsCId(rs.getInt(2));
		            subCategory.setsName(rs.getString(3));
		            subCategory.setPrice(rs.getString(4));
		            subCategory.setDetails(rs.getString(5));
		            subCategoryList.add(subCategory);
		        }
		        con.close(); 
			}
	    	catch (Exception e) 
	    	{
	    		System.out.println("This error is from subCategoryDao");
	    		e.printStackTrace();
			}
	    	return subCategoryList;
	    }
}
