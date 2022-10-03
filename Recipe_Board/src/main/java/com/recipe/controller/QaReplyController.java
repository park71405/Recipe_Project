package com.recipe.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.recipe.domain.QaReplyVO;
import com.recipe.service.QaReplyService;

@Controller
@RequestMapping("/qaReply/*")
public class QaReplyController {

	@Inject
	private QaReplyService replyservice;
	
	//QA 댓글 작성
	@RequestMapping(value="/qaReplyWrite", method = RequestMethod.POST)
	public String postWrite(QaReplyVO vo) throws Exception{
		
		replyservice.qaReplyWrite(vo);
		
		return "redirect:/qaBoard/qaView?qa_no=" + vo.getQa_no();
	}
	
	//QA 댓글 수정
	@RequestMapping(value="/qaReplyModify", method=RequestMethod.GET)
	public void getQaaModify(@RequestParam("qaa_no") int qaa_no, Model model) throws Exception{
		
		QaReplyVO vo = replyservice.qaReplyView(qaa_no);
	
		model.addAttribute("qaa", vo);
	}
	
	//QA 댓글 수정
	@RequestMapping(value="/qaReplyModify", method=RequestMethod.POST)
	public String postRvaModify(QaReplyVO vo) throws Exception{
		
		replyservice.qaReplyModify(vo);
		
		return "redirect:/qaBoard/qaView?qa_no=" + vo.getQa_no();
	}
	
	//QA 댓글 삭제
	@RequestMapping(value="/qaReplyDelete", method = RequestMethod.GET)
	public String postRvaDelete(@RequestParam("qaa_no") int qaa_no, @RequestParam("qa_no") int qa_no) throws Exception {
		replyservice.qaReplyDelete(qaa_no);
		
		String qa = String.valueOf(qa_no);
		
		return "redirect:/qaBoard/qaView?qa_no=" + qa;
	}	
	
}
