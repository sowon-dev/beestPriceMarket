package com.bestpricemarket.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bestpricemarket.domain.CSVO;
import com.bestpricemarket.service.CSService;



@Controller
@RequestMapping(value = "/CS/*")
public class CSController {

	// 서비스 처리 객체를 주입(DI)
		@Inject
		private CSService service;
		
		private static final Logger logger =
				LoggerFactory.getLogger(CSController.class);
		
		
		@RequestMapping(value = "/list",method = RequestMethod.GET)
		public String listPOST()throws Exception{
			logger.info("C : customer_list로 가자~");
			
			
			
			return "/CS/customer_list";
		}
		
		@RequestMapping(value = "/form",method = RequestMethod.GET)
		public String askPOST()throws Exception{
			logger.info("C : askForm 호출 완료!");
			
			
			
			return "/CS/askForm";
		}
		
	
}
