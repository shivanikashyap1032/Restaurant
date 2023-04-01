<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<div class="logo">
		<h2 class="text-center"><img alt="logo" src="resources/imgs/cutlery.png" style="height: 5vh; margin-right: 0.5vw; margin-top: -1vh;">fooDiemAniac</h2>
	</div>
	<div class="coreMain content coreToggle" id="bookTable">
		<%@ include file = "bookTable.jsp" %>
	</div>
	<div class="coreMain content" id="aboutUs">	
		<%@ include file = "aboutUs.jsp" %>
	</div>
	<div class="coreMain content coreToggle" id="menu">
		<%@ include file = "Menu.jsp" %>
	</div> 
