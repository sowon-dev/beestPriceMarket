package com.bestpricemarket.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bestpricemarket.domain.Criteria;
import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.domain.PageMaker;
import com.bestpricemarket.service.GoodsService;
import com.bestpricemarket.service.MemberService;

@Controller
public class HomeController {
	// 서비스 의존 주입
	@Inject
	private MemberService service;
	@Inject
	private GoodsService gservice;
	
	private static final Logger l = LoggerFactory.getLogger(HomeController.class);	

	// http://localhost:8088/main
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(HttpSession session, Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
		//id 환영멘트
		if(session != null) {
			MemberVO vo = service.readMember((String)session.getAttribute("id"));
			model.addAttribute("memVO", vo);
		}
		
		// 페이징 처리된 전체목록
		model.addAttribute("goodsList", gservice.goodsList(cri));
		
		// 하단부 페이징처리
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(gservice.listTotalCount());
		model.addAttribute("pm",pm);		
	}
	
	//favicon
	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)
	public void favicon( HttpServletRequest request, HttpServletResponse reponse ) {
		try {
		  reponse.sendRedirect("/resources/favicon.ico");
		} catch (IOException e) {
		  e.printStackTrace();
		}
	}
	
}
