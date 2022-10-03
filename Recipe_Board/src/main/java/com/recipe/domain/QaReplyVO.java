package com.recipe.domain;

import java.util.Date;

public class QaReplyVO {

	/*
	 create TABLE QA_ANSWER(
		QAA_NO INT not null auto_increment,
    	QAA_CONTENT TEXT,
    	QAA_DATE timestamp not null default now(),
    	QA_NO INT,
    	USER_NAME VARCHAR(45) not null,
    	PRIMARY KEY(QAA_NO),
    	foreign key(QA_NO) references QA (QA_NO),
    	foreign key(USER_NAME) references USER (USER_NAME)
	);
	 */
	
	private int qaa_no;
	private String qaa_content;
	private Date qaa_date;
	private int qa_no;
	private String user_name;
	
	public int getQaa_no() {
		return qaa_no;
	}
	public void setQaa_no(int qaa_no) {
		this.qaa_no = qaa_no;
	}
	public String getQaa_content() {
		return qaa_content;
	}
	public void setQaa_content(String qaa_content) {
		this.qaa_content = qaa_content;
	}
	public Date getQaa_date() {
		return qaa_date;
	}
	public void setQaa_date(Date qaa_date) {
		this.qaa_date = qaa_date;
	}
	public int getQa_no() {
		return qa_no;
	}
	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
}
