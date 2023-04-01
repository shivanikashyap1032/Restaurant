package com.restaurant.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restaurant.dao.BookingsDao;
import com.restaurant.entity.Bookings;

@WebServlet("/BookingsServlet")
public class BookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookingsServlet()
    {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String btn = request.getParameter("table");
		
		if(btn.equals("bookTable"))
		{
			try 
			{
				LocalDate date = LocalDate.parse(request.getParameter("date"));
				String fromTime = request.getParameter("timeFrom");
				String toTime = request.getParameter("timeTo");
				int persons = Integer.parseInt(request.getParameter("persons"));
				String details = request.getParameter("details");
				String name = request.getParameter("name");
				String number = request.getParameter("number");
				String email = request.getParameter("email");
				int uId = Integer.parseInt(request.getParameter("userBookings"));
				
				Bookings bookings = new Bookings();
				bookings.setuId(uId);
				bookings.setStatus("Pending");
				bookings.setDate(date);
				bookings.setDetails(details);
				bookings.setFromTime(fromTime);
				bookings.setToTime(toTime);
				bookings.setPersons(persons);
				bookings.setName(name);
				bookings.setNumber(number);
				bookings.setEmail(email);
				BookingsDao bookingsDao = new BookingsDao();
				bookingsDao.bookTable(bookings);
				response.setContentType("text/html");
				request.getRequestDispatcher("/views/home.jsp").forward(request, response);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		else if (btn.equals("cancel")) 
		{
			try 
			{
				int bookingId = Integer.parseInt(request.getParameter("bookingId"));
				Bookings bookings = new Bookings();
				bookings.setBookingId(bookingId);
				bookings.setStatus("canceled");
				BookingsDao updateBookings = new BookingsDao();
				updateBookings.updateBooking(bookings);
				response.setContentType("text/html");
				request.getRequestDispatcher("/views/bookings.jsp").forward(request, response);
			}
			catch (Exception e) 
			{
				System.out.println("Error while canceling");
				e.printStackTrace();
			}
		}
		else if(btn.equals("Approved") || btn.equals("Rejected"))
		{
			try 
			{
				int bookingId = Integer.parseInt(request.getParameter("bookingId"));
				Bookings bookings = new Bookings();
				bookings.setBookingId(bookingId);
				bookings.setStatus(btn);
				BookingsDao updateBookings = new BookingsDao();
				updateBookings.updateBooking(bookings);
				response.setContentType("text/html");
				request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
			}
			catch (Exception e) 
			{
				System.out.println("Error while Rejecting or approving");
				e.printStackTrace();
			}
		}
	}
}
