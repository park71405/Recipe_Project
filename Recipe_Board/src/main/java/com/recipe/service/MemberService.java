package com.recipe.service;

import javax.servlet.http.HttpSession;

import com.recipe.domain.MemberVO;

public interface MemberService {

	//회원가입
	public void signup(MemberVO vo) throws Exception;
	
	//로그인 
	public MemberVO signin(MemberVO vo) throws Exception;
	
	//로그아웃
	public void signout(HttpSession session) throws Exception;
	
	//해당 아이디 있는지 존재 여부
	public int isUser(String user_id) throws Exception;
	
}
