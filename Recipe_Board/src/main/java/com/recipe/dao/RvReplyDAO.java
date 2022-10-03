package com.recipe.dao;

import java.util.List;

import com.recipe.domain.RvReplyVO;

public interface RvReplyDAO {
	
	//요리후기 댓글 조회
	public List<RvReplyVO> rvReplyList(int rv_no) throws Exception;
	
	//요리후기 댓글 작성
	public void rvReplyWrite(RvReplyVO vo) throws Exception;
	
	//요리후기 댓글 1개 조회
	public RvReplyVO rvReplyView(int rva_no) throws Exception;
	
	//요리후기 댓글 수정
	public void rvReplyModify(RvReplyVO vo) throws Exception;
	
	//요리후기 댓글 삭제
	public void rvReplyDelete(int rva_no) throws Exception;
	
	
}
