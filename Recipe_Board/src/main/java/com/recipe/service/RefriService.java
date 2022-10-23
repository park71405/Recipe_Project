package com.recipe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recipe.domain.RefriVO;

@Service
public interface RefriService {

	// 냉장고 재료 총 개수
	public int refriCount() throws Exception;

	// 냉장고 재료 목록
	public List<RefriVO> refriList(int refriDisplayPost, int refriPostNum, String refriSearchType, String refri_keyword)
			throws Exception;

	// 육류 목록
	public List<RefriVO> ingreMeat(int ingreDisplayPost, int ingrePostNum) throws Exception;

	// 채소 목록
	public List<RefriVO> ingreVege(int ingreDisplayPost, int ingrePostNum) throws Exception;

	// 가공 식품 목록
	public List<RefriVO> ingreCan(int ingreDisplayPost, int ingrePostNum) throws Exception;

	// 어류 목록
	public List<RefriVO> ingreFish(int ingreDisplayPost, int ingrePostNum) throws Exception;

	// 과일 목록
	public List<RefriVO> ingreFruits(int ingreDisplayPost, int ingrePostNum) throws Exception;

	// 유제품 목록
	public List<RefriVO> ingreDairy(int ingreDisplayPost, int ingrePostNum) throws Exception;

	//기타 목록
	public List<RefriVO> ingreEtc(int ingreDisplayPost, int ingrePostNum) throws Exception;

	//재료 추가
	public void ingreAdd(RefriVO vo) throws Exception;
	
	//재료 조회
	public RefriVO refriView(int ingre_no) throws Exception;
	
	//재료 삭제
	public void refriDelete(int ingre_no) throws Exception;
	
	//재료 수정
	public void refriModify(RefriVO vo) throws Exception;
	
}
