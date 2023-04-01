<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="form container mt-5">	
	<form action="CategoryController" method="post">
		<h2 class="text-center pt-3 mb-4">add category</h2>
  			<div class="mb-3">
    			<input type="text" class="form-control" id="cName" name="cName" placeholder="Enter category name">
  			</div>
  
  			<div class="mb-3">
  				<label for="formFile" class="form-label">Enter an image for category</label>
  				<input class="form-control" type="file" id="cImg" name="cImg">
			</div>
  			
  			<div class="container mt-3 text-center pb-3">
  				<button type="submit" class="approveBtnBooking" style="width: 7vw">add</button>
  			</div>
	</form>
</div>