package com.recipe.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.RvReplyVO;

@Repository
public class RvReplyDAOImpl implements RvReplyDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.recipe.mappers.rvReply";
	
	//요리 후기 댓글 조회
	@Override
	public List<RvReplyVO> rvReplyList(int rv_no) throws Exception {
		return sql.selectList(namespace + ".rvReplyList", rv_no);
	}

	//요리 후기 댓글 작성
	@Override
	public void rvReplyWrite(RvReplyVO vo) throws Exception {
		sql.insert(namespace + ".rvReplyWrite", vo);
	}
	
	//요리 후기 댓글 1개 조회
	@Override
	public RvReplyVO rvReplyView(int rva_no) throws Exception {
		return sql.selectOne(namespace + ".rvReplyView", rva_no);
	}

	//요리 후기 댓글 수정
	@Override
	public void rvReplyModify(RvReplyVO vo) throws Exception {
		sql.update(namespace + ".rvReplyModify", vo);
	}
	
	//요리 후기 댓글 삭제
	@Override
	public void rvReplyDelete(int rva_no) throws Exception {
		sql.delete(namespace + ".rvReplyDelete", rva_no);
	}

}
