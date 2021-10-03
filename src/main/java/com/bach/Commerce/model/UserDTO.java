package com.bach.Commerce.model;

import javax.persistence.Transient;

public class UserDTO {
	private int id;
	private String name;
	private String password;
	private String username;
	private String role;
	private String phone;
	private String city;
	private String address;
	private String state;
	private int country_id;
	private String postal_code;
	private String avatar;

	public UserDTO(int id, String name, String username, String password, String mail, String role, String phone, String city, String address, String state, int country_id, String avatar,
			String postal_code) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.username = username;
		this.role = role;
		this.phone = phone;
		this.city = city;
		this.address = address;
		this.state = state;
		this.country_id = country_id;
		this.postal_code = postal_code;
		this.avatar = avatar;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getCountry_id() {
		return country_id;
	}

	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}

	public String getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}

	public UserDTO() {

	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	@Transient
	public String getAvatarImagePath() {
		if (avatar == null) return null;
		
		return "/avatar-images/" + id + "/" + avatar;
	}
}
