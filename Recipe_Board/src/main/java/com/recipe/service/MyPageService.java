package com.recipe.service;

import org.springframework.stereotype.Service;

import com.recipe.domain.MemberVO;

@Service
public interface MyPageService {

	//회원정보 수정
	public void userInfoModify(MemberVO vo) throws Exception;
	
}
