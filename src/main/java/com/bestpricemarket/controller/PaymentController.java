package com.bestpricemarket.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.domain.ParamVO;
import com.bestpricemarket.service.PaymentService;

@Controller
@RequestMapping(value = "/pay/*")
public class PaymentController {

	@Inject
	private PaymentService service;

	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);

	// http://localhost:8088/pay/payment
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String detailPayment(Model model) throws Exception {
		String id = "admin";
		MemberVO vo = service.getMember(id);
		logger.info("객체 : " + vo);
		model.addAttribute("memVO", vo);
		model.addAttribute("gvo", service.getGoods(1));

		return "/pay/detailPayment";
	}

	
	  @RequestMapping(value = "/payment",method = RequestMethod.POST) 
	  public String kakao(HttpServletRequest req,/*RedirectAttributes rttr*/Model model,ParamVO pvo) throws Exception {
	  // 결제정보 처리 페이지(정보처리) 
	  String username = req.getParameter("username"); 
	  String id = req.getParameter("id"); 
	  String phone = req.getParameter("phone"); 
	  String addr1 = req.getParameter("addr1"); 
	  String addr2 = req.getParameter("addr2");
	  String gname = req.getParameter("gname"); 
	  int gno = Integer.parseInt(req.getParameter("gno")); 
	  int lowestprice = Integer.parseInt(req.getParameter("lowestprice"));
	  pvo.setUsername(username); 
	  pvo.setId(id); 
	  pvo.setPhone(phone);
	  pvo.setAddr1(addr1); 
	  pvo.setAddr2(addr2); 
	  pvo.setGname(gname);
	  pvo.setGno(gno); 
	  pvo.setLowestprice(lowestprice);
	  
	  model.addAttribute("pvo",pvo);
	  System.out.println("객체 : " + pvo); 
	  return "/pay/kakao"; 
	  }
	 

	// http://localhost:8088/pay/order
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	@ResponseBody
	public String orderCompleted(@RequestBody Map<String,Object> kakaoPayInfo) throws Exception {
		logger.info(kakaoPayInfo.toString());
		return "/pay/orderCompleted";
	}
}