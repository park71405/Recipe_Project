package com.recipe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.ReviewBoardDAO;
import com.recipe.domain.ReviewBoardVO;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Inject
	private ReviewBoardDAO dao;
	
	//리뷰 총 개수
	@Override
	public int reviewCount() throws Exception{
		return dao.reviewCount();
	}
	
	//리뷰 목록
	@Override
	public List<ReviewBoardVO> reviewList(int reviewDisplayPost, int reviewPostNum, String reviewSearchType, String rv_keyword) throws Exception {
	
		return dao.reviewList(reviewDisplayPost, reviewPostNum, reviewSearchType, rv_keyword);
	}

	//리뷰 작성
	@Override
	public void reviewWrite(ReviewBoardVO vo) throws Exception {
		
		dao.reviewWrite(vo);
	}

	//리뷰 조회
	@Override
	public ReviewBoardVO reviewView(int rv_no) throws Exception {
		
		return dao.reviewView(rv_no);
	}

	//리뷰 수정
	@Override
	public void reviewModify(ReviewBoardVO vo) throws Exception {
		
		dao.reviewModify(vo);
	}

	//리뷰 삭제
	@Override
	public void reviewDelete(int rv_no) throws Exception {
		dao.reviewDelete(rv_no);
		
	}

}
