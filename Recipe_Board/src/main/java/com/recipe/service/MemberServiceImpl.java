package com.recipe.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.recipe.dao.MemberDAO;
import com.recipe.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	//회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		dao.signup(vo);
	}

	//로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return dao.signin(vo);
	}

	//로그아웃
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}

	//해당 아이디 있는지 존재 여부
	@Override
	public int isUser(String user_id) throws Exception {
		return dao.isUser(user_id);
	}

}
