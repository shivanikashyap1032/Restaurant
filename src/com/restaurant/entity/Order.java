package com.restaurant.entity;

public class Order {

	private int orderId;
	private int uId;
	private String pEmail;
	private String pNumber;
	private String orderAddress;
	private int scId;
	private String total;
	private int quantity;
	private String status;
	private SubCategory subCategory;
	
	public Order() 
	{

	}
	
	public Order(int uId, int scId, String status) 
	{
		this.uId = uId;
		this.scId = scId;
		this.status = status;
	}
	
	public int getOrderId()
	{
		return orderId;
	}
	
	public void setOrderId(int orderId)
	{
		this.orderId = orderId;
	}
	
	public int getuId()
	{
		return uId;
	}
	
	public void setuId(int uId)
	{
		this.uId = uId;
	}
	
	public int getScId() 
	{
		return scId;
	}
	
	public void setScId(int scId) 
	{
		this.scId = scId;
	}
	
	public String getStatus() 
	{
		return status;
	}
	
	public void setStatus(String status) 
	{
		this.status = status;
	}
	
	public SubCategory getSubCategory() 
	{
		return subCategory;
	}

	public void setSubCategory(SubCategory subCategory) 
	{
		this.subCategory = subCategory;
	}
	
	public String getTotal() 
	{
		return total;
	}

	public void setTotal(String total) 
	{
		this.total = total;
	}

	public int getQuantity() 
	{
		return quantity;
	}

	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}

	public String getpEmail() 
	{
		return pEmail;
	}

	public void setpEmail(String pEmail) 
	{
		this.pEmail = pEmail;
	}

	public String getpNumber() {
		return pNumber;
	}

	public void setpNumber(String pNumber) 
	{
		this.pNumber = pNumber;
	}

	public String getorderAddress() 
	{
		return orderAddress;
	}

	public void setorderAddress(String orderAdress) 
	{
		this.orderAddress = orderAdress;
	}
}
