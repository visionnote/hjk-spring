package com.example.myapp.dto;

import java.io.Serializable;

public class Product implements Serializable{
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String productId; //상품 아이디
	private String pname;	  //상품명 
	private Integer unitPrice; //상품 가격
	private String description; //상품 설명 
	private String manufacture; //제조사
	private String category;    //분류
	private long unitsInStock;//재고 수
	private String condition;
	
	public Product() {
		super();
	}
	
	public Product(String productId, String name, Integer unitPrice) { 
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacture() {
		return manufacture;
	}

	public void setManufacture(String manufacture) {
		this.manufacture = manufacture;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
