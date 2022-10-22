package com.recipe.domain;

public class RefriVO {

	/*
	 CREATE TABLE REFRI(
		INGRE_NO INT,
    	INGRE_NAME VARCHAR(100),
    	INGRE_TYPE VARCHAR(45),
    	INGRE_CAPACITY VARCHAR(100),
		USER_NAME VARCHAR(45) unique not null,
    	primary key (INGRE_NO),
    	foreign key (USER_NAME) references USER (USER_NAME)
	);
	 */
	
	private int ingre_no;
	private String ingre_name;
	private String ingre_type;
	private String ingre_capacity;
	private String user_name;
	
	public int getIngre_no() {
		return ingre_no;
	}
	public void setIngre_no(int ingre_no) {
		this.ingre_no = ingre_no;
	}
	public String getIngre_name() {
		return ingre_name;
	}
	public void setIngre_name(String ingre_name) {
		this.ingre_name = ingre_name;
	}
	public String getIngre_type() {
		return ingre_type;
	}
	public void setIngre_type(String ingre_type) {
		this.ingre_type = ingre_type;
	}
	public String getIngre_capacity() {
		return ingre_capacity;
	}
	public void setIngre_capacity(String ingre_capacity) {
		this.ingre_capacity = ingre_capacity;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
	
}
