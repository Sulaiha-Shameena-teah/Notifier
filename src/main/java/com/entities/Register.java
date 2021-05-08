package com.entities;

public class Register {
	private String username; 
	private String phnumber; 
	private String email; 
	private String password;
	
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Register(String username, String phnumber, String email, String password) {
		super();
		this.username = username;
		this.phnumber = phnumber;
		this.email = email;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhnumber() {
		return phnumber;
	}
	public void setPhnumber(String phnumber) {
		this.phnumber = phnumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	} 
}


