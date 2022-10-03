package com.recipe.service;

import java.util.List;

import com.recipe.domain.QaReplyVO;

public interface QaReplyService {

	//요리후기 댓글 조회
	public List<QaReplyVO> qaReplyList(int qa_no) throws Exception;
		
	//요리후기 댓글 작성
	public void qaReplyWrite(QaReplyVO vo) throws Exception;
	
	//요리후기 댓글 1개 조회
	public QaReplyVO qaReplyView(int qaa_no) throws Exception;
	
	//요리후기 댓글 수정
	public void qaReplyModify(QaReplyVO vo) throws Exception;
		
	//요리후기 댓글 삭제
	public void qaReplyDelete(int qaa_no) throws Exception;
		
	
}
