<%@page import="com.restaurant.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.restaurant.entity.User"%>
<%@page import="com.restaurant.dao.CartItemDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="logoCart mb-2">
	<h4 class="text-center p-2"><img alt="logo" src="resources/imgs/empty-cart.png" style="height: 5vh; margin-right: 0.5vw; margin-top: -1vh;">Cart</h4>
</div>
<div class="mt-2 myCart">
<% 
	User cartUser = (User)session.getAttribute("user");
	if(cartUser != null)
	{
		CartItemDao getCartitems = new CartItemDao();
		List<Cart> cartItems = getCartitems.getCartDetails(cartUser.getuId());
		if(cartItems.size() != 0)
		{
			for(Cart cartItem : cartItems)
			{
%>
<form action="<%=request.getContextPath()%>/CartItemController" method="post">
<input hidden=true value="<%=cartUser.getuId() %>" name="uId"></input>
<input hidden=true value="<%=cartItem.getCartId() %>" name="cartId"></input>
		<div class="myCard card m-2" style="width: 22vw;">
			<div class="card-body">
				<h5 class="card-title"><%= cartItem.getSubCategory().getsName() %></h5>
				<p class="card-text"><%= cartItem.getSubCategory().getDetails() %></p>
				<h6 class="card-subtitle mb-3 text-muted"><%= cartItem.getSubCategory().getPrice()%></h6>
				<button type="button"
					class="rightBtn btn btn-outline-success float-right mt-4" value="orderNow"name="addBtn" onclick="location.href='views/OrderNow.jsp?scId=<%= cartItem.getSubCategory().getsCId()%>'">Order
					Now</button>
				<button type="submit" id="addCartButton"
					class="btn btn-outline-info float-right" name="addBtn" value="remove">Remove
					from Cart</button>
			</div>
		</div>
		</form>
	<%
			}
		}
		else
		{
		%>
			<img alt="logo" src="resources/imgs/add-to-cart.png" style="height: 25vh; margin-left: 5vw; margin-top: 25vh; display: block;opacity: 70%;">
			<p style="font-size: 3vh; margin-left: 8.5vw; letter-spacing: 0.1em">Your Cart</p>
			<p style="font-size: 3vh; margin-left: 8.5vw; letter-spacing: 0.1em">Is Empty</p>
		<%}
	%>
	
<%
	}
	else
	{
%>
		<img alt="logo" src="resources/imgs/login.png" style="height: 25vh; margin-left: 5vw; margin-top: 25vh; display: block;opacity: 70%;">	
		<p style="font-size: 3vh; margin-left: 6vw; margin-top:2vh; letter-spacing: 0.1em;">Please Log In </p>
		<p style="font-size: 3vh; margin-left: 5vw; letter-spacing: 0.1em">To See Your Cart</p>
<%
	}
%>
</div>