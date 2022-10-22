package com.recipe.domain;

import java.util.Date;

public class NoBoardVO {

	/*
	 CREATE TABLE NOTICE(
		NO_NO INT,
    	NO_TITLE VARCHAR(45),
    	NO_CONTENT TEXT,
    	NO_DATE timestamp not null default now(),
    	MANA_NAME varchar(50),
    	PRIMARY KEY(NO_NO),
    	foreign key (MANA_NAME) references MANAGER (MANA_NAME)	
	); 
	 */
	
	private int no_no;
	private String no_title;
	private String no_content;
	private Date no_date;
	private String mana_name;
	
	public int getNo_no() {
		return no_no;
	}
	public void setNo_no(int no_no) {
		this.no_no = no_no;
	}
	public String getNo_title() {
		return no_title;
	}
	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public Date getNo_date() {
		return no_date;
	}
	public void setNo_date(Date no_date) {
		this.no_date = no_date;
	}
	public String getMana_name() {
		return mana_name;
	}
	public void setMana_name(String mana_name) {
		this.mana_name = mana_name;
	}
	
	
}
