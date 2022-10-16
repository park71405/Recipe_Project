package com.recipe.service;

import java.util.List;

import com.recipe.domain.RcpBoardVO;

public interface RcpBoardService {
	
	//레시피 목록
	public List<RcpBoardVO> rcpList(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
	
	//레시피 요리 종류 밥 조회
	public List<RcpBoardVO> rcpKindType1List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
	
	//레시피 요리 종류 후식 조회
	public List<RcpBoardVO> rcpKindType2List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
	
	//레시피 요리 종류 반찬 조회
	public List<RcpBoardVO> rcpKindType3List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
	
	//레시피 요리 종류 국 조회
	public List<RcpBoardVO> rcpKindType4List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
	
	//레시피 요리 종류 일품 조회
	public List<RcpBoardVO> rcpKindType5List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
	
	//레시피 요리 종류 기타 조회
	public List<RcpBoardVO> rcpKindType6List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
	
	
	//레시피 요리 종류 볶기 조회
	public List<RcpBoardVO> rcpKindCookM1List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
		
	//레시피 요리 종류 굽기 조회
	public List<RcpBoardVO> rcpKindCookM2List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
		
	//레시피 요리 종류 끓이기 조회
	public List<RcpBoardVO> rcpKindCookM3List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
		
	//레시피 요리 종류 찌기 조회
	public List<RcpBoardVO> rcpKindCookM4List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
		
	//레시피 요리 종류 튀기기 조회
	public List<RcpBoardVO> rcpKindCookM5List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
		
	//레시피 요리 종류 기타 조회
	public List<RcpBoardVO> rcpKindCookM6List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception;
		
	
	//레시피 조회
	public RcpBoardVO rcpView(int rcp_seq) throws Exception;
	
	//레시피 총 개수
	public int rcpCount() throws Exception;
	
}
