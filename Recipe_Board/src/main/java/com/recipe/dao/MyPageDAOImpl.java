package com.recipe.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.MemberVO;
import com.recipe.domain.RcpBoardVO;
import com.recipe.domain.ReviewBoardVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.recipe.mappers.myPage";

	//회원 정보 수정
	@Override
	public void userInfoModify(MemberVO vo) throws Exception {
		
		sql.update(namespace + ".userInfoModify", vo);
		
	}

	//회원 탈퇴
	@Override
	public void userInfoDelete(String user_id) throws Exception {
		
		sql.delete(namespace + ".userInfoDelete", user_id);
	}

	//찜한 목록 확인
	@Override
	public List<RcpBoardVO> rcpHeartList(int displayPost, int postNum, String rcpSearchType, String rcpKeyword, String user_name) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);
		
		data.put("user_name", user_name);
		
		
		return sql.selectList(namespace + ".rcpHeartList", data);
	}
	
	//찜한 목록 총 개수
	@Override
	public int rcpHeartCount(String user_name) {
		
		return sql.selectOne(namespace + ".rcpHeartCount", user_name);
	}

	//내 요리 후기 총 개수
	@Override
	public int myReviewCount(String user_name) throws Exception {
		return sql.selectOne(namespace + ".myReviewCount", user_name);
	}

	//내 요리 후기 목록
	@Override
	public List<ReviewBoardVO> myReviewList(int reviewDisplayPost, int reviewPostNum, String reviewSearchType,
			String rv_keyword, String user_name) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("reviewDisplayPost", reviewDisplayPost);
		data.put("reviewPostNum", reviewPostNum);
		
		data.put("reviewSearchType", reviewSearchType);
		data.put("rv_keyword", rv_keyword);
		
		data.put("user_name", user_name);
		
		return sql.selectList(namespace + ".myReviewList", data);
	}


}
