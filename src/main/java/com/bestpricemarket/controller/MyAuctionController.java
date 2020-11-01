package com.bestpricemarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyAuctionController {

	// http://localhost:8088/myAuction
	@RequestMapping(value = "/myAuction", method = RequestMethod.GET)
	public String myAuctionGET() throws Exception{
		
		return "/goods/myAuction";
	}
}
