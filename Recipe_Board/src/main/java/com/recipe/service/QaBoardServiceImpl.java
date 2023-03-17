package com.recipe.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.QaBoardDAO;
import com.recipe.domain.QaVO;

@Service
public class QaBoardServiceImpl implements QaBoardService {

	@Inject
	private QaBoardDAO dao;
	
	//QA 총 개수
	@Override
	public int qaCount() throws Exception {
		return dao.qaCount();
	}
	
	//Qa 목록
	@Override
	public List<QaVO> qaList(int displayPost, int postNum, String qa_searchType, String qa_keyword) throws Exception {
		
		return dao.qaList(displayPost, postNum, qa_searchType, qa_keyword);
	}

	//QA 작성
	@Override
	public void qaWrite(QaVO vo) throws Exception {
		dao.qaWrite(vo);
	}

	//QA 조회
	@Override
	public QaVO qaView(int qa_no) throws Exception {
		
		return dao.qaView(qa_no);
	}

	//QA 수정
	@Override
	public void qaModify(QaVO vo) throws Exception {
		dao.qaModify(vo);
	}

	//QA 삭제
	@Override
	public void qaDelete(int qa_no) throws Exception {
		dao.qaDelete(qa_no);
	}

	//QA 신고
	@Override
	public void alert(int qa_no, int qa_warning) throws Exception {
		
		dao.alert(qa_no, qa_warning);
	}

}
