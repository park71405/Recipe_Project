package com.recipe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recipe.domain.ReviewBoardVO;

@Service
public interface ReviewBoardService {

	//리뷰 총 개수
	public int reviewCount() throws Exception;
	
	//리뷰 목록
	public List<ReviewBoardVO> reviewList(int reviewDisplayPost, int reviewPostNum, String reviewSearchType, String rv_keyword) throws Exception;
	
	//리뷰 작성
	public void reviewWrite(ReviewBoardVO vo) throws Exception;
	
	//리뷰 조회
	public ReviewBoardVO reviewView(int rv_no) throws Exception;
	
	//리뷰 수정
	public void reviewModify(ReviewBoardVO vo) throws Exception;
	
	//리뷰 삭제
	public void reviewDelete(int rv_no) throws Exception;
	
	//리뷰 신고
	public void alert(int rv_no, int rv_warning) throws Exception;

}
