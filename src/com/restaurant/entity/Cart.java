package com.restaurant.entity;

public class Cart {

	private int cartId;
	private int uId;
	private int scId;
	private SubCategory subCategory;
	
	public Cart() 
	{
		
	}
	
	public Cart(int cartId, int uId, int scId, SubCategory subCategory) 
	{
		this.cartId = cartId;
		this.uId = uId;
		this.scId = scId;
		this.subCategory = subCategory;
	}

	public int getCartId() 
	{
		return cartId;
	}
	
	public void setCartId(int cartId) 
	{
		this.cartId = cartId;
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

	public SubCategory getSubCategory() 
	{
		return subCategory;
	}

	public void setSubCategory(SubCategory subCategory)
	{
		this.subCategory = subCategory;
	}
}
