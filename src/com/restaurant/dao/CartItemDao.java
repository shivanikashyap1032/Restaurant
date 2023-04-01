package com.restaurant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.entity.Cart;
import com.restaurant.entity.SubCategory;

public class CartItemDao {

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
	    
	    public void addToCart(Cart cart)
	    {
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO cart (uId, scId) VALUES (?, ?)");
				preparedStatement.setInt(1, cart.getuId());
				preparedStatement.setInt(2, cart.getScId());
		        preparedStatement.executeUpdate();
			}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from dao************************");
	    		 e.printStackTrace();
			}
	    }
	    
	    public List<Cart> getCartDetails(int uId)
	    {
	    	List<Cart> cartItems = new ArrayList<>();
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM cart Where uId=?");
				preparedStatement.setInt(1, uId);
				ResultSet rs = preparedStatement.executeQuery();
		        while (rs.next()) 
		        {
		            Cart cart = new Cart();
		            cart.setCartId(rs.getInt(1));
		            cart.setuId(rs.getInt(2));
		            cart.setScId(rs.getInt(3));
		            SubCategory dish = getSubCategoryFromSCid(rs.getInt(3));
		            cart.setSubCategory(dish);
		            cartItems.add(cart);
		        }
		        con.close(); 
	    	}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from CartItemdao getCartDetails************************");
	    		 e.printStackTrace();
			}
	    	return cartItems;
	    }
	    
	    public SubCategory getSubCategoryFromSCid(int scId)
	    {
	    	SubCategory subCategory = new SubCategory();
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM subcategory WHERE sCId=?");
				preparedStatement.setInt(1, scId);
		        ResultSet rs = preparedStatement.executeQuery();
		        while (rs.next()) 
		        {
		        	subCategory.setsCId(rs.getInt(2));
		        	subCategory.setsName(rs.getString(3));
		        	subCategory.setPrice(rs.getString(4));
		        	subCategory.setDetails(rs.getString(5));
		        }
		        con.close(); 
	    	}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from CartItemdao getSubCategoryFromSCid************************");
	    		 e.printStackTrace();
			}
	    	return subCategory;
	    }
	    
	    public void deleteCartItem(int uId , int cartId)
	    {
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("DELETE FROM cart WHERE uId=? AND cartId=?");
				preparedStatement.setInt(1, uId);
				preparedStatement.setInt(2, cartId);
		        preparedStatement.executeUpdate();
		        con.close(); 
	    	}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from CartItemdao getSubCategoryFromSCid************************");
	    		 e.printStackTrace();
			}
	    }
}
