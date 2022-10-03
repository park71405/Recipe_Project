package com.recipe.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.recipe.domain.RvReplyVO;
import com.recipe.service.RvReplyService;

@Controller
@RequestMapping("/rvReply/*")
public class RvReplyController {
	
	@Inject
	private RvReplyService replyservice;
	
	//요리 후기 댓글 작성
	@RequestMapping(value="/rvReplyWrite", method = RequestMethod.POST)
	public String postWrite(RvReplyVO vo) throws Exception{
		
		replyservice.rvReplyWrite(vo);
		
		return "redirect:/reviewBoard/reviewView?rv_no=" + vo.getRv_no();
	}
	
	//요리 후기 댓글 수정
	@RequestMapping(value="/rvReplyModify", method=RequestMethod.GET)
	public void getRvaModify(@RequestParam("rva_no") int rva_no, Model model) throws Exception{
		
		RvReplyVO vo = replyservice.rvReplyView(rva_no);
	
		model.addAttribute("rva", vo);
	}
	
	//요리 후기 댓글 수정
	@RequestMapping(value="/rvReplyModify", method=RequestMethod.POST)
	public String postRvaModify(RvReplyVO vo) throws Exception{
		
		replyservice.rvReplyModify(vo);
		
		return "redirect:/reviewBoard/reviewView?rv_no=" + vo.getRv_no();
	}
	
	//요리 후기 댓글 삭제
	@RequestMapping(value="/rvReplyDelete", method = RequestMethod.GET)
	public String postRvaDelete(@RequestParam("rva_no") int rva_no, @RequestParam("rv_no") int rv_no) throws Exception {
		replyservice.rvReplyDelete(rva_no);
		
		String rv = String.valueOf(rv_no);
		
		return "redirect:/reviewBoard/reviewView?rv_no=" + rv;
	}

}
