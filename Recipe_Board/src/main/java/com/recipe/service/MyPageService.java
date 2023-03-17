package com.recipe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recipe.domain.MemberVO;
import com.recipe.domain.RcpBoardVO;
import com.recipe.domain.ReviewBoardVO;

@Service
public interface MyPageService {

	//회원정보 수정
	public void userInfoModify(MemberVO vo) throws Exception;
	
	//회원 탈퇴
	public void userInfoDelete(String user_id) throws Exception;
	
	//찜 목록 확인
	public List<RcpBoardVO> rcpHeartList(int displayPost, int postNum, String rcpSearchType, String rcpKeyword, String user_name) throws Exception; 

	//찜 목록 총 개수
	public int rcpHeartCount(String user_name) throws Exception;
	
	//내 요리 후기 총 개수
	public int myReviewCount(String usr_name) throws Exception;
	
	//내 요리 후기 목록
	public List<ReviewBoardVO> myReviewList(int reviewDisplayPost, int reviewPostNum, String reviewSearchType, String rv_keyword, String user_name) throws Exception;
	
}
