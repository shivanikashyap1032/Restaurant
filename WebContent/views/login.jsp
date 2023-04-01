<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>signin - fooDiemAniac</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/imgs/cutlery.png">
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style><%@include file="/resources/css/style.css"%></style>
<body>

<div class="mainDiv" style="flex-direction: column;">
<nav class="navLogo">
	<h2><img alt="logo" src="${pageContext.request.contextPath}/resources/imgs/cutlery.png" style="height: 5vh; margin-right: 0.5vw; margin-top: -1vh;">fooDiemAniac</h2>
</nav>
<div class="formBar container mt-5">	
	<form action="/Restaurant/userLoginController" method="post" class="form">
		<img alt="logo" src="${pageContext.request.contextPath}/resources/imgs/cutlery.png" style="height: 5vh; margin-left: 45%; margin-top: -1vh;">
		<h2 class="text-center pt-1 mb-4" style="color: white;">sign in</h2>
  			<div class="mb-3">
    			<input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
  			</div>
  
  			<div class="mb-3">
    			<input type="password" class="form-control" id="password" name="password" placeholder="enter password">
  			</div>
  			
  			<div class="container mt-3 text-center pb-3">
  				<button type="submit" class="white">LOGIN</button>
  				<a href="/Restaurant/views/register.jsp" style="display: block; color: white;">don't have an account</a>
  			</div>
	</form>
	<%
		String message = "";
		message = (String)session.getAttribute("message");
		if(message != null && !message.equals(""))
		{
	%>
		<h6 class="ms-5"><%= message %></h6>
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