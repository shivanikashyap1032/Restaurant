	<%@page import="com.restaurant.entity.User"%>
<%@page import="com.restaurant.entity.SubCategory"%>
	<%@page import="com.restaurant.dao.SubCategoryDao"%>
	<%@page import="com.restaurant.entity.Category"%>
	<%@page import="java.util.List"%>
	<%@page import="com.restaurant.dao.CategoryDao"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>
	<%
		User userMenu = (User)session.getAttribute("user");	
		int uId = 0;
		if(userMenu != null)
		{
			uId = userMenu.getuId();
		}
		CategoryDao getList = new CategoryDao();
		List<Category> allCategories = getList.getAllCategoriesList();
	%>
	<div class="mt-2">
	   <input id="search-input" class="search form-control me-2" type="search" placeholder="Search" aria-label="Search" onkeyup="searchSubCategory(this.value)">
	</div>
	
	<div class="selectFood">
	<% for (Category category : allCategories) {%>
		<button class="m-2" onclick="toggleMenu('btn<%= category.getcName() %>')" value="<%= category.getcId() %>" id="btn<%= category.getcName() %>">
			<%= category.getcName()%><i class="crossBtn crossBtnClose" id='crossBtn<%= category.getcName() %>' onclick="toggleCrossBtn('crossBtn<%= category.getcName() %>' , event)">&times;</i>
		</button>
		<% } %>
	</div>
	<div class="menu" id="restaurantMenu">
		<%
			for (Category category : allCategories) {
				String search = "";
			%>
			<input type="text" value="<%= search %>" name="searchedInput">
				<div class="myCard1 card m-2" id="id<%=category.getcName() %>">
				<div class="card-body">
				<h5 class="card-title"><%= category.getcName()%></h5>
			<%	List<SubCategory> allDishes = category.getAllDishes();
				for (SubCategory s : allDishes) {
		%>
		<div class="card m-2 searchSubCategory">
			<div class="card-body">
			<form  action="<%=request.getContextPath()%>/CartItemController" method="post" onsubmit="return validateUser()">
			<input hidden=true value="<%=s.getsCId() %>" name="scId"></input>
			<input hidden=true value="<%=s.getcId()%>" name="cId"></input>
			<input id="userIdMenu" hidden=true value="<%= uId %>" name="uId"></input>
			
				<h5 class="card-title"><%= s.getsName() %></h5>
				<a href="#" class="btn btn-link btn-sm float-right mr-2"
					data-toggle="modal" data-target="#dish-details-modal">i</a>
				<p class="card-text"><%= s.getDetails() %></p>
				<h6 class="card-subtitle mb-2 text-muted"><%= s.getPrice() %></h6>
				<button type="button"
					class="rightBtn btn btn-outline-success float-right m-2" value="orderNow"name="addBtn" onclick="location.href='views/OrderNow.jsp?scId=<%= s.getsCId() %>'" >Order Now</button>
				<button type="submit" id="addCartButton"
					class="rightBtn cartBtn btn btn-outline-info float-right mt-2" value="add" name="addBtn">Add to Cart</button>
				</form>
			</div>
		</div>
		<%
			}%>
			</div></div>
		<% 	}
		%>
	</div>
