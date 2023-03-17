package com.recipe.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recipe.domain.MemberVO;
import com.recipe.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	//회원가입 get
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public void getSignup() throws Exception{
		
	}
	
	//회원가입 post
	@RequestMapping(value="/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception{
		
		String inputPass = vo.getUser_pw();
		String pass = passEncoder.encode(inputPass);
		vo.setUser_pw(pass);
		
		service.signup(vo);
		
		return "redirect:/rcpBoard/rcpList?num=1&result=first";
	}
	
	// 로그인  get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin(Model model,
			@RequestParam(value="result", required = false, defaultValue="") String result) throws Exception {
		model.addAttribute("result", result);
	}

	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr, Model model) throws Exception {

		int count = service.isUser(vo.getUser_id());
		if(count == 0) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin?result=f";
		}
		
		MemberVO login = service.signin(vo);  
		HttpSession session = req.getSession();
		
		
		boolean passMatch = passEncoder.matches(vo.getUser_pw(), login.getUser_pw());
	 
		if(login != null && passMatch) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}  
	 
		return "redirect:/rcpBoard/rcpList?num=1";
	}
	  
	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
	 
		service.signout(session);
	   
		return "redirect:/rcpBoard/rcpList?num=1";
	}
}
