<%@page import="com.restaurant.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.restaurant.entity.Bookings"%>
<%@page import="java.util.List"%>
<%@page import="com.restaurant.dao.BookingsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	User BookingsAdmin = (User)session.getAttribute("admin");
	if(BookingsAdmin != null)
	{
		BookingsDao getBookingsOfUser = new BookingsDao();
		List<Bookings> BookingsList = getBookingsOfUser.getAllBookings();
		if(BookingsList.size() != 0)
		{
%>			<div class="bookingsCore">
				<h6 class="text-center">Bookings</h6>
				<div class="bookingsDetails">
<%			
			for(Bookings bookings : BookingsList)
			{
%>
				<form action="/Restaurant/BookingsServlet" method="post">
				<div class="bookingsDetailslist mt-2" >
				<input hidden=true name="bookingId" value="<%= bookings.getBookingId() %>">
					<h6 class="ms-3">bookingId : <%= bookings.getBookingId() %></h6>
					<h6 class="ms-3">userId : <%= bookings.getuId() %></h6>
					<h6 class="ms-3">persons : <%= bookings.getPersons() %></h6>
					<h6 style="position: absolute;top: 0; right: 48%">table requested by <%= bookings.getName() %></h6>
					<h6 style="position: absolute;top: 20%; right: 48%">number : <%= bookings.getNumber() %></h6>
					<h6 style="position: absolute;top: 40%; right: 48%">email : <%= bookings.getEmail() %></h6>
					<h6 style="position: absolute;top: 0; right: 28%">from : <%= bookings.getFromTime() %></h6>
					<h6 style="position: absolute;top: 20%; right: 28%">to : <%= bookings.getToTime() %></h6>
					<h6 style="position: absolute;top: 0; right: 0" class="me-3">date : <%= bookings.getDate() %></h6>
					<h6 style="position: absolute;top: 40%; right: 0" class="me-3">Status : <%= bookings.getStatus() %></h6>
					<hr>
<%
				if(!bookings.getStatus().equals("Rejected") && !bookings.getStatus().equals("canceled") && !bookings.getStatus().equals("delivered") && !bookings.getStatus().equals("outForDelivery"))
				{
%>
					<button class="cancelBtnBooking" style="position: absolute;top: 75%; right: 1%" name="table" value="Rejected">Reject</button>
					<button class="approveBtnBooking" style="position: absolute;top: 75%; right: 20%" name="table" value="Approved">Approve</button>
<% 					
				}
%>	
				</div>
				</form>
<%			
			}
%>
				</div>
			</div>
<% 

		}
		else
		{
%>			
			<h2>there is no bookings yet</h2>
<% 		
		}
%>
	
<% 
	}
	else
	{
%>
		<h2>login first</h2>
<%	
	}
%>	