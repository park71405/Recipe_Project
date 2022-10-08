package com.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.recipe.domain.Page;
import com.recipe.domain.QaReplyVO;
import com.recipe.domain.QaVO;
import com.recipe.service.QaBoardService;
import com.recipe.service.QaReplyService;

@Controller
@RequestMapping("/qaBoard/*")
public class qaBoardController {

	@Inject
	QaBoardService service;
	
	@Inject
	private QaReplyService replyService;
	
	//QA 목록
	@RequestMapping(value="/qaList", method=RequestMethod.GET)
	public void getQaList(Model model, @RequestParam("num") int num, 
			@RequestParam(value="qa_searchType", required = false, defaultValue="qa_title") String qa_searchType, 
			@RequestParam(value="qa_keyword", required = false, defaultValue="") String qa_keyword
			) throws Exception {
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.qaCount());
		
		page.setSearchType(qa_searchType);
		page.setKeyword(qa_keyword);
		
		List<QaVO> qalist = null;
		qalist = service.qaList(page.getDisplayPost(), page.getPostNum(), qa_searchType, qa_keyword);
		
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
	
	//QA 작성
	@RequestMapping(value="/qaWrite", method=RequestMethod.GET)
	public void getWrite() throws Exception{
		
	}
	
	//QA 작성
	@RequestMapping(value="/qaWrite", method=RequestMethod.POST)
	public String getQaWrite(QaVO vo, MultipartFile[] files) throws Exception{

		String uploadFolder = "C:\\cbnu2022\\220707spring_study\\Recipe_Board\\src\\main\\webapp\\resources\\imgUpload\\qa";
		
		for(MultipartFile file : files) {
			System.out.println("name : " + file.getOriginalFilename());
			System.out.println("size : " + file.getSize());
			
			File saveFile = new File(uploadFolder, file.getOriginalFilename());
			
			try {
				file.transferTo(saveFile);
				vo.setQaImg(file.getOriginalFilename());
			}catch(IllegalStateException e) {
				e.getMessage();
			}catch(IOException e) {
				e.getMessage();
			}
		}
		
		service.qaWrite(vo);
		
		return "redirect:/qaBoard/qaList?num=1";
	}
	
	//QA 조회
	@RequestMapping(value="/qaView", method=RequestMethod.GET)
	public void getQaView(@RequestParam("qa_no") int qa_no, Model model) throws Exception{
		
		QaVO vo = service.qaView(qa_no);
		
		model.addAttribute("qaView", vo);
		
		//QA 댓글 조회
		List<QaReplyVO> reply = null;
		reply = replyService.qaReplyList(qa_no);
		model.addAttribute("qaReply", reply);
	}
	
	//QA 수정
	@RequestMapping(value="/qaModify", method=RequestMethod.GET)
	public void getQaModify(@RequestParam("qa_no") int qa_no, Model model) throws Exception{
		QaVO vo = service.qaView(qa_no);
		
		model.addAttribute("qaView", vo);
	}
	
	//QA 수정
	@RequestMapping(value="/qaModify", method=RequestMethod.POST)
	public String postQaModify(QaVO vo) throws Exception{
		service.qaModify(vo);
		
		return "redirect:/qaBoard/qaView?qa_no=" + vo.getQa_no();
	}
	
	//QA 삭제
	@RequestMapping(value="/qaDelete", method=RequestMethod.GET)
	public String getDelete(@RequestParam("qa_no") int qa_no) throws Exception {
		service.qaDelete(qa_no);
		
		return "redirect:/qaBoard/qaList?num=1";
	}
	
}
