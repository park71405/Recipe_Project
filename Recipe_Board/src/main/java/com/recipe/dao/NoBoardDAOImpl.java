package com.recipe.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.NoBoardVO;

@Repository
public class NoBoardDAOImpl implements NoBoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.recipe.mappers.noBoard";
	
	//공지 총 개수
	@Override
	public int noCount() throws Exception {
		
		return sql.selectOne(namespace + ".noCount");
	
	}

	//공지 목록
	@Override
	public List<NoBoardVO> noList(int noDisplayPost, int noPostNum, String noSearchType, String no_keyword)
			throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("noDisplayPost", noDisplayPost);
		data.put("noPostNum", noPostNum);
		
		data.put("noSearchType", noSearchType);
		data.put("no_keyword", no_keyword);
		
		return sql.selectList(namespace + ".noList", data);
	}

	//notice 작성
	@Override
	public void noWrite(NoBoardVO vo) throws Exception {
		
		sql.insert(namespace + ".noWrite", vo);
	}

	//notice 작성
	@Override
	public NoBoardVO noView(int no_no) throws Exception {
		
		return sql.selectOne(namespace + ".noView", no_no);
	}

	//notice delete 
	@Override
	public void noDelete(int no_no) throws Exception {
		
		sql.delete(namespace + ".noDelete", no_no);
	}

	//notice modify
	@Override
	public void noModify(NoBoardVO vo) throws Exception {
		
		sql.update(namespace + ".noModify", vo);
	}
	
	

}
