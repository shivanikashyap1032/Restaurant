package com.restaurant.entity;

import java.time.LocalDate;

public class Bookings {

	private int bookingId;
	private int uId;
	private LocalDate date;
	private String fromTime;
	private String toTime;
	private int persons;
	private String name;
	private String number;
	private String email;
	private String details;
	private String status;
	private User user;
	
	public Bookings() 
	{
		
	}
	
	public Bookings(int uId, LocalDate date, String fromTime, String toTime, int persons, String name,
			String number, String email, String details , String status) 
	{
		this.uId = uId;
		this.date = date;
		this.fromTime = fromTime;
		this.toTime = toTime;
		this.persons = persons;
		this.name = name;
		this.number = number;
		this.email = email;
		this.details = details;
		this.status = status;
	}
	
	public int getBookingId() 
	{
		return bookingId;
	}
	
	public void setBookingId(int bookingId)
	{
		this.bookingId = bookingId;
	}
	
	public int getuId() 
	{
		return uId;
	}
	
	public void setuId(int uId)
	{
		this.uId = uId;
	}
	
	public LocalDate getDate()
	{
		return date;
	}
	
	public void setDate(LocalDate date)
	{
		this.date = date;
	}
	
	public String getFromTime()
	{
		return fromTime;
	}
	
	public void setFromTime(String fromTime) 
	{
		this.fromTime = fromTime;
	}
	
	public String getToTime()
	{
		return toTime;
	}
	
	public void setToTime(String toTime)
	{
		this.toTime = toTime;
	}
	
	public int getPersons() 
	{
		return persons;
	}
	
	public void setPersons(int persons)
	{
		this.persons = persons;
	}
	
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	
	public void setNumber(String number) 
	{
		this.number = number;
	}
	
	public String getEmail() 
	{
		return email;
	}
	
	public void setEmail(String email) 
	{
		this.email = email;
	}
	
	public String getDetails() 
	{
		return details;
	}

	public void setDetails(String details)
	{
		this.details = details;
	}
	
	public String getStatus() 
	{
		return status;
	}

	public void setStatus(String status) 
	{
		this.status = status;
	}
	
	public User getUser() 
	{
		return user;
	}

	public void setUser(User user) 
	{
		this.user = user;
	}

}
