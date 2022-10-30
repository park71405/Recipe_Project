package com.recipe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.recipe.domain.ManagerVO;
import com.recipe.domain.MemberVO;

public interface ManaService {
	
	//회원가입
	public void manaup(ManagerVO vo) throws Exception;

	// 로그인
	public ManagerVO manalogin(ManagerVO vo) throws Exception;

	// 로그아웃
	public void signout(HttpSession session) throws Exception;

	// 해당 아이디 있는지 존재 여부
	public int isMana(String mana_id) throws Exception;
	
	//member 총 수
	public int memberCount() throws Exception;
	
	//mebmer 목록
	public List<MemberVO> memberList(int displayPost, int postNum) throws Exception;

}
