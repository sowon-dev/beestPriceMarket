package com.bestpricemarket.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bestpricemarket.domain.GoodsCommentVO;
import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.service.GoodsCommentService;
import com.bestpricemarket.service.GoodsService;

@RestController
//@Controller
@RequestMapping("/detail/comment/*")
public class GoodsCommentController {
	@Inject
	private GoodsService gService;
	@Inject
	private GoodsCommentService cmtService;
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	// 댓글 등록
	//http://localhost:8088/goods/detail?gno=1
    @RequestMapping(value = "/insert", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public int commentInsert(@ModelAttribute GoodsCommentVO cmt, RedirectAttributes rttr, HttpSession session) throws Exception {	
		System.out.println("C : commentInsert데이터"+cmt);
		
		cmtService.commentInsert(cmt);
		rttr.addFlashAttribute("result", cmt);
		System.out.println("C: AI제약조건있는 c_num찾기 "+cmtService.getCnum());
		return cmtService.getCnum();
	}	   
    
	//댓글 목록
    @ResponseBody
	@RequestMapping(value = "/commentListEach", method = {RequestMethod.GET, RequestMethod.POST})
	public GoodsCommentVO commentListGET(@RequestParam("c_num") int c_num, Model model) throws Exception{
		
		GoodsCommentVO vo = cmtService.commentListEach(c_num);
		model.addAttribute("commentListEach", vo);
		System.out.println("굿즈커맨트컨트롤러 목록에서 1개출력: "+ vo);
		return vo;
	}   

}