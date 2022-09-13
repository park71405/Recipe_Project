package com.recipe.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.ReviewBoardVO;

@Repository
public class ReviewBoardDAOImpl implements ReviewBoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.recipe.mappers.reviewBoard";
	
	//게시물 총 개수
	@Override
	public int reviewCount() throws Exception {
		
		return sql.selectOne(namespace + ".reviewCount");
	}
	
	//리뷰 목록
	@Override
	public List<ReviewBoardVO> reviewList(int reviewDisplayPost, int reviewPostNum, String reviewSearchType, String rv_keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("reviewDisplayPost", reviewDisplayPost);
		data.put("reviewPostNum", reviewPostNum);
		
		data.put("reviewSearchType", reviewSearchType);
		data.put("rv_keyword", rv_keyword);
		
		return sql.selectList(namespace + ".reviewList", data);
	}

	//리뷰 작성
	@Override
	public void reviewWrite(ReviewBoardVO vo) throws Exception {
		
		sql.insert(namespace + ".reviewWrite", vo);
	}

	//리뷰 조회
	@Override
	public ReviewBoardVO reviewView(int rv_no) throws Exception {
		
		return sql.selectOne(namespace + ".reviewView", rv_no);
	}

	//리뷰 수정
	@Override
	public void reviewModify(ReviewBoardVO vo) throws Exception {
		sql.update(namespace + ".reviewModify", vo);
	}
	
	//리뷰 삭제
	public void reviewDelete(int rv_no) throws Exception{
		sql.delete(namespace + ".reviewDelete", rv_no);
	}

}
