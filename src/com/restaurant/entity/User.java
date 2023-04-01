package com.restaurant.entity;

public class User {

	private int uId;
	private String uName;
	private String address;
	private String phoneNo;
	private String email;
	private String password;
	private String role;
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public User() 
	{
		super();
	}
	
	public User(String uName, String address, String phoneNo, String email, String password) 
	{
		super();
		this.uName = uName;
		this.address = address;
		this.phoneNo = phoneNo;
		this.email = email;
		this.password = password;
	}
	
	public int getuId() 
	{
		return uId;
	}
	
	public void setuId(int uId) 
	{
		this.uId = uId;
	}
	
	public String getuName() 
	{
		return uName;
	}
	
	public void setuName(String uName)
	{
		this.uName = uName;
	}
	
	public String getAddress() 
	{
		return address;
	}
	
	public void setAddress(String address) 
	{
		this.address = address;
	}
	
	public String getPhoneNo() 
	{
		return phoneNo;
	}
	
	public void setPhoneNo(String phoneNo) 
	{
		this.phoneNo = phoneNo;
	}
	
	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}
	
	public String getPassword()
	{
		return password;
	}
	
	public void setPassword(String password)
	{
		this.password = password;
	}
}
