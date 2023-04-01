<%@page import="com.restaurant.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%
		User user = (User)session.getAttribute("user");
		if(user == null)
		{
	%>
		<a href="views/login.jsp">signin<i></i></a>
		<a href="views/register.jsp">signup<i></i></a>
	<%
		}
		else
		{
	%>
	<div class="Loggeduser">
		<p>hello,</p>
		<span><%= user.getuName()%> </span>
	</div>
	<%
		}
	%>