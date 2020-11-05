package com.bestpricemarket.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.service.MemberService;

@Controller
public class HomeController {
	@Inject
	//@Autowired
	private MemberService service;
	
	private static final Logger l = LoggerFactory.getLogger(HomeController.class);	

	// http://localhost:8088/main
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(HttpSession session, Model model) {
		if(session != null) {
		MemberVO vo = service.readMember((String)session.getAttribute("id"));
		model.addAttribute("memVO", vo);
		}
	}
	
}
