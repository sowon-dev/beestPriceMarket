package com.bestpricemarket.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bestpricemarket.domain.BasketVO;
import com.bestpricemarket.service.BasketService;
import com.bestpricemarket.service.MemberService;

@Controller
@RequestMapping(value ="/basket/*")
public class BasketController {

	@Inject
	private BasketService service;
	
	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String basketGET(BasketVO bv) throws Exception {
		l.info("/basket -> basket.jsp이동");
		return "basket/basket";
	}
    @RequestMapping(value="/basket", method= RequestMethod.POST)
	public String basketPOST(BasketVO bv,HttpSession session) throws Exception{
	   String l_m_id = (String) session.getAttribute("l_m_id"); 	
       bv.setL_m_id(l_m_id);
	   
	   
	   service.insert(bv);
    	
    	return "redirect:/basket/basket";
	}
    
   
    

}
