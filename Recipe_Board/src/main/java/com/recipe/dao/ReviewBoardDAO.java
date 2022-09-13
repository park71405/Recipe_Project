package com.recipe.dao;

import java.util.List;

import com.recipe.domain.ReviewBoardVO;

public interface ReviewBoardDAO {
	
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
	
}
