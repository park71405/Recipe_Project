package com.recipe.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.recipe.domain.NoBoardVO;
import com.recipe.domain.Page;
import com.recipe.service.NoBoardService;

@Controller
@RequestMapping("/noBoard/*")
public class noController {
	
	@Inject
	NoBoardService service;
	
	//리뷰 목록
	@RequestMapping(value="/noList", method = RequestMethod.GET)
	public void getNoList(Model model, @RequestParam("num") int num, 
			@RequestParam(value="noSearchType", required = false, defaultValue = "no_title") String noSearchType, 
			@RequestParam(value="no_keyword", required = false, defaultValue = "") String no_keyword
			) throws Exception {
			
		Page page = new Page();
			
		page.setNum(num);
		page.setCount(service.noCount());
			
		page.setSearchType(noSearchType);
		page.setKeyword(no_keyword);
			
		List<NoBoardVO> noList = null;
		noList = service.noList(page.getDisplayPost(), page.getPostNum(), noSearchType, no_keyword);
			
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
	
	//notice 작성
	@RequestMapping(value = "/noWrite", method = RequestMethod.GET)
	public void getNoWrite() throws Exception {
		   
	}
	
	//notice 작성
	@RequestMapping(value = "/noWrite", method = RequestMethod.POST)
	public String postNoWrite(NoBoardVO vo) throws Exception {
			
	  service.noWrite(vo);
		  
	  return "redirect:/noBoard/noList?num=1";
	}
	
	//notice 조회
	@RequestMapping(value="/noView", method = RequestMethod.GET)
	public void getReviewView(@RequestParam("no_no") int no_no, Model model) throws Exception{
			
		NoBoardVO vo = service.noView(no_no);
			
		model.addAttribute("noView", vo);
	}
}
