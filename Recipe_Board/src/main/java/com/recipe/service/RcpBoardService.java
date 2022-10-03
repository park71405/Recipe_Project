package com.recipe.service;

import java.util.List;

import com.recipe.domain.RcpBoardVO;

public interface RcpBoardService {
	
	//레시피 목록
	public List<RcpBoardVO> rcpList(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
	
	//레시피 조회
	public RcpBoardVO rcpView(int rcp_seq) throws Exception;
	
	//레시피 총 개수
	public int rcpCount() throws Exception;
	
}
