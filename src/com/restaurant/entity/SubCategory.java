package com.restaurant.entity;

public class SubCategory {

	private int cId;
	private int sCId;
	private String sName;
	private String price;
	private String details;
	public SubCategory() 
	{
		
	}
	public SubCategory(int cId, String sName, String price, String details)
	{
		this.cId = cId;
		this.sName = sName;
		this.price = price;
		this.details = details;
	}
	public int getcId() 
	{
		return cId;
	}
	
	public void setcId(int cId) 
	{
		this.cId = cId;
	}
	
	public int getsCId() 
	{
		return sCId;
	}
	
	public void setsCId(int sCId)
	{
		this.sCId = sCId;
	}
	
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) 
	{
		this.sName = sName;
	}
	
	public String getPrice() 
	{
		return price;
	}
	
	public void setPrice(String price)
	{
		this.price = price;
	}
	
	public String getDetails() 
	{
		return details;
	}
	
	public void setDetails(String details) 
	{
		this.details = details;
	}
}
