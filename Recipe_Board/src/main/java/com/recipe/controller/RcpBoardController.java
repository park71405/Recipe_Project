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
import com.recipe.domain.RcpPartsVO;
import com.recipe.domain.RcpProcessVO;
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
			@RequestParam(value="rcpKeyword", required = false, defaultValue="") String rcpKeyword,
			@RequestParam(value="result", required = false, defaultValue="") String result) throws Exception{
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.rcpCount());
		
		page.setSearchType(rcpSearchType);
		page.setKeyword(rcpKeyword);
		
		List<RcpBoardVO> list = null;
		list = service.rcpList(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		
		model.addAttribute("result", result);
		
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
	
	//레시피 요리종류 조회 목록 
	@RequestMapping(value="/rcpKindTypeList", method = RequestMethod.GET)
	public void getRcpKindTypeListPage(Model model, @RequestParam("num") int num,
		@RequestParam(value="rcpSearchType", required = false, defaultValue="rcpTitle") String rcpSearchType, 
		@RequestParam(value="rcpKeyword", required = false, defaultValue="") String rcpKeyword,
		@RequestParam(value="rcpType", required = false, defaultValue="") String rcpType,
		@RequestParam(value="rcpCookM", required = false, defaultValue="") String rcpCookM) throws Exception{
			
		Page page = new Page();
			
		page.setNum(num);
		page.setCount(service.rcpCount());
			
		page.setSearchType(rcpSearchType);
		page.setKeyword(rcpKeyword);
			
		List<RcpBoardVO> list = null;
		if(rcpType.equals("밥")) {
			list = service.rcpKindType1List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpType.equals("후식")) {
			list = service.rcpKindType2List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpType.equals("반찬")) {
			list = service.rcpKindType3List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpType.equals("국")) {
			list = service.rcpKindType4List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpType.equals("일품")) {
			list = service.rcpKindType5List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpType.equals("기타")) {
			list = service.rcpKindType6List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpCookM.equals("볶기")) {
			list = service.rcpKindCookM1List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpCookM.equals("굽기")) {
			list = service.rcpKindCookM2List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpCookM.equals("끓이기")) {
			list = service.rcpKindCookM3List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpCookM.equals("찌기")) {
			list = service.rcpKindCookM4List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpCookM.equals("튀기기")) {
			list = service.rcpKindCookM5List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else if(rcpCookM.equals("기타")) {
			list = service.rcpKindCookM6List(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		} else {
			list = service.rcpList(page.getDisplayPost(), page.getPostNum(), rcpSearchType, rcpKeyword);
		}
		
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
		
		if(rcpType.equals("")) {
			model.addAttribute("rcpTypeKeyword", "");
		}else {
			model.addAttribute("rcpTypeKeyword", "&rcpType="+rcpType);
		}
		
		if(rcpCookM.equals("")) {
			model.addAttribute("rcprcpCookMKeyword", "");
		}else {
			model.addAttribute("rcprcpCookMKeyword", "&rcpCookM="+rcpCookM);
		}
	}
	
	//레시피 조회
	@RequestMapping(value="/rcpView", method=RequestMethod.GET)
	public void getRcpView(@RequestParam("rcp_seq") int rcp_seq, Model model) throws Exception{
		
		RcpBoardVO vo = service.rcpView(rcp_seq);
		RcpProcessVO proVo = service.rcpProcessView(rcp_seq);
		List<RcpPartsVO> partsVo = service.rcpPartsView(rcp_seq);
	
		model.addAttribute("partsView", partsVo);
		model.addAttribute("proView", proVo);
		model.addAttribute("rcpView", vo);
	}
	
}
