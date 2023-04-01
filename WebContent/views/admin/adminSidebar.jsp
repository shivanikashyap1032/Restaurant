<%@page import="com.restaurant.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div>
	<div class="sideBarFirst">
		<button onclick="showAdminContent('Orders')" class="approveBtnBooking" style="text-transform: uppercase; width: 17vw;">Orders</button>
		<button onclick="showAdminContent('Bookings')" class="approveBtnBooking" style="text-transform: uppercase; width: 17vw;">Bookings</button>
		<button onclick="showAdminContent('addCategory')" class="approveBtnBooking" style="text-transform: uppercase; width: 17vw;">Add Category</button>
		<button onclick="showAdminContent('addSubCategory')" class="approveBtnBooking" style="text-transform: uppercase; width: 17vw;">Add SubCategory</button>
		<button onclick="showAdminContent('userList')" class="approveBtnBooking" style="text-transform: uppercase; width: 17vw;">Users</button>
		<form action="<%=request.getContextPath()%>/Logout" method="post">
		<button id="logOut" class="approveBtnBooking" name="logoutBTn" value="adminLogOut" style="text-transform: uppercase; width: 17vw;">Log Out</button>
		</form>
	</div>
</div>
	<%
		User admin1 = (User)session.getAttribute("admin");
		if(admin1 != null)
		{
	%>
	<%
		}
	%>