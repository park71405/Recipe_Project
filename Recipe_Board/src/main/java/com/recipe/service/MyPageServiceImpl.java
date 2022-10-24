package com.recipe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.MyPageDAO;
import com.recipe.domain.MemberVO;
import com.recipe.domain.RcpBoardVO;
import com.recipe.domain.ReviewBoardVO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	private MyPageDAO dao;

	//회원정보 수정
	@Override
	public void userInfoModify(MemberVO vo) throws Exception {
		
		dao.userInfoModify(vo);
	}

	//회원 탈퇴
	@Override
	public void userInfoDelete(String user_id) throws Exception {
		
		dao.userInfoDelete(user_id);
	}

	//찜한 목록 확인
	@Override
	public List<RcpBoardVO> rcpHeartList(int displayPost, int postNum, String rcpSearchType, String rcpKeyword,
			String user_name) throws Exception {
		
		return dao.rcpHeartList(displayPost, postNum, rcpSearchType, rcpKeyword, user_name);
	}

	//찜한 목록 총 개수
	@Override
	public int rcpHeartCount(String user_name) throws Exception {
		return dao.rcpHeartCount(user_name);
	}

	//내 요리후기 총 개수
	@Override
	public int myReviewCount(String user_name) throws Exception {
		return dao.myReviewCount(user_name);
	}
	
	//내 요리후기 목록
	@Override
	public List<ReviewBoardVO> myReviewList(int reviewDisplayPost, int reviewPostNum, String reviewSearchType,
			String rv_keyword, String user_name) throws Exception {
		return dao.myReviewList(reviewDisplayPost, reviewPostNum, reviewSearchType, rv_keyword, user_name);
	}
	

}
