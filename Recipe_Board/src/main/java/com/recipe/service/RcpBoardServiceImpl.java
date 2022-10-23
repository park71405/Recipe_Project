package com.recipe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.RcpBoardDAO;
import com.recipe.domain.RcpBoardVO;
import com.recipe.domain.RcpHeartVO;
import com.recipe.domain.RcpPartsVO;
import com.recipe.domain.RcpProcessVO;

@Service
public class RcpBoardServiceImpl implements RcpBoardService {

	@Inject
	private RcpBoardDAO dao;
	
	//레시피 목록
	@Override
	public List<RcpBoardVO> rcpList(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
		
		return dao.rcpList(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
	
	//레시피 요리 종류 밥 조회
	@Override
	public List<RcpBoardVO> rcpKindType1List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
		
		return dao.rcpKindType1List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
	
	//레시피 요리 종류 후식 조회
	@Override
	public List<RcpBoardVO> rcpKindType2List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
		
		return dao.rcpKindType2List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
	
	//레시피 요리 종류 반찬 조회
	@Override
	public List<RcpBoardVO> rcpKindType3List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
		
		return dao.rcpKindType3List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
	
	//레시피 요리 종류 국&찌개 조회
	@Override
	public List<RcpBoardVO> rcpKindType4List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
		
		return dao.rcpKindType4List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
	
	//레시피 요리 종류 일품 조회
	@Override
	public List<RcpBoardVO> rcpKindType5List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
		
		return dao.rcpKindType5List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
	
	//레시피 요리 종류 기타 조회
	@Override
	public List<RcpBoardVO> rcpKindType6List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
		
		return dao.rcpKindType6List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
	
	//레시피 요리 종류 볶기 조회
	@Override
	public List<RcpBoardVO> rcpKindCookM1List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
			
		return dao.rcpKindCookM1List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
		
	//레시피 요리 종류 굽기 조회
	@Override
	public List<RcpBoardVO> rcpKindCookM2List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
			
		return dao.rcpKindCookM2List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
		
	//레시피 요리 종류 끓이기 조회
	@Override
	public List<RcpBoardVO> rcpKindCookM3List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
			
		return dao.rcpKindCookM3List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
		
	//레시피 요리 종류 찌기 조회
	@Override
	public List<RcpBoardVO> rcpKindCookM4List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
			
		return dao.rcpKindCookM4List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
		
	//레시피 요리 종류 튀기기 조회
	@Override
	public List<RcpBoardVO> rcpKindCookM5List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
			
		return dao.rcpKindCookM5List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}
		
	//레시피 요리 종류 기타 조회
	@Override
	public List<RcpBoardVO> rcpKindCookM6List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
			
		return dao.rcpKindCookM6List(displayPost, postNum, rcpSearchType, rcpKeyword);
	}

	//레시피 조회
	@Override
	public RcpBoardVO rcpView(int rcp_seq) throws Exception {
		
		return dao.rcpView(rcp_seq);
	}
	
	//레시피 과정 조회
	@Override
	public RcpProcessVO rcpProcessView(int rcp_seq) throws Exception {
		
		return dao.rcpProcessView(rcp_seq);
	}
	
	//레시피 재료 조회
	@Override
	public List<RcpPartsVO> rcpPartsView(int rcp_seq) throws Exception {
		
		return dao.rcpPartsView(rcp_seq);
	}
	
	
	//레시피 총 개수
	@Override
	public int rcpCount() throws Exception {
		
		return dao.rcpCount();
	}

	//레시피 찜하기
	@Override
	public void rcpHeart(RcpHeartVO vo) throws Exception {
		
		dao.rcpHeart(vo);
	}

	//레시피 찜 확인
	@Override
	public int isRcpHeart(RcpHeartVO vo) throws Exception {
		
		return dao.isRcpHeart(vo);
	}

	//레시피 찜 해제
	@Override
	public void rcpHeartDelete(RcpHeartVO vo) throws Exception {
		dao.rcpHeartDelete(vo);
	}

}
