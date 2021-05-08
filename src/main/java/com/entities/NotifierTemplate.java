package com.entities;

public class NotifierTemplate {
	private String notes; 
	private String email; 
	private String remainderdate;
	
	public NotifierTemplate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NotifierTemplate(String notes, String email, String remainderdate) {
		super();
		this.notes = notes;
		this.email = email;
		this.remainderdate = remainderdate;
	}

	@Override
	public String toString() {
		return "NotifierTemplate [notes=" + notes + ", email=" + email + ", remainderdate=" + remainderdate + "]";
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRemainderdate() {
		return remainderdate;
	}
	public void setRemainderdate(String remainderdate) {
		this.remainderdate = remainderdate;
	}
	
	
}
