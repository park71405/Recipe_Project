package com.recipe.domain;

import java.util.Date;

public class RvReplyVO {

	/*
	 CREATE TABLE REVIEW_ANSWER(
		RVA_NO INT not null auto_increment,
    	RVA_CONTENT TEXT,
    	RVA_DATE timestamp not null default now(),
    	RV_NO INT,
    	USER_NAME VARCHAR(45) not null,
    	PRIMARY KEY(RVA_NO),
    	foreign key(RV_NO) REFERENCES REVIEW (RV_NO),
    	FOREIGN KEY(USER_NAME) references USER (USER_NAME)
	);
	 */
	
	private int rva_no;
	private String rva_content;
	private Date rva_date;
	private int rv_no;
	private String user_name;
	
	public int getRva_no() {
		return rva_no;
	}
	public void setRva_no(int rva_no) {
		this.rva_no = rva_no;
	}
	public String getRva_content() {
		return rva_content;
	}
	public void setRva_content(String rva_content) {
		this.rva_content = rva_content;
	}
	public Date getRva_date() {
		return rva_date;
	}
	public void setRva_date(Date rva_date) {
		this.rva_date = rva_date;
	}
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
	
}
