package com.entities;

import java.util.Date;

public class DBclass {
	
	private String notename; 
	private String startdate;
	private String enddate; 
	private String remainderdate; 
	private String status; 
	private String tag;
	private String description; 
	private String email;
	
	
	public DBclass() {
		super();
	}
	public DBclass(String notename, String startdate, String enddate, String remainderdate, String status, String tag,
			String description, String email) {
		super();
		this.notename = notename;
		this.startdate = startdate;
		this.enddate = enddate;
		this.remainderdate = remainderdate;
		this.status = status;
		this.tag = tag;
		this.description = description;
		this.email = email;
	}
	@Override
	public String toString() {
		return "DBclass [notename=" + notename + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", remainderdate=" + remainderdate + ", status=" + status + ", tag=" + tag + ", description="
				+ description + ", email=" + email + "]";
	}
	public String getNotename() {
		return notename;
	}
	public void setNotename(String notename) {
		this.notename = notename;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getRemainderdate() {
		return remainderdate;
	}
	public void setRemainderdate(String remainderdate) {
		this.remainderdate = remainderdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
