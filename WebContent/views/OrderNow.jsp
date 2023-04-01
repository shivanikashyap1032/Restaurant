<%@page import="com.restaurant.entity.SubCategory"%>
<%@page import="com.restaurant.dao.OrderDao"%>
<%@page import="com.restaurant.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>order now - fooDiemAniac</title>
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
	int sCId = 0; 
	User userPlaceOrder = (User)session.getAttribute("user");
	String subCategoryId = request.getParameter("scId");
	if(subCategoryId != null && subCategoryId != "")
	{
		sCId = Integer.parseInt(subCategoryId);
	}
	if(sCId != 0)
	{
		OrderDao getDishDetails = new OrderDao();
		SubCategory dishDetail = getDishDetails.getSubCategoryFromScid(sCId);
		if(userPlaceOrder != null)
		{
%>
			<div class="bookingsBar">
			<div class="formBar container" style="width: 20vw;">
				<hr style="color: white">
				<p class="userDetailsBooking mt-3"><%= userPlaceOrder.getuName() %></p>
				<hr style="color: white">
				<p class="userDetailsBooking"><%= userPlaceOrder.getPhoneNo() %></p>
				<hr style="color: white">
				<p class="userDetailsBooking"><%= userPlaceOrder.getEmail() %></p>
				<hr style="color: white">
			</div>
			<div class="bookingsCore">
			<div class="orderNowForm">
				<form action="<%=request.getContextPath()%>/CartItemController" method="post" class="p-3" onsubmit="return validateThisForm()">
					<h2 class="text-center pt-3" style="color: #1F63EA;">place an order</h2>
					<input type="text" hidden=true name="uNameOrder" value="<%= userPlaceOrder.getuId()%>">
					<input type="text" hidden=true name="dishNameOrder" value="<%= dishDetail.getsCId()%>">
					<div class="mb-3 mt-4">
						<p class="form-control" id="uName"><%= userPlaceOrder.getuName() %></p>
  					</div>
  					
  					<div class="mb-3">
  					   	<input type="text" class="form-control" id="phoneNo" name="phoneNo" value="<%= userPlaceOrder.getPhoneNo() %>">
 					</div>
	
  					<div class="mb-3">
  					    <input type="email" class="form-control" id="email" name="email" value="<%= userPlaceOrder.getEmail() %>">
  					</div>
  					
  					<div class="mb-3">
  					  	<textarea class="form-control" placeholder="Enter address" id="address" name="address"><%= userPlaceOrder.getAddress() %></textarea>
  					</div>
  					
  					<div class="mb-1">
    					<p class="form-control" id="sName"> <%= dishDetail.getsName()%></p>
  					</div>
  					
  					<div class="mb-3 ps-2">
    					<p id="price" style="color: #1F63EA"> price :  <%= dishDetail.getPrice()%></p>
  					</div>
  					
  					<div class="form-group row float-right ps-2 mb-1" style="margin-top: -3vh;">
  						<label for="quantity" class="col-sm-2 col-form-label" style="color: #1F63EA">quantity</label>
  						<div class="col-sm-10">
    						<input style="width: 3vw ; height: 4vh;" type="text" class="form-control mt-2" id="quantity" name="quantity" value="1"  onkeyup="makeTotal(this.value)">
 				 		</div>
					</div>
  					
  					<div class="form-group row float-right ps-2">
  						<label for="total" class="col-sm-2 col-form-label" style="color: #1F63EA">total</label>
    					<div class="col-sm-10">		
    					<input hidden=true type="text" value="<%= dishDetail.getPrice() %>" id="bill" >
    						<input style="width: 8vw ; height: 4vh; margin-top: 1vh;" type="text" class="form-control text-center" value="<%= dishDetail.getPrice() %>" id="total" name="total" readonly>
  						</div>
  					</div>
  					
  					<div class="container mt-3 text-center pb-2">
  						<button type="submit" class="confirmOrderBtn" value="orderNow" name="addBtn" onclick="consoleit()"> confirm order</button>
  					</div>
  					
				</form>
			</div>
			</div>
			</div>
<%
		}
		else
		{
%>
			<h2 style="margin-top: 40vh; margin-left: 30vw;">please login to place an order</h2>
<% 
		}
	}
	else
	{
		if(userPlaceOrder != null)
		{
%>
			<div class="bookingsBar">
			<div class="formBar container" style="width: 20vw;">
				<img class="mt-5 ms-5" alt="couldn't load" src="../resources/imgs/restaurant.png">
				<hr style="color: white">
				<p class="userDetailsBooking mt-3"><%= userPlaceOrder.getuName() %></p>
				<hr style="color: white">
				<p class="userDetailsBooking"><%= userPlaceOrder.getPhoneNo() %></p>
				<hr style="color: white">
				<p class="userDetailsBooking"><%= userPlaceOrder.getEmail() %></p>
				<hr style="color: white">
			</div>
			<h3 style="position: absolute; left: 45%; top: 43%;">please go to menu to select dish</h3>	
			</div>
<% 
		}
	}
%>
</div>
<script>
	function makeTotal(quantity){
		if(quantity >= 1)
		{
			let totalTag = document.getElementById("bill");
			let price = totalTag.value;
			let totalBill = price.substr(0, price.length-2);
			let totalPrice = document.getElementById("total");
			totalPrice.value = totalBill * quantity + "/-";
		}
	}
	
	function validateThisForm(){
		let checkQuantity = document.getElementById("quantity");
		if(checkQuantity.value < 1)
		{
			alert("quantity can't be 0");
			return false;
		}
		return true;
	}
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
	</script>
	<script ><%@include file="/resources/js/script.js"%></script>
</body>
</html>