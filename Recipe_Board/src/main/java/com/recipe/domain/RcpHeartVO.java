package com.recipe.domain;

public class RcpHeartVO {

	/*
	 #찜 목록
	create table rcp_heart(
		RCP_H_no int auto_increment,
		RCP_SEQ int NOT NULL,
    	USER_NAME VARCHAR(45) not null,
    	primary key (rcp_h_no),
		foreign key(RCP_SEQ) REFERENCES recipe (RCP_SEQ) on update cascade,
    	foreign key (USER_NAME) references USER (USER_NAME) on update cascade
	);
	 */
	
	private int rcp_h_no;
	private int rcp_seq;
	private String user_name;
	
	public int getRcp_h_no() {
		return rcp_h_no;
	}
	public void setRcp_h_no(int rcp_h_no) {
		this.rcp_h_no = rcp_h_no;
	}
	public int getRcp_seq() {
		return rcp_seq;
	}
	public void setRcp_seq(int rcp_seq) {
		this.rcp_seq = rcp_seq;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
}
