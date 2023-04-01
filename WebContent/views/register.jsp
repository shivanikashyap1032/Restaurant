<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>signup - fooDiemAniac</title>
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
<div class="formBar container mt-5">	
	<form action="/Restaurant/UserController" method="post" class="form" style="height: 80vh; margin-top: 5vh;">
		<img alt="logo" src="${pageContext.request.contextPath}/resources/imgs/cutlery.png" style="height: 5vh; margin-left: 45%; margin-top: -1vh;">
		<h2 class="text-center pt-1" style="color: white;">sign up</h2>
  			<div class="mb-3 mt-3">
    			<input type="text" class="form-control" id="uName" name="uName" aria-describedby="emailHelp" placeholder="Enter your name">
  			</div>
	
  			<div class="mb-3">
    			<input type="text" class="form-control" id="phoneNo" name="phoneNo" aria-describedby="emailHelp" placeholder="Enter mobile number">
 			</div>
	
  			<div class="mb-3">
    			<input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
    			<div id="emailHelp" class="form-text" style="color: white;">We'll never share your email with anyone else.</div>
  			</div>
  
  			<div class="mb-3">
    			<input type="password" class="form-control" id="password" name="password" placeholder="Make password">
  			</div>
  			
  			<div class="mb-3">
  				<textarea class="form-control" placeholder="Enter address" id="address" name="address"></textarea>
  			</div>
  			
  			<div class="container mt-3 text-center pb-2">
  				<button type="submit" class="white">REGISTER</button><br>
  				<a href="login.jsp" style="color: white">already have an account</a>
  			</div>
	</form>
<%
		String message = "";
		message = (String)session.getAttribute("registerMessage");
		if(message != null && !message.equals(""))
		{
%>
		<h5 class="ms-5"><%= message %></h5>
<%
		}
%>
</div>
</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
	</script>
	<script ><%@include file="/resources/js/script.js"%></script>
</body>
</html>