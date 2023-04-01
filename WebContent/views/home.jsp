<%@page import="com.restaurant.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>fooDiemAniac</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/imgs/cutlery.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style><%@include file="/resources/css/style.css"%></style>
</head>
<body  onload="moveImg()">
<div class="mainDiv">
	<div class="rightFlex">
		<div class="userDetail">
			<%@ include file="userDetails.jsp" %>
		</div>
		<div class="sideBar">
			<%@ include file="sidebar.jsp" %>
		</div>
	</div>
	<div class="Core">
		<%@ include	file="Core.jsp" %>
	</div>
	<div class="cart">
		<%@ include file="cart.jsp" %>
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