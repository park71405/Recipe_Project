package com.recipe.dao;

import com.recipe.domain.MemberVO;

public interface MyPageDAO {
	
	//회원정보 수정
	public void userInfoModify(MemberVO vo) throws Exception;
		
}
