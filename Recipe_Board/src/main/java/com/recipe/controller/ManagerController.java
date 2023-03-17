package com.recipe.controller;

import java.util.List;

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

import com.recipe.domain.ManagerVO;
import com.recipe.domain.MemberVO;
import com.recipe.domain.NoBoardVO;
import com.recipe.domain.Page;
import com.recipe.domain.QaVO;
import com.recipe.domain.RcpBoardVO;
import com.recipe.domain.ReviewBoardVO;
import com.recipe.service.ManaService;
import com.recipe.service.NoBoardService;
import com.recipe.service.QaBoardService;
import com.recipe.service.RcpBoardService;
import com.recipe.service.ReviewBoardService;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	@Inject
	ManaService service;

	@Inject
	RcpBoardService rcpService;

	@Inject
	ReviewBoardService rvService;

	@Inject
	NoBoardService noService;
	
	@Inject
	QaBoardService qaService;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	/*
	 * // 회원가입 get
	 * 
	 * @RequestMapping(value = "/manaup", method = RequestMethod.GET) public void
	 * getSignup() throws Exception {
	 * 
	 * }
	 * 
	 * // 회원가입 post
	 * 
	 * @RequestMapping(value = "/manaup", method = RequestMethod.POST) public String
	 * postSignup(ManagerVO vo) throws Exception {
	 * 
	 * String inputPass = vo.getMana_pw(); String pass =
	 * passEncoder.encode(inputPass); vo.setMana_pw(pass);
	 * 
	 * service.manaup(vo);
	 * 
	 * return "redirect:/rcpBoard/rcpList?num=1&result=first"; }
	 */
	// 로그인 get
	@RequestMapping(value = "/manalogin", method = RequestMethod.GET)
	public void getSignin(Model model,
			@RequestParam(value = "result", required = false, defaultValue = "") String result) throws Exception {
		model.addAttribute("result", result);
	}

	// 로그인 post
	@RequestMapping(value = "/manalogin", method = RequestMethod.POST)
	public String postManalogin(ManagerVO vo, HttpServletRequest req, RedirectAttributes rttr, Model model)
			throws Exception {

		int count = service.isMana(vo.getMana_id());
		if (count == 0) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/manager/manalogin?result=f";
		}

		ManagerVO login = service.manalogin(vo);
		HttpSession session = req.getSession();

		boolean passMatch = passEncoder.matches(vo.getMana_pw(), login.getMana_pw());

		if (login != null && passMatch) {
			session.setAttribute("manager", login);
		} else {
			session.setAttribute("manager", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/manager/manalogin";
		}

		return "redirect:/manager/memberList?num=1";
	}

	// 로그아웃
	@RequestMapping(value = "/manalogout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {

		service.signout(session);

		return "redirect:/rcpBoard/rcpList?num=1";
	}

	// 회원 리스트
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public void getQaList(Model model, @RequestParam("num") int num) throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(service.memberCount());

		List<MemberVO> memberlist = null;
		memberlist = service.memberList(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("memberList", memberlist);
		model.addAttribute("PageNum", page.getPageNum());

		model.addAttribute("StartPageNum", page.getStartPageNum());
		model.addAttribute("EndPageNum", page.getEndPageNum());

		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next", page.getNext());

		model.addAttribute("Select", num);
	}

	// rcp 리스트
	@RequestMapping(value = "/rcpList", method = RequestMethod.GET)
	public void getRcpAllListPage(Model model, @RequestParam("num") int num,
			@RequestParam(value = "rcpSearchType", required = false, defaultValue = "rcpTitle") String rcpSearchType,
			@RequestParam(value = "rcpKeyword", required = false, defaultValue = "") String rcpKeyword)
			throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(rcpService.rcpCount());

		page.setSearchType(rcpSearchType);
		page.setKeyword(rcpKeyword);

		List<RcpBoardVO> list = null;
		list = rcpService.rcpList(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);

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

	// 리뷰 목록
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public void getReviewList(Model model, @RequestParam("num") int num,
			@RequestParam(value = "reviewSearchType", required = false, defaultValue = "rv_title") String reviewSearchType,
			@RequestParam(value = "rv_keyword", required = false, defaultValue = "") String rv_keyword)
			throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(rvService.reviewCount());

		page.setSearchType(reviewSearchType);
		page.setKeyword(rv_keyword);

		List<ReviewBoardVO> reviewList = null;
		reviewList = rvService.reviewList(page.getDisplayPost(), page.getPostNum(), reviewSearchType, rv_keyword);

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

	// 리뷰 삭제
	@RequestMapping(value = "/rvDelete", method = RequestMethod.GET)
	public String getReviewDelete(@RequestParam("rv_no") int rv_no) throws Exception {
		rvService.reviewDelete(rv_no);

		return "redirect:/manager/reviewList?num=1";
	}

	// 공지사항 목록
	// 리뷰 목록
	@RequestMapping(value = "/noList", method = RequestMethod.GET)
	public void getNoList(Model model, @RequestParam("num") int num,
			@RequestParam(value = "noSearchType", required = false, defaultValue = "no_title") String noSearchType,
			@RequestParam(value = "no_keyword", required = false, defaultValue = "") String no_keyword)
			throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(noService.noCount());

		page.setSearchType(noSearchType);
		page.setKeyword(no_keyword);

		List<NoBoardVO> noList = null;
		noList = noService.noList(page.getDisplayPost(), page.getPostNum(), noSearchType, no_keyword);

		model.addAttribute("noList", noList);
		model.addAttribute("noPageNum", page.getPageNum());

		model.addAttribute("noStartPageNum", page.getStartPageNum());
		model.addAttribute("noEndPageNum", page.getEndPageNum());

		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next", page.getNext());

		model.addAttribute("noSelect", num);

		model.addAttribute("noSearchType", page.getSearchType());
		model.addAttribute("no_keyword", page.getKeyword());

		model.addAttribute("no_searchTypeKeyword", page.getNoticeSearchTypeKeyword());
	}

	// QA 목록
	@RequestMapping(value = "/qaList", method = RequestMethod.GET)
	public void getQaList(Model model, @RequestParam("num") int num,
			@RequestParam(value = "qa_searchType", required = false, defaultValue = "qa_title") String qa_searchType,
			@RequestParam(value = "qa_keyword", required = false, defaultValue = "") String qa_keyword)
			throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(qaService.qaCount());

		page.setSearchType(qa_searchType);
		page.setKeyword(qa_keyword);

		List<QaVO> qalist = null;
		qalist = qaService.qaList(page.getDisplayPost(), page.getPostNum(), qa_searchType, qa_keyword);

		model.addAttribute("qaList", qalist);
		model.addAttribute("qaPageNum", page.getPageNum());

		model.addAttribute("qaStartPageNum", page.getStartPageNum());
		model.addAttribute("qaEndPageNum", page.getEndPageNum());

		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next", page.getNext());

		model.addAttribute("qaSelect", num);

		model.addAttribute("qa_SearchType", page.getSearchType());
		model.addAttribute("qa_keyword", page.getKeyword());

		model.addAttribute("qa_searchTypeKeyword", page.getQaSearchTypeKeyword());

	}
	
	// 리뷰 삭제
	@RequestMapping(value = "/qaDelete", method = RequestMethod.GET)
	public String getQaDelete(@RequestParam("qa_no") int qa_no) throws Exception {
		qaService.qaDelete(qa_no);

		return "redirect:/manager/qaList?num=1";
	}

}
