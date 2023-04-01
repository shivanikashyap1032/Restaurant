<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style><%@include file="/resources/css/adminStyle.css"%></style>
</head>
<body>
	
<div class="container form mt-5">	
	<form action="../../AdminLoginController" method="post">
		<img alt="couldn't load" src="../resources/imgs/restaurant.png">
		<h2 class="text-center pt-3 mb-4">sign in</h2>
  			<div class="mb-3">
    			<input type="text" class="form-control" id="adminName" name="adminName" placeholder="Enter credentials">
  			</div>
  
  			<div class="mb-3">
    			<input type="password" class="form-control" id="password" name="password" placeholder="enter credentials">
  			</div>
  			
  			<div class="container mt-3 text-center pb-3">
  				<button type="submit" class="btn btn-outline-primary">login</button>
  			</div>
	</form>
</div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
	</script>
	<script ><%@include file="/resources/js/script.js"%></script>
</body>
</html>