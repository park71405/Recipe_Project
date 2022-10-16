package com.recipe.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.RcpBoardVO;

@Repository
public class RcpBoardDAOImpl implements RcpBoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.recipe.mappers.rcpBoard";

	// 레시피 목록
	@Override
	public List<RcpBoardVO> rcpList(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpList", data);
	}

	// 레시피 요리종류 밥 목록
	@Override
	public List<RcpBoardVO> rcpKindType1List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindType1List", data);
	}

	// 레시피 요리종류 후식 목록
	@Override
	public List<RcpBoardVO> rcpKindType2List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindType2List", data);
	}

	// 레시피 요리종류 반찬 목록
	@Override
	public List<RcpBoardVO> rcpKindType3List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindType3List", data);
	}

	// 레시피 요리종류 국&찌개 목록
	@Override
	public List<RcpBoardVO> rcpKindType4List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindType4List", data);
	}

	// 레시피 요리종류 일품 목록
	@Override
	public List<RcpBoardVO> rcpKindType5List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindType5List", data);
	}

	// 레시피 요리종류 기타 목록
	@Override
	public List<RcpBoardVO> rcpKindType6List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindType6List", data);
	}
	
	// 레시피 조리방법 볶기 목록
	@Override
	public List<RcpBoardVO> rcpKindCookM1List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindCookM1List", data);
	}

	// 레시피 조리방법 굽기 목록
	@Override
	public List<RcpBoardVO> rcpKindCookM2List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindCookM2List", data);
	}

	// 레시피 조리방법 끓이기 목록
	@Override
	public List<RcpBoardVO> rcpKindCookM3List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindCookM3List", data);
	}

	// 레시피 조리방법 찌기 목록
	@Override
	public List<RcpBoardVO> rcpKindCookM4List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindCookM4List", data);
	}

	// 레시피 조리방법 튀기기 목록
	@Override
	public List<RcpBoardVO> rcpKindCookM5List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindCookM5List", data);
	}

	// 레시피 조리방법 기타 목록
	@Override
	public List<RcpBoardVO> rcpKindCookM6List(int displayPost, int postNum, String rcpSearchType, String rcpKeyword)
			throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("rcpSearchType", rcpSearchType);
		data.put("rcpKeyword", rcpKeyword);

		return sql.selectList(namespace + ".rcpKindCookM6List", data);
	}	

	// 레시피 조회
	@Override
	public RcpBoardVO rcpView(int rcp_seq) throws Exception {

		return sql.selectOne(namespace + ".rcpView", rcp_seq);
	}

	// 레시피 총 개수
	@Override
	public int rcpCount() throws Exception {

		return sql.selectOne(namespace + ".rcpCount");
	}

}
