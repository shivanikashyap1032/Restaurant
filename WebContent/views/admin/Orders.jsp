<%@page import="com.restaurant.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.restaurant.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.restaurant.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	User ordersAdmin = (User)session.getAttribute("admin");
	if(ordersAdmin != null)
	{
		OrderDao getOrdersOfUsers = new OrderDao();
		List<Order> OrdersList = getOrdersOfUsers.getAllOrders();
		if(OrdersList.size() != 0)
		{
%>			<div class="bookingsCore">
				<h6 class="text-center">Orders</h6>
				<div class="bookingsDetails">
<%			
			for(Order orders : OrdersList)
			{
%>
				<form action="/Restaurant/OrderController" method="post">
				<div class="bookingsDetailslist mt-2" >
				<input hidden=true name="orderId" value="<%= orders.getOrderId()%>">
					<h6 class="ms-3">orderId : <%= orders.getOrderId() %></h6>
					<h6 class="ms-3">userId : <%= orders.getuId() %></h6>
					<h6 style="position: absolute;top: 0; left: 18%">mo : <%= orders.getpNumber() %></h6>
					<h6 style="position: absolute;top: 20%; left: 18%">email : <%= orders.getpEmail() %></h6>
					<h6 style="position: absolute;top: 40%; left: 18%">address : <%= orders.getorderAddress() %></h6>
					<h6 style="position: absolute;top: 0; left: 50%">dish : <%= orders.getSubCategory().getsName() %></h6>
					<h6 style="position: absolute;top: 20%; left: 50%">price : <%= orders.getSubCategory().getPrice() %></h6>
					<h6 style="position: absolute;top: 40%; left: 50%">quantity : <%= orders.getQuantity() %></h6>
					<h6 style="position: absolute;top: 60%; left: 50%">total : <%= orders.getTotal() %></h6>
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
				if(!orders.getStatus().equals("Rejected") && !orders.getStatus().equals("canceled") && !orders.getStatus().equals("delivered") && !orders.getStatus().equals("outForDelivery"))
				{
%>
					<button class="cancelBtnBooking" style="position: absolute;top: 75%; right: 1%" name="orderBtns" value="Rejected">Reject</button>
					<button class="approveBtnBooking" style="position: absolute;top: 75%; right: 20%" name="orderBtns" value="Approved">Approve</button>
<% 					
				}
%>	
<%
				if(!orders.getStatus().equals("Rejected") && !orders.getStatus().equals("canceled") && !orders.getStatus().equals("delivered") && !orders.getStatus().equals("outForDelivery"))
				{
%>
					<button class="cancelBtnBooking" style="position: absolute;top: 75%; right: 1%" name="orderBtns" value="Rejected">Reject</button>
					<button class="approveBtnBooking" style="position: absolute;top: 75%; right: 20%" name="orderBtns" value="Approved">Approve</button>
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
			<h2>there is no orders yet</h2>
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