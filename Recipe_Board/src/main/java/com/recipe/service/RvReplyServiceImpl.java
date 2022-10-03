package com.recipe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.RvReplyDAO;
import com.recipe.domain.RvReplyVO;

@Service
public class RvReplyServiceImpl implements RvReplyService {

	@Inject
	private RvReplyDAO dao;
	
	//요리 후기 댓글 조회
	@Override
	public List<RvReplyVO> rvReplyList(int rv_no) throws Exception {
		
		return dao.rvReplyList(rv_no);
	}

	//요리 후기 댓글 작성
	@Override
	public void rvReplyWrite(RvReplyVO vo) throws Exception {
		dao.rvReplyWrite(vo);
	}
	
	//요리 후기 댓글 1개 조회
	@Override
	public RvReplyVO rvReplyView(int rva_no) throws Exception {
		return dao.rvReplyView(rva_no);
	}

	//요리 후기 댓글 수정
	@Override
	public void rvReplyModify(RvReplyVO vo) throws Exception {
		dao.rvReplyModify(vo);
	}

	//요리 후기 댓글 삭제
	@Override
	public void rvReplyDelete(int rva_no) throws Exception {
		dao.rvReplyDelete(rva_no);
	}

}
