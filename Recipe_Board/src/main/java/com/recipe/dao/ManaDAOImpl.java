package com.recipe.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.ManagerVO;
import com.recipe.domain.MemberVO;

@Repository
public class ManaDAOImpl implements ManaDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.recipe.mappers.manaMapper";

	// 회원가입
	@Override
	public void manaup(ManagerVO vo) throws Exception {
		sql.insert(namespace + ".manaup", vo);
	}

	// 로그인
	@Override
	public ManagerVO manalogin(ManagerVO vo) throws Exception {

		return sql.selectOne(namespace + ".manalogin", vo);
	}

	// 해당 아이디 있는지 존재 여부
	@Override
	public int isMana(String mana_id) throws Exception {

		return sql.selectOne(namespace + ".isMana", mana_id);
	}

	//member 총 수
	@Override
	public int memberCount() throws Exception {
		return sql.selectOne(namespace + ".memberCount");
	}

	//member 목록
	@Override
	public List<MemberVO> memberList(int displayPost, int postNum) throws Exception {
		
		HashMap<String ,Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".memberList", data);
	}

}
