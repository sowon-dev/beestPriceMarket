package com.bestpricemarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bestpricemarket.domain.BasketVO;
import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.service.BasketService;
import com.bestpricemarket.service.MemberService;

@Controller
@RequestMapping(value ="/basket/*")
public class BasketController {

	@Inject
	private BasketService service;
	

	
	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	/*
	 * @RequestMapping(value="/basket") public String insert(@ModelAttribute
	 * BasketVO bv, HttpSession session){ l.info("C: vo 확인"+bv);
	 * 
	 * 
	 * return "/basket/basket"; }
	 */
	
	
	
    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public  String listGET(HttpSession session,Model model) throws Exception{
    	List<BasketVO> basketlist = service.Basketlist();
    	System.out.println("c: 리스트 확인"+basketlist);
    	
    	model.addAttribute("basketlist",basketlist);
    	
    	return"/basket/basket";
    } 
    
    

    
    @RequestMapping(value="/delete", method = RequestMethod.GET)
    public String deleteGET(HttpSession session,BasketVO bv) throws Exception{
    	
    	
    	service.deleteBasket(bv);
    	session.invalidate();
    	
    	System.out.println("C: 삭제 성공");
    	
    	return "/basket/basket";
    }
    

}
