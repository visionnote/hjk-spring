package com.example.myapp.dto;

import java.io.Serializable;

public class Product implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;

	private String productId; // 상품 아이디
	private String productName; // 상품명
	private long unitPrice; // 상품 가격
	private String description; // 상품 설명
	private String manufacturer; // 제조사 (의미 수정)
	private String category; // 분류
	private int unitsInStock; // 재고 수
	private String condition; // 신상품 or 중고품 or 재생품
	private String filename; //원본 이미지 파일명 
	private String thumbnail; //썸네일 파일명 
	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Product() {
		super();
	}

	public Product(String productId, String productName, Integer unitPrice) {
		this.productId = productId;
		this.productName = productName;
		this.unitPrice = unitPrice;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public long getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(long unitPrice2) {
		this.unitPrice = unitPrice2;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(Integer unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
}