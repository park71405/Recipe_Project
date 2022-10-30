package com.recipe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.NoBoardDAO;
import com.recipe.domain.NoBoardVO;

@Service
public class NoBoardServiceImpl implements NoBoardService {

	@Inject
	private NoBoardDAO dao;
	
	//notice 총 개수
	@Override
	public int noCount() throws Exception {
		
		return dao.noCount();
	}

	//공지 목록
	@Override
	public List<NoBoardVO> noList(int noDisplayPost, int noPostNum, String noSearchType, String no_keyword)
			throws Exception {
		
		return dao.noList(noDisplayPost, noPostNum, noSearchType, no_keyword);
	}

	//Notice 작성
	@Override
	public void noWrite(NoBoardVO vo) throws Exception {
		
		dao.noWrite(vo);
	}

	//notice 작성
	@Override
	public NoBoardVO noView(int no_no) throws Exception {
		
		return dao.noView(no_no);
	}

	//notice 삭제
	@Override
	public void noDelete(int no_no) throws Exception {
		
		dao.noDelete(no_no);
	}

	//notice 수정
	@Override
	public void noModify(NoBoardVO vo) throws Exception {
		dao.noModify(vo);
	}

}
