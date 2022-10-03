package com.recipe.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.QaReplyVO;

@Repository
public class QaReplyDAOImpl implements QaReplyDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.recipe.mappers.qaReply";
	
	//QA 댓글 조회
	@Override
	public List<QaReplyVO> qaReplyList(int qa_no) throws Exception {
		return sql.selectList(namespace + ".qaReplyList", qa_no);
	}

	//qa 댓글 작성
	@Override
	public void qaReplyWrite(QaReplyVO vo) throws Exception {
		sql.insert(namespace + ".qaReplyWrite", vo);
	}
	
	//qa 댓글 1개 조회
	@Override
	public QaReplyVO qaReplyView(int qaa_no) throws Exception {
		return sql.selectOne(namespace + ".qaReplyView", qaa_no);
	}

	//qa 댓글 수정
	@Override
	public void qaReplyModify(QaReplyVO vo) throws Exception {
		sql.update(namespace + ".qaReplyModify", vo);
	}
	
	//qa 댓글 삭제
	@Override
	public void qaReplyDelete(int qaa_no) throws Exception {
		sql.delete(namespace + ".qaReplyDelete", qaa_no);
	}
	
}
