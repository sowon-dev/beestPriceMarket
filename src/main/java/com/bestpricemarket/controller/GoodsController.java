package com.bestpricemarket.controller;

import java.util.List;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.service.GoodsService;

@Controller
@RequestMapping(value = "/goods/*")
public class GoodsController {
	
	private static final Logger log = LoggerFactory.getLogger(GoodsController.class);
	
	// 서비스 의존 주입 
	@Inject
	private GoodsService service;
	
	
	// 상품등록
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String goodsRegisterGET() throws Exception{
		
		log.info("C : goodsRegister.jsp 이동");
		
		return "/goods/goodsRegister";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String goodsRegisterPOST(GoodsVO vo) throws Exception{
		
		service.goodsRegister(vo);
		log.info("C : 상품 등록 정보 " +vo);
		log.info("C : 상품등록완료!");
		
		return "redirect:/goods/list";
	}
	
	
	// 상품목록
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String goodsListGET(Model model) throws Exception{
		
		log.info("goodsList.jsp 이동");
		
		//List<GoodsVO> goodsList = service.goodsList();
		
		model.addAttribute("goodsList",service.goodsList());
		
		return "/goods/goodsList";
	}
	
	
	// 상품조회(상품상세페이지)
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public String goodsDetailGET(@RequestParam("gno") int gno, Model model) throws Exception{
		log.info("goodsDetail.jsp 이동");
		
		GoodsVO goods = service.goodsDetail(gno);
		
		model.addAttribute("goods", goods);
		
		return "/goods/goodsDetail";
	}
	
	// 상품수정
	
	// 상품삭제
	
	
	

}
