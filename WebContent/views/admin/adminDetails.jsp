<%@page import="com.restaurant.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
		User admin = (User)session.getAttribute("admin");
		if(admin == null)
		{
	%>
	<div class="pt-5">
		<a class="btn white mb-3" href="views/login.jsp">signin</a>
	</div>
	<%
		}
		else
		{
	%>
	<div><%= admin.getuName()%></div>
	<%
		}
	%>