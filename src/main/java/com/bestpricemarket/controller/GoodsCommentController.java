package com.bestpricemarket.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bestpricemarket.domain.GoodsCommentVO;
import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.service.GoodsCommentService;

@Controller
@RequestMapping("/comment/*")
public class GoodsCommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsCommentController.class);
	
	@Inject
	private GoodsCommentService service;
	
	// 댓글 등록
	@RequestMapping(value = "/comment",method = RequestMethod.POST)
	public void goodsRegisterPOST(GoodsCommentVO cmt, HttpSession session) throws Exception{
		
		logger.info("C : goodsDetail.jsp 이동");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		cmt.setC_m_id(member.getId());
		
		service.commentInsert(cmt);
	}
	
	
	
	

}
