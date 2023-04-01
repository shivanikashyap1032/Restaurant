package com.restaurant.entity;

import java.util.List;

public class Category {

	private int cId;
	private String cName;
	private String cImg;
	private List<SubCategory> allDishes;
	
	public Category() 
	{
		
	}
	public Category(String cName, String cImg) 
	{
		this.cName = cName;
		this.cImg = cImg;
	}
	
	public int getcId() 
	{
		return cId;
	}
	
	public void setcId(int cId) 
	{
		this.cId = cId;
	}
	
	public String getcName() 
	{
		return cName;
	}
	
	public void setcName(String cName) 
	{
		this.cName = cName;
	}
	public String getcImg()
	{
		return cImg;
	}
	
	public void setcImg(String cImg)
	{
		this.cImg = cImg;
	}
	
	public List<SubCategory> getAllDishes() 
	{
		return allDishes;
	}
	
	public void setAllDishes(List<SubCategory> allDishes) 
	{
		this.allDishes = allDishes;
	}
}
