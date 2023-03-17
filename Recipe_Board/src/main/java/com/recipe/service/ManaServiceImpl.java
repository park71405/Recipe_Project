package com.recipe.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.recipe.dao.ManaDAO;
import com.recipe.domain.ManagerVO;
import com.recipe.domain.MemberVO;

@Service
public class ManaServiceImpl implements ManaService {

	@Inject
	private ManaDAO dao;

	// 회원가입
	@Override
	public void manaup(ManagerVO vo) throws Exception {
		dao.manaup(vo);
	}

	// 로그인
	@Override
	public ManagerVO manalogin(ManagerVO vo) throws Exception {

		return dao.manalogin(vo);
	}

	// 로그아웃
	@Override
	public void signout(HttpSession session) throws Exception {

		session.invalidate();
	}

	// 해당 아이디 있는지 존재 여부
	@Override
	public int isMana(String mana_id) throws Exception {

		return dao.isMana(mana_id);
	}

	//member 총 수
	@Override
	public int memberCount() throws Exception {
		return dao.memberCount();
	}

	//member 목록
	@Override
	public List<MemberVO> memberList(int displayPost, int postNum) throws Exception {
		
		return dao.memberList(displayPost, postNum);
	}

}
