package com.recipe.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.QaVO;

@Repository
public class QaBoardDAOImpl implements QaBoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.recipe.mappers.qaBoard";
	
	//QA 총 개수
	@Override
	public int qaCount() throws Exception {
		
		return sql.selectOne(namespace + ".qaCount");
	}
	
	//QA 목록
	@Override
	public List<QaVO> qaList(int displayPost, int postNum, String qa_searchType, String qa_keyword) throws Exception {
		
		HashMap<String ,Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("qa_searchType", qa_searchType);
		data.put("qa_keyword", qa_keyword);
		
		return sql.selectList(namespace + ".qaList", data);
	}

	//QA 작성
	@Override
	public void qaWrite(QaVO vo) throws Exception {
		sql.insert(namespace + ".qaWrite", vo);
	}

	//QA 조회
	public QaVO qaView(int qa_no) throws Exception {
		
		return sql.selectOne(namespace + ".qaView", qa_no);
	}

	//QA 수정
	@Override
	public void qaModify(QaVO vo) throws Exception {
		sql.update(namespace + ".qaModify", vo);
	}

	//QA 삭제
	@Override
	public void qaDelete(int qa_no) throws Exception {
		sql.delete(namespace + ".qaDelete", qa_no);
	}

}
