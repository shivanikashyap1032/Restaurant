<%@page import="com.restaurant.dao.BookingsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.restaurant.entity.Bookings"%>
<%@page import="java.util.List"%>
<%@page import="com.restaurant.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bookings - fooDiemAniac</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/imgs/cutlery.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style><%@include file="/resources/css/style.css"%></style>
</head>
<body>
<div class="mainDiv" style="flex-direction: column;">
<nav class="navLogo">
	<h2><img alt="logo" src="${pageContext.request.contextPath}/resources/imgs/cutlery.png" style="height: 5vh; margin-right: 0.5vw; margin-top: -1vh;">fooDiemAniac</h2>
</nav>
<%
	User BookingsUser = (User)session.getAttribute("user");
	if(BookingsUser != null)
	{
%>
		<div class="bookingsBar">
			<div class="formBar container" style="width: 20vw;">
				<hr style="color: white">
				<p class="userDetailsBooking mt-3"><%= BookingsUser.getuName() %></p>
				<hr style="color: white">
				<p class="userDetailsBooking"><%= BookingsUser.getPhoneNo() %></p>
				<hr style="color: white">
				<p class="userDetailsBooking"><%= BookingsUser.getEmail() %></p>
				<hr style="color: white">
			</div>
<%	
		BookingsDao getBookingsOfUser = new BookingsDao();
		List<Bookings> userBookingsList = getBookingsOfUser.getBookingsDetails(BookingsUser.getuId());
		if(userBookingsList.size() != 0)
		{
			
%>
			<div class="bookingsCore">
				<h6 class="text-center">Your bookings</h6>
				<div class="bookingsDetails">
<%
			for(Bookings bookings : userBookingsList)
			{
%>	
				<form action="/Restaurant/BookingsServlet" method="post">
					<div class="bookingsDetailslist mt-2" >
					<input hidden=true name="bookingId" value="<%= bookings.getBookingId() %>">
						<h6 class="ms-3">bookingId : <%= bookings.getBookingId() %></h6>
						<h6 class="ms-3">persons : <%= bookings.getPersons() %></h6>
						<h6 style="position: absolute;top: 0; right: 48%">table requested by <%= bookings.getName() %></h6>
						<h6 style="position: absolute;top: 20%; right: 48%">number : <%= bookings.getNumber() %></h6>
						<h6 style="position: absolute;top: 40%; right: 48%">email : <%= bookings.getEmail() %></h6>
						<h6 style="position: absolute;top: 0; right: 28%">from : <%= bookings.getFromTime() %></h6>
						<h6 style="position: absolute;top: 20%; right: 28%">to : <%= bookings.getToTime() %></h6>
						<h6 style="position: absolute;top: 0; right: 0" class="me-3">date : <%= bookings.getDate() %></h6>
<% 
						String color = null;
							if(bookings.getStatus().equals("Pending"))
							{
								color = "#E8C902";
							}
							else if(bookings.getStatus().equals("Rejected"))
							{
								color = "#F70101";
							}
							else if(bookings.getStatus().equals("canceled"))
							{
								color = "#7F8389";
							}
							else if(bookings.getStatus().equals("Approved"))
							{
								color = "#0000FE";
							}
							else if(bookings.getStatus().equals("Visited"))
							{
								color = "#2EC500";
							}
%>							
						<h6 style="position: absolute;top: 40%; right: 0;  color: <%= color %>" class="me-3" id="status<%= bookings.getStatus() %>">Status : <%= bookings.getStatus() %></h6>
						<hr>
<%
				if(!bookings.getStatus().equals("Rejected") && !bookings.getStatus().equals("canceled") && !bookings.getStatus().equals("Completed"))
				{
%>
						<button class="cancelBtnBooking" style="position: absolute;top: 70%; right: 1%" name="table" value="cancel">cancel</button>
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
			<h3 style="position: absolute; left: 45%; top: 43%;">you did not book any table yet.</h3>
<%	
		}
%>
	</div>
<%		
	}
	else
	{
%>
		<h2 style="margin-top: 40vh; margin-left: 30vw;">Please log in first to check your bookings</h2>
<%	
	}
%>
</div> 
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
	</script>
	<script ><%@include file="/resources/js/script.js"%></script>
</body>
</html>