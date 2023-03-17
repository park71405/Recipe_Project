package com.recipe.dao;

import java.util.List;

import com.recipe.domain.NoBoardVO;

public interface NoBoardDAO {


	//notice 총 개수
	public int noCount() throws Exception;
	
	//notice 목록
	public List<NoBoardVO> noList(int noDisplayPost, int noPostNum, String noSearchType, String no_keyword) throws Exception;
	
	//notice 작성
	public void noWrite(NoBoardVO vo) throws Exception;
		
	//notice 조회
	public NoBoardVO noView(int no_no) throws Exception;

	//notice 삭제
	public void noDelete(int no_no) throws Exception;
	
	//notice 수정
	public void noModify(NoBoardVO vo) throws Exception;
	
}
