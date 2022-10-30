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
import com.recipe.domain.ReviewBoardVO;
import com.recipe.domain.RvReplyVO;
import com.recipe.service.ReviewBoardService;
import com.recipe.service.RvReplyService;

@Controller
@RequestMapping("/reviewBoard/*")
public class ReviewBoardController {
	
	@Inject
	ReviewBoardService service;
	
	@Inject
	private RvReplyService replyService;

	//리뷰 목록
	@RequestMapping(value="/reviewList", method = RequestMethod.GET)
	public void getReviewList(Model model, @RequestParam("num") int num, 
			@RequestParam(value="reviewSearchType", required = false, defaultValue = "rv_title") String reviewSearchType, 
			@RequestParam(value="rv_keyword", required = false, defaultValue = "") String rv_keyword
			) throws Exception {
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.reviewCount());
		
		page.setSearchType(reviewSearchType);
		page.setKeyword(rv_keyword);
		
		List<ReviewBoardVO> reviewList = null;
		reviewList = service.reviewList(page.getDisplayPost(), page.getPostNum(), reviewSearchType, rv_keyword);
		
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
	
	//리뷰 작성
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET)
	public void getReviewWrite() throws Exception {
	   
	}
	
	//리뷰 작성
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String postReviewWrite(ReviewBoardVO vo, MultipartFile[] files) throws Exception {
		
		String uploadFolder = "C:\\cbnu2022\\220707spring_study\\Recipe_Board\\src\\main\\webapp\\resources\\imgUpload\\rv";
		
		for(MultipartFile file : files) {
			
			File saveFile = new File(uploadFolder, file.getOriginalFilename());
			
			try {
				file.transferTo(saveFile);
				vo.setRv_img(file.getOriginalFilename());
			}catch(IllegalStateException e) {
				e.getMessage();
			}catch(IOException e) {
				e.getMessage();
			}
		}
		
		service.reviewWrite(vo);
	  
		return "redirect:/reviewBoard/reviewList?num=1";
	}
	
	//리뷰 조회
	@RequestMapping(value="/reviewView", method = RequestMethod.GET)
	public void getReviewView(@RequestParam("rv_no") int rv_no, Model model) throws Exception{
		
		ReviewBoardVO vo = service.reviewView(rv_no);
		
		model.addAttribute("reviewView", vo);
		
		//요리후기 댓글 조회
		List<RvReplyVO> reply = null;
		reply = replyService.rvReplyList(rv_no);
		model.addAttribute("rvReply", reply);
	}
	
	//리뷰 수정
	@RequestMapping(value="/reviewModify", method = RequestMethod.GET)
	public void getReviewModify(@RequestParam("rv_no") int rv_no, Model model) throws Exception{
		ReviewBoardVO vo = service.reviewView(rv_no);
		
		model.addAttribute("reviewView", vo);
	}
	
	//리뷰 수정
	@RequestMapping(value="/reviewModify", method = RequestMethod.POST)
	public String postReviewModify(ReviewBoardVO vo) throws Exception{
		service.reviewModify(vo);
		
		return "redirect:/reviewBoard/reviewView?rv_no=" + vo.getRv_no();
	}
	
	//리뷰 삭제
	@RequestMapping(value="/reviewDelete", method=RequestMethod.GET)
	public String getReviewDelete(@RequestParam("rv_no") int rv_no) throws Exception{
		service.reviewDelete(rv_no);
		
		return "redirect:/reviewBoard/reviewList?num=1";
	}
	
	//리뷰 신고
	@RequestMapping(value="/alert", method=RequestMethod.GET)
	public String getAlert(@RequestParam("rv_no") int rv_no,
			@RequestParam("rv_warning") int rv_warning) throws Exception{
		
		service.alert(rv_no, rv_warning);
		
		return "redirect:/reviewBoard/reviewList?num=1";
	}

}
