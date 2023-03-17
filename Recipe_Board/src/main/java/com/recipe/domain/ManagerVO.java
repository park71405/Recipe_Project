package com.recipe.domain;

public class ManagerVO {
/*
 CREATE table MANAGER(
	MANA_NO INT not null auto_increment,
	MANA_NAME varchar(50) not null unique,
    MANA_ID VARCHAR(45) not null unique,
    NAMA_PW VARCHAR(45),
    PRIMARY KEY(MANA_NO)
);
 * 
 */
	private int mana_no;
	private String mana_name;
	private String mana_id;
	private String mana_pw;
	public int getMana_no() {
		return mana_no;
	}
	public void setMana_no(int mana_no) {
		this.mana_no = mana_no;
	}
	public String getMana_name() {
		return mana_name;
	}
	public void setMana_name(String mana_name) {
		this.mana_name = mana_name;
	}
	public String getMana_id() {
		return mana_id;
	}
	public void setMana_id(String mana_id) {
		this.mana_id = mana_id;
	}
	public String getMana_pw() {
		return mana_pw;
	}
	public void setMana_pw(String mana_pw) {
		this.mana_pw = mana_pw;
	}
	
	
	
}
