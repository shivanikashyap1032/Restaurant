package com.restaurant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.entity.User;

public class UserDao {

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
    
    public String saveUser(User user)
    {
    	try 
    	{
    		Connection con = getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO user (uName, email, password, address, phoneNo, role) VALUES (?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, user.getuName());
	        preparedStatement.setString(2, user.getEmail());
	        preparedStatement.setString(3, user.getPassword());
	        preparedStatement.setString(4, user.getAddress());
	        preparedStatement.setString(5, user.getPhoneNo());
	        preparedStatement.setString(6, user.getRole());
	        preparedStatement.executeUpdate();
		}
    	catch (Exception e) 
    	{
    		 e.printStackTrace();
    		 return e.getMessage();
		}
    	return "Registered Successfully";
    }
    
    public User getUserDetails(User user)
    {
        try
        {  
            Connection con = getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from user where email=? AND password =?");  
            ps.setString(1, user.getEmail());  
            ps.setString(2, user.getPassword());
            ResultSet rs=ps.executeQuery();  
            if(rs.next())
            {  
            	user.setuId(rs.getInt(1));
            	user.setuName(rs.getString(2));
            	user.setEmail(rs.getString(3));
            	user.setPassword(rs.getString(4));
            	user.setAddress(rs.getString(5));
            	user.setPhoneNo(rs.getString(6));
            	user.setRole(rs.getString(7));
            }  
            else
            {
            	user = null;
            }
            con.close();  
        }
        
        catch(Exception ex)
        {
        	ex.printStackTrace();
        }  
         
        return user;
    }
    
    public List<User> getAllUserDetails()
    {
    	List<User> userList = new ArrayList<User>();
        try
        {  
            Connection con = getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from user");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
            	User user = new User();
            	user.setuId(rs.getInt(1));
            	user.setuName(rs.getString(2));
            	user.setEmail(rs.getString(3));
            	user.setPassword(rs.getString(4));
            	user.setAddress(rs.getString(5));
            	user.setPhoneNo(rs.getString(6));
            	user.setRole(rs.getString(7));
            	userList.add(user);
            }  
            con.close();  
        }
        
        catch(Exception ex)
        {
        	ex.printStackTrace();
        }  
        return userList;
    }
    
    public void updateUser(User user)
    {
    	try 
    	{
    		Connection con = getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("update user set uName=?, email=?, address=?, phoneNo=? where uId=?");
			preparedStatement.setString(1, user.getuName());
	        preparedStatement.setString(2, user.getEmail());
	        preparedStatement.setString(3, user.getAddress());
	        preparedStatement.setString(4, user.getPhoneNo());
	        preparedStatement.setInt(5, user.getuId());
	        preparedStatement.executeUpdate();
		}
    	catch (Exception e) 
    	{
    		 System.out.println("Error from dao************************");
    		 e.printStackTrace();
		}
    }
    
    public void deleteUser(int uId)
    {
    	try 
    	{
    		Connection con = getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("delete from user where uId=?");
			preparedStatement.setInt(1, uId);
	        preparedStatement.executeUpdate();
		}
    	catch (Exception e) 
    	{
    		 System.out.println("Error from delete userdao************************");
    		 e.printStackTrace();
		}
    }
}
