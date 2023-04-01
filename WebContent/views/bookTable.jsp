<%@page import="com.restaurant.entity.User"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	User userBookings = (User)session.getAttribute("user");
	int userIdBookings = 0; 
	if(userBookings != null)
 	{
 		userIdBookings = userBookings.getuId();
 	}
%>
<div class="bookTable">
<form action="BookingsServlet" method="post" onsubmit="return validateTime()">
	 <input id="userBookings" name="userBookings" hidden=true type="text" value="<%= userIdBookings %>">
	 <div class="form-group p-1">
        <label class="ps-1 pt-2 control-label" for="date">Choose Date For Booking</label>
        <input class="form-control" id="date" name="date" placeholder="MM/DD/YYY" type="date" value="<%= LocalDate.now() %>" 
       min="<%= LocalDate.now() %>" 
       max="<%= LocalDate.now().plusDays(30) %>"
       onchange="updateTimes()" />
      </div>
      <div class="form-group p-1">
      	<label class="ps-1 control-label" for="date">Choose a Time</label>
      	<div class="selectTime p-2">
      		<select class="form-select me-2" id="timeFrom" name="timeFrom">
    		</select>
    		<label for="time-to">To:</label>
    		<select class="form-select ms-2" id="timeTo" name="timeTo">
    		</select>
    	</div>
      </div>
      <div class="form-group p-1">
      	<label class="ps-1 control-label" for="date">No. of Persons</label>
      	<input type="text" class="form-control" id="persons" name="persons">
      </div>
      <div class="form-group p-1">
	    <label class="ps-1 control-label" for="date">Details</label>
  		<textarea class="form-control" name="details" id="details"></textarea>
	  </div>
	  <div class="form-group p-1">
	    <label class="ps-1 control-label" for="date">Personal Information</label>
  		<div class="mb-3">
   		 <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter Your Name" name="name">
 		</div>
 		<div class="mb-3">
   		 <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter Your Number" name="number">
 		</div>
  		<div class="mb-3">
   		 <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" placeholder="Enter Your Email">
   		 <div id="emailHelp" class="form-text ps-2">We'll never share your email with anyone else.</div>
	    </div>
 	  </div>
 	  <div class="d-grid gap-2">
 	  	<button type="submit" class="btn btn-success m-2 " name="table" value="bookTable">Book Table</button>
 	  </div>
</form>
</div>