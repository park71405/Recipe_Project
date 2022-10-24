package com.recipe.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.recipe.domain.MemberVO;
import com.recipe.domain.Page;
import com.recipe.domain.RcpBoardVO;
import com.recipe.domain.ReviewBoardVO;
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
	
	//회원 탈퇴
	@RequestMapping(value="/userInfoDelete", method=RequestMethod.GET)
	public String getUserInfoDelete(@RequestParam("user_id") String user_id, HttpServletRequest request) throws Exception {
		
		service.userInfoDelete(user_id);
		
		HttpSession session = request.getSession();
        session.invalidate();
		
		return "redirect:/rcpBoard/rcpList?num=1";
	}
	
	//찜한 목록 보기
	@RequestMapping(value="/rcpHeartList", method = RequestMethod.GET)
	public void getRcpAllListPage(Model model, @RequestParam("num") int num,
			@RequestParam(value="rcpSearchType", required = false, defaultValue="rcpTitle") String rcpSearchType, 
			@RequestParam(value="rcpKeyword", required = false, defaultValue="") String rcpKeyword,
			HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.rcpHeartCount(user.getUser_name()));
		
		page.setSearchType(rcpSearchType);
		page.setKeyword(rcpKeyword);
		
		List<RcpBoardVO> list = null;
		list = service.rcpHeartList(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword, user.getUser_name());
		
		model.addAttribute("rcpList", list);
		model.addAttribute("pageNum", page.getPageNum());
		
		model.addAttribute("rcpStartPageNum", page.getStartPageNum());
		model.addAttribute("rcpEndPageNum", page.getEndPageNum());
		
		model.addAttribute("prev_m", page.getPrev());
		model.addAttribute("next_m", page.getNext());
		
		model.addAttribute("rcpSelect", num);
		
		model.addAttribute("rcpSearchType", page.getSearchType());
		model.addAttribute("rcpKeyword", page.getKeyword());
		
		model.addAttribute("rcpSearchTypeKeyword", page.getRcpSearchTypeKeyword());
	}	
	
	//작성한 요리후기 목록
	@RequestMapping(value="/myReviewList", method = RequestMethod.GET)
	public void getMyReviewList(Model model, @RequestParam("num") int num, 
			@RequestParam(value="reviewSearchType", required = false, defaultValue = "rv_title") String reviewSearchType, 
			@RequestParam(value="rv_keyword", required = false, defaultValue = "") String rv_keyword,
			HttpServletRequest request
			) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.myReviewCount(user.getUser_name()));
		
		page.setSearchType(reviewSearchType);
		page.setKeyword(rv_keyword);
		
		List<ReviewBoardVO> reviewList = null;
		reviewList = service.myReviewList(page.getDisplayPost(), page.getPostNum(), reviewSearchType, rv_keyword, user.getUser_name());
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewPageNum", page.getPageNum());
		
		model.addAttribute("reviewStartPageNum", page.getStartPageNum());
		model.addAttribute("reviewEndPageNum", page.getEndPageNum());
		
		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next", page.getNext());
		
		model.addAttribute("reviewSelect", num);
		
		model.addAttribute("reviewSearchType", page.getSearchType());
		model.addAttribute("rv_keyword", page.getKeyword());
		
		model.addAttribute("rv_searchTypeKeyword", page.getRvSearchTypeKeyword());
	}
	
}
