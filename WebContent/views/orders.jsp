<%@page import="java.util.ArrayList"%>
<%@page import="com.restaurant.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.restaurant.dao.OrderDao"%>
<%@page import="com.restaurant.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>orders - fooDiemAniac</title>
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
	User ordersUser = (User)session.getAttribute("user");
	if(ordersUser != null)
	{
%>
		<div class="bookingsBar">
			<div class="formBar container" style="width: 20vw;">
				<hr style="color: white">
				<p class="userDetailsBooking mt-3"><%= ordersUser.getuName() %></p>
				<hr style="color: white">
				<p class="userDetailsBooking"><%= ordersUser.getPhoneNo() %></p>
				<hr style="color: white">
				<p class="userDetailsBooking"><%= ordersUser.getEmail() %></p>
				<hr style="color: white">
			</div>
<%	
		OrderDao getOrdersOfUser = new OrderDao();
		List<Order> userOrdersList = getOrdersOfUser.getOrderDetails(ordersUser.getuId());
		if(userOrdersList.size() != 0)
		{
			
%>
			<div class="bookingsCore">
				<h6 class="text-center mt-3">Your Orders</h6>
				<div class="bookingsDetails">
<%
			for(Order orders : userOrdersList)
			{
%>	
				<form action="/Restaurant/OrderController" method="post">
					<div class="bookingsDetailslist mt-2" >
					<input hidden=true name="orderId" value="<%= orders.getOrderId() %>">
						<h6 class="ms-3 mt-1">orderId : <%= orders.getOrderId() %></h6>
						
						<h6 style="position: absolute;top: 1%; left: 20%">number : <%= orders.getpNumber() %></h6>
						<h6 style="position: absolute;top: 25%; left: 20%">email : <%= orders.getpEmail()%></h6>
						<h6 style="position: absolute;top: 45%; left: 20%">address : <%= orders.getorderAddress()%></h6>
						
						<h6 style="position: absolute;top: 1%; left: 58%"> <%= orders.getSubCategory().getsName() %></h6>
						<h6 style="position: absolute;top: 25%; left: 58%">price : <%= orders.getSubCategory().getPrice() %></h6>
						<h6 style="position: absolute;top: 45%; left: 58%">quantity : <%= orders.getQuantity()%></h6>
						<h6 style="position: absolute;top: 65%; left: 58%">total : <%= orders.getTotal() %></h6>
						
						<h6 style="position: absolute;top: 1%; right: 0" class="me-3">date : random date</h6>
<%
				String color = null;
				if(orders.getStatus().equals("Pending"))
				{
					color = "#E8C902";
				}
				else if(orders.getStatus().equals("Rejected"))
				{
					color = "#F70101";
				}	
				else if(orders.getStatus().equals("Canceled"))
				{
					color = "#7F8389";
				}
				else if(orders.getStatus().equals("Approved"))
				{
					color = "#0000FE";
				}
				else if(orders.getStatus().equals("delivered"))
				{
					color = "#2EC500";
				}
				else if(orders.getStatus().equals("outForDelivery"))
				{
					color = "#FC6B02";
				}
%>
						<h6 style="position: absolute;top: 25%; right: 0; color: <%= color%>" class="me-3">Status : <%= orders.getStatus() %></h6>
<%
				if(!orders.getStatus().equals("Rejected") && !orders.getStatus().equals("Canceled") && !orders.getStatus().equals("outForDelivery") && !orders.getStatus().equals("delivered"))
				{
%>

						<button class="cancelBtnBooking" style="position: absolute;top: 60%; left: 1%" name="orderBtns" value="Canceled">cancel</button>
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
			<h2  style="position: absolute; left: 45%; top: 43%;">you did not placed any order yet.</h2>
<%
			
		}
%>
	</div>
<%		
	}
	else
	{
%>
		<h2 style="margin-top: 50vh;  margin-left: 30vw;">Please log in first to check your orders</h2>
<%	
	}
%>
</div> 
<script ><%@include file="/resources/js/script.js"%></script>
</body>
</html>
