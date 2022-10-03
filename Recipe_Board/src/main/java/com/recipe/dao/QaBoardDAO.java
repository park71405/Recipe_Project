package com.recipe.dao;

import java.util.List;

import com.recipe.domain.QaVO;

public interface QaBoardDAO {
	
	//QA 총 개수
	public int qaCount() throws Exception; 
	
	//QA 목록
	public List<QaVO> qaList(int displayPost, int postNum, String qa_searchType, String qa_keyword) throws Exception;
	
	//QA 작성
	public void qaWrite(QaVO vo) throws Exception;
	
	//QA 조회
	public QaVO qaView(int qa_no) throws Exception;
	
	//QA 수정
	public void qaModify(QaVO vo) throws Exception;
	
	//QA 삭제
	public void qaDelete(int qa_no) throws Exception;
	
}
