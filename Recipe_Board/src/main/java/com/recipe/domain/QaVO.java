package com.recipe.domain;

import java.util.Date;

public class QaVO {

	/*
	 CREATE TABLE QA(
		QA_NO INT,
    	QA_TITLE VARCHAR(45),
    	QA_CONTENT TEXT,
    	QA_DATA timestamp not null default now(),
    	QA_WARNING boolean default 0,
    	qaimg VARCHAR(100),
    	USER_NAME VARCHAR(45) not null,
    	PRIMARY KEY(QA_NO),
    	FOREIGN KEY(USER_NAME) references USER (USER_NAME)
	);
	 */
	
	private int qa_no;
	private String qa_title;
	private String qa_content;
	private Date qa_date;
	private int qa_warning;
	private String user_name;
	private String qaImg;
	
	public int getQa_no() {
		return qa_no;
	}
	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	public Date getQa_date() {
		return qa_date;
	}
	public void setQa_date(Date qa_date) {
		this.qa_date = qa_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getQaImg() {
		return qaImg;
	}
	public void setQaImg(String qaImg) {
		this.qaImg = qaImg;
	}
	public int getQa_warning() {
		return qa_warning;
	}
	public void setQa_warning(int qa_warning) {
		this.qa_warning = qa_warning;
	}
	
}
