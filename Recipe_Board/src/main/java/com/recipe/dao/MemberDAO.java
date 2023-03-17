package com.recipe.dao;

import com.recipe.domain.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void signup(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	//해당 아이디 있는지 존재 여부
	public int isUser(String user_id) throws Exception;
}
