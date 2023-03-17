package com.recipe.domain;

public class RcpBoardVO {

	/*
	 create table recipe(
		RCP_SEQ int NOT NULL auto_increment, 
    	RCP_NM VARCHAR(100) NOT NULL,
    	RCP_WAY2 VARCHAR(20),
    	RCP_PAT2 VARCHAR(20),
    	INFO_ENG float,
    	ATT_FILE_NO_MAIN text,
    	ATT_FILE_NO_MK text,
    	primary key(RCP_SEQ)
	);
	 */
	
	private int rcp_seq;
	private String rcp_nm;
	private String rcp_way2;
	private String rcp_pat2;
	private float info_eng;
	private String att_file_no_main;
	private String att_file_no_mk;
	
	public int getRcp_seq() {
		return rcp_seq;
	}
	public void setRcp_seq(int rcp_seq) {
		this.rcp_seq = rcp_seq;
	}
	public String getRcp_nm() {
		return rcp_nm;
	}
	public void setRcp_nm(String rcp_nm) {
		this.rcp_nm = rcp_nm;
	}
	public String getRcp_way2() {
		return rcp_way2;
	}
	public void setRcp_way2(String rcp_way2) {
		this.rcp_way2 = rcp_way2;
	}
	public String getRcp_pat2() {
		return rcp_pat2;
	}
	public void setRcp_pat2(String rcp_pat2) {
		this.rcp_pat2 = rcp_pat2;
	}
	public float getInfo_eng() {
		return info_eng;
	}
	public void setInfo_eng(float info_eng) {
		this.info_eng = info_eng;
	}
	public String getAtt_file_no_main() {
		return att_file_no_main;
	}
	public void setAtt_file_no_main(String att_file_no_main) {
		this.att_file_no_main = att_file_no_main;
	}
	public String getAtt_file_no_mk() {
		return att_file_no_mk;
	}
	public void setAtt_file_no_mk(String att_file_no_mk) {
		this.att_file_no_mk = att_file_no_mk;
	}
	
}
