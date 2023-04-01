<%@page import="com.restaurant.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	User userSideBar = (User)session.getAttribute("user");
	String display = "";
	String margin = "";
	if(userSideBar == null)
	{
		margin = "20vh";
		display = "none";
	}
%>
	<div>
		<div class="sideBarFirst" style="margin-top: <%= margin %>">
			<button style="--clr:#1F63EA" onclick="showContent('aboutUs')">Our
				Kitchen<i></i></button>
			<button style="--clr:#ff1867" onclick="showContent('menu')">Menu<i></i></button>
			<button style="--clr:#FF8000" onclick="showContent('bookTable')">Book
				Table<i></i></button>
		</div>
		<div class="sideBarSecond" style="display: <%= display %>">
			<button id="profile" onclick="location.href='views/profile.jsp'" data-bs-toggle="modal"><span>Profile</span></button>
			<button id="orders" onclick="location.href='views/orders.jsp'"><span>Orders</span></button>
			<button id="bookings" onclick="location.href='views/bookings.jsp'"><span>Bookings</span></button>
			<form action="<%=request.getContextPath()%>/Logout" method="post">
				<button id="logout" name="logoutBTn" value="userLogOut"><span>Log Out</span></button>
			</form>
		</div>
	</div>
	<%
		User user1 = (User)session.getAttribute("user");
		if(user1 != null)
		{
	%>
	<%
		}
	%>