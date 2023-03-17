package com.recipe.domain;

import java.util.Date;

public class ReviewBoardVO {

	/*
	 CREATE TABLE REVIEW(
		RV_NO INT NOT NULL auto_increment,
    	RV_TITLE VARCHAR(45),
    	RV_CONTENT TEXT,
    	RV_DATE DATE,
    	RV_WARNING boolean,
    	rv_img VARCHAR(100),
    	USER_NO INT,
    	primary key (RV_NO),
    	foreign key(USER_NO) REFERENCES USER (USER_NO)
	 );
	 */
	private int rv_no;
	private String rv_title;
	private String rv_content;
	private Date rv_date;
	private int rv_warning;
	private String user_name;
	private String rv_img;
	
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getRv_title() {
		return rv_title;
	}
	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	public int getRv_warning() {
		return rv_warning;
	}
	public void setRv_warning(int rv_warning) {
		this.rv_warning = rv_warning;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getRv_img() {
		return rv_img;
	}
	public void setRv_img(String rv_img) {
		this.rv_img = rv_img;
	}
	
	
}
