package com.recipe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.QaReplyDAO;
import com.recipe.domain.QaReplyVO;

@Service
public class QaReplyServiceImpl implements QaReplyService {

	@Inject
	private QaReplyDAO dao;
	
	//QA 댓글 조회
	@Override
	public List<QaReplyVO> qaReplyList(int qa_no) throws Exception {
		
		return dao.qaReplyList(qa_no);
	}

	//QA 댓글 작성
	@Override
	public void qaReplyWrite(QaReplyVO vo) throws Exception {
		dao.qaReplyWrite(vo);
	}
	
	//QA 댓글 1개 조회
	@Override
	public QaReplyVO qaReplyView(int qaa_no) throws Exception {
		return dao.qaReplyView(qaa_no);
	}

	//QA 댓글 수정
	@Override
	public void qaReplyModify(QaReplyVO vo) throws Exception {
		dao.qaReplyModify(vo);
	}

	//QA 댓글 삭제
	@Override
	public void qaReplyDelete(int qaa_no) throws Exception {
		dao.qaReplyDelete(qaa_no);
	}

}
