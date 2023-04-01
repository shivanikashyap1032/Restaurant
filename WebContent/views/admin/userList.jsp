<%@page import="java.util.List"%>
<%@page import="com.restaurant.entity.User"%>
<%@page import="com.restaurant.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User userDetailsAdmin = (User)session.getAttribute("admin");
	if(userDetailsAdmin != null)
	{
		UserDao getAllUsers = new UserDao();
		List<User> usersList = getAllUsers.getAllUserDetails();
		if(usersList.size() != 0)
		{
%>
			<div class="bookingsCore">
				<h6 class="text-center">Users List</h6>
				<div class="bookingsDetails">
<%			for(User userL : usersList)
			{
%>
				<form action="/Restaurant/DeleteUser" method="post">
					<div class="bookingsDetailslist mt-2" style="height: 5vh;display: flex;align-items: center;">
						<input hidden=true name="uId" value="<%= userL.getuId() %>">
						<h6 class="ms-3" style="position: absolute; left: 1%"><span style="color: blue">Name : </span> <%= userL.getuName() %></h6>
						<h6 class="ms-3" style="position: absolute; left: 15%"><span style="color: blue">email : </span><%= userL.getEmail() %></h6>
						<h6 class="ms-3" style="position: absolute; left: 40%"><span style="color: blue">mo. : </span><%= userL.getPhoneNo() %></h6>
						<h6 class="ms-3" style="position: absolute; left: 60%"><span style="color: blue">address : </span><%= userL.getAddress() %></h6>
						<button class="cancelBtnBooking" style="position: absolute; right: 1%">delete</button>
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
			<h2>There is no user yet.</h2>
<%
		}
	}
	else
	{
%>
		<h2>login first</h2>
<%		
	}
%>	
