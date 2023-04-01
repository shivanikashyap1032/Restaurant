<%@page import="java.util.List"%>
<%@page import="com.restaurant.entity.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.restaurant.dao.CategoryDao" %>
<%
	CategoryDao getList = new CategoryDao();
	List<Category> allCategories = getList.getAllCategoriesList();
%>
<div class="container form mt-5">	
	<form action="SubCategoryController" method="post">
		<h2 class="text-center pt-3 mb-4">add sub category</h2>
		<div class="form-group p-1">
      	<label class="ps-1 control-label" for="date">Choose a category</label>
      	<div class="p-2">
      		<select class="form-select me-2" id="cId" name="cId" required>
        	<option selected type="hidden" disabled>Select category</option>
        	<% for (Category category : allCategories) { %>
        			<option value="<%= category.getcId() %>"><%= category.getcName() %></option>
        	<% } %>
    		</select>
    	</div>
    	</div>
  			<div class="mb-3">
    			<input type="text" class="form-control" id="sName" name="sName" placeholder="Enter dish name">
  			</div>
  			<div class="mb-3">
    			<input type="text" class="form-control" id="price" name="price" placeholder="Enter price">
  			</div>
  			<div class="form-group p-1">
	   			<label class="ps-1 control-label" for="details">Details</label>
  				<textarea id="details" name="details" class="form-control" placeholder="Enter sun special detail about dish"></textarea>
	  		</div>
  			<div class="container mt-3 text-center pb-3">
  				<button type="submit" class="approveBtnBooking" style="width: 7vw">add</button>
  			</div>
	</form>
</div>