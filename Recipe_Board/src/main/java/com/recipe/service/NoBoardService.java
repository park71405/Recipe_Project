package com.recipe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recipe.domain.NoBoardVO;

@Service
public interface NoBoardService {
	
	//notice 총 개수
	public int noCount() throws Exception;
	
	//notice 목록
	public List<NoBoardVO> noList(int noDisplayPost, int noPostNum, String noSearchType, String no_keyword) throws Exception;
	
	//notice 작성
	public void noWrite(NoBoardVO vo) throws Exception;
	
	//notice 조회
	public NoBoardVO noView(int no_no) throws Exception;
		
}
