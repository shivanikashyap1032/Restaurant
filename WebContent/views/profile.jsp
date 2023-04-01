<%@page import="com.restaurant.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile - fooDiemAniac</title>
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
	<h2>fooDiemAniac</h2>
</nav>

<%
	User userProfile = (User) session.getAttribute("user");
	if(userProfile != null)
	{
%>

<div class="container editBar">	
	<form action="../ProfileController" method="post" class="editFrom">
	<input type="text" hidden=true value="<%= userProfile.getuId() %>" name="uId">
  			<div>
    			<input type="text" class="form-control" id="uName" name="uName" aria-describedby="emailHelp" style="border: none;" value="<%= userProfile.getuName() %>">
  			</div>
			<hr>
  			<div>
    			<input type="text" class="form-control" id="phoneNo" name="phoneNo" aria-describedby="emailHelp"  style="border: none;" value="<%= userProfile.getPhoneNo() %>">
 			</div>
			<hr>
  			<div>
    			<input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp"  style="border: none;" value="<%= userProfile.getEmail() %>">
  			</div>
  			<hr>
  			<div>
  				<textarea class="form-control" style="border: none;" id="address" name="address" ><%= userProfile.getAddress() %></textarea>
  			</div>
  			<div class="container mt-3 text-center pb-2">
  				<button type="submit" class="blue" style="width: 25vw;">SAVE CHANGES</button><br>
  			</div>
	</form>
</div>
</div>
<%
	}
	else
	{
%>
<h1 style="margin-top: 50vh; margin-left: 30vw">please login first to see profile</h1>
<%
	}
%>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
	</script>
	<script ><%@include file="/resources/js/script.js"%></script>
</body>
</html>