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
import com.recipe.domain.RefriVO;
import com.recipe.service.RefriService;


@Controller
@RequestMapping("/refri/*")
public class RefriController {

	@Inject
	RefriService service;
	
	//재료 목록
		@RequestMapping(value="/refriList", method = RequestMethod.GET)
		public void getRefriList(Model model, @RequestParam("num") int num, 
				@RequestParam(value="refriSearchType", required = false, defaultValue = "refri_title") String refriSearchType, 
				@RequestParam(value="refri_keyword", required = false, defaultValue = "") String refri_keyword
				) throws Exception {
			
			Page page = new Page();
			
			page.setNum(num);
			page.setCount(service.refriCount());
			
			page.setSearchType(refriSearchType);
			page.setKeyword(refri_keyword);
			
			List<RefriVO> refriList = null;
			refriList = service.refriList(page.getDisplayPost(), page.getPostNum(), refriSearchType, refri_keyword);
			
			model.addAttribute("refriList", refriList);
			model.addAttribute("refriPageNum", page.getPageNum());
			
			model.addAttribute("refriStartPageNum", page.getStartPageNum());
			model.addAttribute("refriEndPageNum", page.getEndPageNum());
			
			model.addAttribute("prev", page.getPrev());
			model.addAttribute("next", page.getNext());
			
			model.addAttribute("refriSelect", num);
			
			model.addAttribute("refriSearchType", page.getSearchType());
			model.addAttribute("refri_keyword", page.getKeyword());
			
			model.addAttribute("refri_searchTypeKeyword", page.getRefriSearchTypeKeyword());
		}
	
	//재료 종류별 분류 목록
	@RequestMapping(value="/refriTypeList", method = RequestMethod.GET)
	public void getRefriTypeList() throws Exception{
		
	}
	
	//재료 종류별 분류
	@RequestMapping(value="/ingreType", method = RequestMethod.GET)
	public void getIngreTypeView(@RequestParam("type") String type, @RequestParam("num") int num, Model model) throws Exception{
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.refriCount());
		
		List<RefriVO> refriList = null;
		
		if(type.equals("meat")) {
			refriList = service.ingreMeat(page.getDisplayPost(), page.getPostNum());
		}else if(type.equals("vege")) {
			refriList = service.ingreVege(page.getDisplayPost(), page.getPostNum());
		}else if(type.equals("can")) {
			refriList = service.ingreCan(page.getDisplayPost(), page.getPostNum());
		}else if(type.equals("fish")) {
			refriList = service.ingreFish(page.getDisplayPost(), page.getPostNum());
		}else if(type.equals("fruits")) {
			refriList = service.ingreFruits(page.getDisplayPost(), page.getPostNum());
		}else if(type.equals("dairy")) {
			refriList = service.ingreDairy(page.getDisplayPost(), page.getPostNum());
		}else {
			refriList = service.ingreEtc(page.getDisplayPost(), page.getPostNum());
		}
		
		model.addAttribute("refriList", refriList);
		model.addAttribute("refriPageNum", page.getPageNum());

		model.addAttribute("refriStartPageNum", page.getStartPageNum());
		model.addAttribute("refriEndPageNum", page.getEndPageNum());
		
		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next", page.getNext());
		
		model.addAttribute("refriSelect", num);
		
	}
		
	//재료 추가
	@RequestMapping(value="/refriAdd", method = RequestMethod.GET)
	public void getRefriAdd(Model model) throws Exception{
			
	}
	
	//재료 추가
	@RequestMapping(value = "/refriAdd", method = RequestMethod.POST)
	public String postRefriAdd(RefriVO vo, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		vo.setUser_name(user.getUser_name());
		
		service.ingreAdd(vo);
		
		return "redirect:/refri/refriList?num=1";
	}
	
	//재료 수정
	@RequestMapping(value="/refriModify", method = RequestMethod.GET)
	public void getRefriModify(@RequestParam("ingre_no") int ingre_no, Model model) throws Exception{
		
		RefriVO vo = service.refriView(ingre_no);
		
		model.addAttribute("refri", vo);
	}
	
	//재료 수정
	@RequestMapping(value="/refriModify", method = RequestMethod.POST)
	public String postRefriModify(RefriVO vo) throws Exception{
		
		service.refriModify(vo);
		
		return "redirect:/refri/refriList?num=1";
	}
	
	//재료 삭제
	@RequestMapping(value="/refriDelete", method=RequestMethod.GET)
	public String getRefriDelete(@RequestParam("ingre_no") int ingre_no) throws Exception{
		service.refriDelete(ingre_no);
		
		return "redirect:/refri/refriList?num=1";
	}
	
	//재료 사진으로 추가
	@RequestMapping(value="/refriCameAdd", method = RequestMethod.GET)
	public void getRefriCameAdd(Model model) throws Exception{
			
	}
	
	
}
