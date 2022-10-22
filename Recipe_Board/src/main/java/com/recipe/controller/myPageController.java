package com.recipe.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recipe.domain.MemberVO;
import com.recipe.service.MemberService;
import com.recipe.service.MyPageService;

@Controller
@RequestMapping("/myPage/*")
public class myPageController {
	
	@Inject
	MyPageService service;
	
	@Inject
	MemberService memservice;

	//회원정보 
	@RequestMapping(value="/userInfo", method=RequestMethod.GET)
	public void getUserInfor(HttpServletRequest request, Model model) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		model.addAttribute("userInfo", user);
		
	}
	
	//회원정보 수정
	@RequestMapping(value="/userInfoModify", method = RequestMethod.GET)
	public void getUserInfoModify(HttpServletRequest request, Model model) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		model.addAttribute("userInfo", user);
	}
	
	//회원정보 수정
	@RequestMapping(value="/userInfoModify", method = RequestMethod.POST)
	public String postUserInfowModify(MemberVO vo, HttpSession session) throws Exception{
		service.userInfoModify(vo);
		
		memservice.signout(session);
			
		return "redirect:/rcpBoard/rcpList?num=1";
	}
	
}
