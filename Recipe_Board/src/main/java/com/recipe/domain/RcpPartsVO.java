package com.recipe.domain;

/*
CREATE TABLE recipe_parts8 (
    PARTS_NO BIGINT NOT NULL AUTO_INCREMENT,
    RCP_SEQ INT NOT NULL,
    RCP_PAT_NM VARCHAR(100),
    RCP_PAT_VL VARCHAR(100),
    RCP_PAT_TYPE VARCHAR(50),
    PRIMARY KEY (PARTS_NO),
    FOREIGN KEY (RCP_SEQ)
        REFERENCES recipe (RCP_SEQ)
);
 */

public class RcpPartsVO {
	private int parts_no;
	private int rcp_seq;
	private String rcp_pat_nm;
	private String rcp_pat_vl;
	private String rcp_pat_type;
	
	public int getParts_no() {
		return parts_no;
	}
	public void setParts_no(int parts_no) {
		this.parts_no = parts_no;
	}
	public int getRcp_seq() {
		return rcp_seq;
	}
	public void setRcp_seq(int rcp_seq) {
		this.rcp_seq = rcp_seq;
	}
	public String getRcp_pat_nm() {
		return rcp_pat_nm;
	}
	public void setRcp_pat_nm(String rcp_pat_nm) {
		this.rcp_pat_nm = rcp_pat_nm;
	}
	public String getRcp_pat_vl() {
		return rcp_pat_vl;
	}
	public void setRcp_pat_vl(String rcp_pat_vl) {
		this.rcp_pat_vl = rcp_pat_vl;
	}
	public String getRcp_pat_type() {
		return rcp_pat_type;
	}
	public void setRcp_pat_type(String rcp_pat_type) {
		this.rcp_pat_type = rcp_pat_type;
	}
	
	
}
