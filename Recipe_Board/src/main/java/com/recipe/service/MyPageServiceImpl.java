package com.recipe.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recipe.dao.MyPageDAO;
import com.recipe.domain.MemberVO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	private MyPageDAO dao;

	//회원정보 수정
	@Override
	public void userInfoModify(MemberVO vo) throws Exception {
		
		dao.userInfoModify(vo);
	}
	

}
