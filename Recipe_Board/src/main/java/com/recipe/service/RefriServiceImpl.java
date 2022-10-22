package com.recipe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.RefriDAO;
import com.recipe.domain.RefriVO;
@Service
public class RefriServiceImpl implements RefriService {

	@Inject
	private RefriDAO dao;
	
	//냉장고 재료 총 개수
	@Override
	public int refriCount() throws Exception {
		
		return dao.refriCount();
	}

	//냉장고 재료 목록
	@Override
	public List<RefriVO> refriList(int refriDisplayPost, int refriPostNum, String refriSearchType, String refri_keyword)
			throws Exception {
		
		return dao.refriList(refriDisplayPost, refriPostNum, refriSearchType, refri_keyword);
	}

	//육류 목록
	@Override
	public List<RefriVO> ingreMeat(int ingreDisplayPost, int ingrePostNum) throws Exception {
		
		return dao.ingreMeat(ingreDisplayPost, ingrePostNum);
	}

	// 채소 목록
	@Override
	public List<RefriVO> ingreVege(int ingreDisplayPost, int ingrePostNum) throws Exception {

		return dao.ingreVege(ingreDisplayPost, ingrePostNum);
	}

	// 가공 식품 목록
	@Override
	public List<RefriVO> ingreCan(int ingreDisplayPost, int ingrePostNum) throws Exception {

		return dao.ingreCan(ingreDisplayPost, ingrePostNum);
	}

	// 어류 목록
	@Override
	public List<RefriVO> ingreFish(int ingreDisplayPost, int ingrePostNum) throws Exception {

		return dao.ingreFish(ingreDisplayPost, ingrePostNum);
	}

	// 과일 목록
	@Override
	public List<RefriVO> ingreFruits(int ingreDisplayPost, int ingrePostNum) throws Exception {

		return dao.ingreFruits(ingreDisplayPost, ingrePostNum);
	}

	// 유제품 목록
	@Override
	public List<RefriVO> ingreDairy(int ingreDisplayPost, int ingrePostNum) throws Exception {

		return dao.ingreDairy(ingreDisplayPost, ingrePostNum);
	}

	//기타 재료 목록
	@Override
	public List<RefriVO> ingreEtc(int ingreDisplayPost, int ingrePostNum) throws Exception {
		
		return dao.ingreEtc(ingreDisplayPost, ingrePostNum);
	}

	//재료 추가
	@Override
	public void ingreAdd(RefriVO vo) throws Exception {
		
		dao.ingreAdd(vo);
	}

}
