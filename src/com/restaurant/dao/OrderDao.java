package com.restaurant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.entity.Order;
import com.restaurant.entity.SubCategory;

public class OrderDao {

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
    
    public void placeAnOrder(Order order)
    {
    	try 
    	{
    		Connection con = getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO orderitem (uId, scId, status, total, pEmail, pNumber, orderAddress, quantity) values (?,?,?,?,?,?,?,?)");
			preparedStatement.setInt(1, order.getuId());
			preparedStatement.setInt(2, order.getScId());
			preparedStatement.setString(3, order.getStatus());
			preparedStatement.setString(4, order.getTotal());
			preparedStatement.setString(5, order.getpEmail());
			preparedStatement.setString(6, order.getpNumber());
			preparedStatement.setString(7, order.getorderAddress());
			preparedStatement.setInt(8, order.getQuantity());
			preparedStatement.executeUpdate();
		}
    	catch (Exception e) 
    	{
    		 System.out.println("Error from Orderdao************************");
    		 e.printStackTrace();
		}
    }
    
    public List<Order> getOrderDetails(int uId)
    {
    	List<Order> orderItems = new ArrayList<>();
    	try 
    	{
    		Connection con = getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM orderitem Where uId=?");
			preparedStatement.setInt(1, uId);
			ResultSet rs = preparedStatement.executeQuery();
	        while (rs.next()) 
	        {
	            Order order = new Order();
	            order.setOrderId(rs.getInt(1));
	            order.setuId(rs.getInt(2));
	            order.setScId(rs.getInt(3));
	            order.setStatus(rs.getString(4));
	            order.setTotal(rs.getString(5));
	            order.setpEmail(rs.getString(6));
	            order.setpNumber(rs.getString(7));
	            order.setorderAddress(rs.getString(8));
	            order.setQuantity(rs.getInt(9));
	            SubCategory dish = getSubCategoryFromScid(rs.getInt(3));
	            order.setSubCategory(dish);
	            orderItems.add(order);
	        }
	        con.close(); 
    	}
    	catch (Exception e) 
    	{
    		 System.out.println("Error from CartItemdao getCartDetails************************");
    		 e.printStackTrace();
		}
    	return orderItems;
    }
    
    public List<Order> getAllOrders()
    {
    	List<Order> ordersList = new ArrayList<>();
    	try 
    	{
    		Connection con = getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM orderitem");
			ResultSet rs = preparedStatement.executeQuery();
	        while (rs.next()) 
	        {
	            Order order = new Order();
	            order.setOrderId(rs.getInt(1));
	            order.setuId(rs.getInt(2));
	            order.setScId(rs.getInt(3));
	            order.setStatus(rs.getString(4));
	            order.setTotal(rs.getString(5));
	            order.setpEmail(rs.getString(6));
	            order.setpNumber(rs.getString(7));
	            order.setorderAddress(rs.getString(8));
	            order.setQuantity(rs.getInt(9));
	            SubCategory dish = getSubCategoryFromScid(rs.getInt(3));
	            order.setSubCategory(dish);
	            ordersList.add(order);
	        }
	        con.close();  
		}
    	catch (Exception e) 
    	{
    		 System.out.println("Error from dao************************");
    		 e.printStackTrace();
		}
    	return ordersList;
    }
    
    public SubCategory getSubCategoryFromScid(int scId)
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
    
    public void updateOrder(String status , int orderId)
    {
    	try 
    	{
    		Connection con = getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("UPDATE orderitem set status=? where orderId=?");
			preparedStatement.setString(1, status);
			preparedStatement.setInt(2, orderId);
			preparedStatement.executeUpdate();
		}
    	catch (Exception e) 
    	{
    		 System.out.println("Error from Orderdao************************");
    		 e.printStackTrace();
		}
    }
}
