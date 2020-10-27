package com.bestpricemarket.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bestpricemarket.service.MemberService;

@Controller
@RequestMapping(value = "/basket/*")
public class BasketController {

	@Inject
	//@Autowired
	private MemberService service;
	
	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String insertGET() throws Exception {
		
		return "/basket/basket";
	}
}
