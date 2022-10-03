package com.recipe.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.RcpBoardVO;

@Repository
public class RcpBoardDAOImpl implements RcpBoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.recipe.mappers.rcpBoard";
	
	//레시피 목록
	@Override
	public List<RcpBoardVO> rcpList(int displayPost, int postNum, String rcpSearchType, String rcpKeyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);
		
		return sql.selectList(namespace + ".rcpList", data);
	}

	//레시피 조회
	@Override
	public RcpBoardVO rcpView(int rcp_seq) throws Exception {
		
		return sql.selectOne(namespace + ".rcpView", rcp_seq);
	}

	//레시피 총 개수
	@Override
	public int rcpCount() throws Exception {
		
		return sql.selectOne(namespace + ".rcpCount");
	}
	
	

}
