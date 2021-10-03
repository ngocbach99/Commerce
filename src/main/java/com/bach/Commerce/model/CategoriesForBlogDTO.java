package com.bach.Commerce.model;

public class CategoriesForBlogDTO {

	private int id;
	
	private String type;	

	public CategoriesForBlogDTO() {
	}

	public CategoriesForBlogDTO(int id, String type) {
		this.id = id;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
