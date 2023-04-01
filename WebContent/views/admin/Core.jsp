<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="logo">
	<h2 class="text-center"><img alt="logo" src="resources/imgs/cutlery.png" style="height: 5vh; margin-right: 0.5vw; margin-top: -1vh;">fooDiemAniac</h2>
</div>
<div class="coreMain adminContent coreToggle" id="addCategory">
	<%@ include file = "addCategory.jsp" %>
</div>
<div class="coreMain adminContent coreToggle" id="addSubCategory">	
	<%@ include file = "addSubCategory.jsp" %>
</div>
<div class="coreMain adminContent coreToggle" id="Orders">
	<%@ include file = "Orders.jsp" %>
</div> 
<div class="coreMain adminContent" id="Bookings">
	<%@ include file = "Bookings.jsp" %>
</div> 
<div class="coreMain adminContent coreToggle" id="userList">
	<%@ include file = "userList.jsp" %>
</div> 