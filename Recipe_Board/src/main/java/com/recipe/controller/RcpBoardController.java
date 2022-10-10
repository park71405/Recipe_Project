package com.recipe.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.recipe.domain.Page;
import com.recipe.domain.RcpBoardVO;
import com.recipe.service.RcpBoardService;

@Controller
@RequestMapping("/rcpBoard/*")
public class RcpBoardController {

	@Inject
	RcpBoardService service;
	
	//레시피 목록
	@RequestMapping(value="/rcpList", method = RequestMethod.GET)
	public void getRcpListPage(Model model, @RequestParam("num") int num,
			@RequestParam(value="rcpSearchType", required = false, defaultValue="rcpTitle") String rcpSearchType, 
			@RequestParam(value="rcpKeyword", required = false, defaultValue="") String rcpKeyword) throws Exception{
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.rcpCount());
		
		page.setSearchType(rcpSearchType);
		page.setKeyword(rcpKeyword);
		
		List<RcpBoardVO> list = null;
		list = service.rcpList(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		
		model.addAttribute("rcpImg1", list.get((int)(Math.random() * 10)));
		model.addAttribute("rcpImg2", list.get((int)(Math.random() * 10)));
		model.addAttribute("rcpImg3", list.get((int)(Math.random() * 10)));
		
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
	
	//레시피 전체 조회 목록
	@RequestMapping(value="/rcpAllList", method = RequestMethod.GET)
	public void getRcpAllListPage(Model model, @RequestParam("num") int num,
			@RequestParam(value="rcpSearchType", required = false, defaultValue="rcpTitle") String rcpSearchType, 
			@RequestParam(value="rcpKeyword", required = false, defaultValue="") String rcpKeyword) throws Exception{
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.rcpCount());
		
		page.setSearchType(rcpSearchType);
		page.setKeyword(rcpKeyword);
		
		List<RcpBoardVO> list = null;
		list = service.rcpList(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		
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
	
	//레시피 요리 조회 목록
	@RequestMapping(value="/rcpKindList", method = RequestMethod.GET)
	public void getRcpKindListPage(Model model, @RequestParam("num") int num,
			@RequestParam(value="rcpSearchType", required = false, defaultValue="rcpTitle") String rcpSearchType, 
			@RequestParam(value="rcpKeyword", required = false, defaultValue="") String rcpKeyword) throws Exception{
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.rcpCount());
		
		page.setSearchType(rcpSearchType);
		page.setKeyword(rcpKeyword);
		
		List<RcpBoardVO> list = null;
		list = service.rcpList(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		
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
	
	//레시피 조회
	@RequestMapping(value="/rcpView", method=RequestMethod.GET)
	public void getRcpView(@RequestParam("rcp_seq") int rcp_seq, Model model) throws Exception{
		
		RcpBoardVO vo = service.rcpView(rcp_seq);
	
		model.addAttribute("rcpView", vo);
	}
	
}
