package com.restaurant.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.entity.Bookings;

public class BookingsDao {

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
	    
	    public void bookTable(Bookings bookings)
	    {
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO booking (uId, persons, fromTime, toTime, Name, Number, Email, date, details, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				preparedStatement.setInt(1, bookings.getuId());
				preparedStatement.setInt(2, bookings.getPersons());
				preparedStatement.setString(3, bookings.getFromTime());
				preparedStatement.setString(4, bookings.getToTime());
				preparedStatement.setString(5, bookings.getName());
				preparedStatement.setString(6, bookings.getNumber());
				preparedStatement.setString(7, bookings.getEmail());
				preparedStatement.setDate(8, Date.valueOf(bookings.getDate()));
				preparedStatement.setString(9, bookings.getDetails());
				preparedStatement.setString(10, bookings.getStatus());
				preparedStatement.executeUpdate();
			}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from bookingsdao************************");
	    		 e.printStackTrace();
			}
	    }
	    
	    public List<Bookings> getAllBookings()
	    {
	    	List<Bookings> bookingsList = new ArrayList<>();
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM booking");
				ResultSet rs = preparedStatement.executeQuery();
		        while (rs.next()) 
		        {
		            Bookings booking = new Bookings();
		            booking.setBookingId(rs.getInt(1));
		            booking.setuId(rs.getInt(2));
		            booking.setPersons(rs.getInt(3));
		            booking.setFromTime(rs.getString(4));
		            booking.setToTime(rs.getString(5));
		            booking.setName(rs.getString(6));
		            booking.setNumber(rs.getString(7));
		            booking.setEmail(rs.getString(8));
		            booking.setDate(rs.getDate(9).toLocalDate());
		            booking.setDetails(rs.getString(10));
		            booking.setStatus(rs.getString(11));
		            bookingsList.add(booking);
		        }
		        con.close();  
			}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from bookingsdao************************");
	    		 e.printStackTrace();
			}
	    	return bookingsList;
	    }
	    
	    public List<Bookings> getBookingsDetails(int uId)
	    {
	    	List<Bookings> bookingItems = new ArrayList<>();
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM booking Where uId=?");
				preparedStatement.setInt(1, uId);
				ResultSet rs = preparedStatement.executeQuery();
		        while (rs.next()) 
		        {
		            Bookings booking = new Bookings();
		            booking.setBookingId(rs.getInt(1));
		            booking.setuId(rs.getInt(2));
		            booking.setPersons(rs.getInt(3));
		            booking.setFromTime(rs.getString(4));
		            booking.setToTime(rs.getString(5));
		            booking.setName(rs.getString(6));
		            booking.setNumber(rs.getString(7));
		            booking.setEmail(rs.getString(8));
		            booking.setDate(rs.getDate(9).toLocalDate());
		            booking.setDetails(rs.getString(10));
		            booking.setStatus(rs.getString(11));
		            bookingItems.add(booking);
		        }
		        con.close(); 
	    	}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from bookings************************");
	    		 e.printStackTrace();
			}
	    	return bookingItems;
	    }
	    
	    public void updateBooking(Bookings bookings)
	    {
	    	try 
	    	{
	    		Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("UPDATE booking set status=? where bookingId=?");
				preparedStatement.setString(1, bookings.getStatus());
				preparedStatement.setInt(2, bookings.getBookingId());
				preparedStatement.executeUpdate();
			}
	    	catch (Exception e) 
	    	{
	    		 System.out.println("Error from bookingdao updating************************");
	    		 e.printStackTrace();
			}
	    }
}
