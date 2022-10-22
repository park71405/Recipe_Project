package com.recipe.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recipe.domain.MemberVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.recipe.mappers.myPage";

	//회원 정보 수정
	@Override
	public void userInfoModify(MemberVO vo) throws Exception {
		
		sql.update(namespace + ".userInfoModify", vo);
		
	}

	
	

}
