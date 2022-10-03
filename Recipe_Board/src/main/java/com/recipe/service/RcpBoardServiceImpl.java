package com.recipe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.RcpBoardDAO;
import com.recipe.domain.RcpBoardVO;

@Service
public class RcpBoardServiceImpl implements RcpBoardService {

	@Inject
	private RcpBoardDAO dao;
	
	//레시피 목록
	@Override
	public List<RcpBoardVO> rcpList(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
		
		return dao.rcpList(displayPost, postNum, rcpSearchType, rcpKeyword);
	}

	//레시피 조회
	@Override
	public RcpBoardVO rcpView(int rcp_seq) throws Exception {
		
		return dao.rcpView(rcp_seq);
	}

	//레시피 총 개수
	@Override
	public int rcpCount() throws Exception {
		
		return dao.rcpCount();
	}

}
