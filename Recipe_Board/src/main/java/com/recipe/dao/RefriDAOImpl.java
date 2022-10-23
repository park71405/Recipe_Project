package com.recipe.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.RefriVO;

@Repository
public class RefriDAOImpl implements RefriDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.recipe.mappers.refri";
	
	//냉장고 재료 총 개수
	@Override
	public int refriCount() throws Exception {
		
		return sql.selectOne(namespace + ".refriCount");
	}

	//냉장고 재료 목롞
	@Override
	public List<RefriVO> refriList(int refriDisplayPost, int refriPostNum, String refriSearchType, String refri_keyword)
			throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("refriDisplayPost", refriDisplayPost);
		data.put("refriPostNum", refriPostNum);
		
		data.put("refriSearchType", refriSearchType);
		data.put("refri_keyword", refri_keyword);
		
		
		return sql.selectList(namespace + ".refriList", data);
	}

	//육류 목록
	@Override
	public List<RefriVO> ingreMeat(int ingreDisplayPost, int ingrePostNum) throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("refriDisplayPost", ingreDisplayPost);
		data.put("refriPostNum", ingrePostNum);
		
		return sql.selectList(namespace + ".ingreMeat", data);
	}

	//채소 목록
	@Override
	public List<RefriVO> ingreVege(int ingreDisplayPost, int ingrePostNum) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("refriDisplayPost", ingreDisplayPost);
		data.put("refriPostNum", ingrePostNum);
		
		return sql.selectList(namespace + ".ingreVege", data);
	}

	//가공식품 목록
	@Override
	public List<RefriVO> ingreCan(int ingreDisplayPost, int ingrePostNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("refriDisplayPost", ingreDisplayPost);
		data.put("refriPostNum", ingrePostNum);
		
		return sql.selectList(namespace + ".ingreCan", data);
	}

	//어류 목록
	@Override
	public List<RefriVO> ingreFish(int ingreDisplayPost, int ingrePostNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("refriDisplayPost", ingreDisplayPost);
		data.put("refriPostNum", ingrePostNum);
		
		return sql.selectList(namespace + ".ingreFish", data);
	}
	
	//과일 목록
	@Override
	public List<RefriVO> ingreFruits(int ingreDisplayPost, int ingrePostNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("refriDisplayPost", ingreDisplayPost);
		data.put("refriPostNum", ingrePostNum);
		
		return sql.selectList(namespace + ".ingreFruits", data);
	}

	//유제품 목록
	@Override
	public List<RefriVO> ingreDairy(int ingreDisplayPost, int ingrePostNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("refriDisplayPost", ingreDisplayPost);
		data.put("refriPostNum", ingrePostNum);
		
		return sql.selectList(namespace + ".ingreDairy", data);
	}

	//기타 목록
	@Override
	public List<RefriVO> ingreEtc(int ingreDisplayPost, int ingrePostNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("refriDisplayPost", ingreDisplayPost);
		data.put("refriPostNum", ingrePostNum);
		
		return sql.selectList(namespace + ".ingreEtc", data);
	}

	//재료 추가
	@Override
	public void ingreAdd(RefriVO vo) throws Exception {
		
		sql.insert(namespace + ".ingreAdd", vo);
	}

	//재료 삭제
	@Override
	public void refriDelete(int ingre_no) throws Exception {
		sql.delete(namespace + ".refriDelete", ingre_no);
	}

	//재료 수정
	@Override
	public void refriModify(RefriVO vo) throws Exception {
		sql.update(namespace + ".refriModify", vo);
	}

	//재료 조회
	@Override
	public RefriVO refriView(int ingre_no) throws Exception {
		return sql.selectOne(namespace + ".refriView", ingre_no);
	}

}
