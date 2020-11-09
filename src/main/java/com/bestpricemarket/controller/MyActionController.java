package com.bestpricemarket.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bestpricemarket.domain.BasketPager;
import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.domain.MyActionVO;

import com.bestpricemarket.service.MyActionService;

@Controller
@RequestMapping(value ="/myAction/*")
public class MyActionController {
	@Inject
	private MyActionService service;
	
	private static final Logger l = LoggerFactory.getLogger(MyActionController.class);

	// 입찰 목록
	@RequestMapping(value = "/actionlist", method = RequestMethod.GET)
	public String getOrderList(HttpSession session, MyActionVO action, Model model,@RequestParam(value="num",defaultValue="1") int num) throws Exception {
	 l.info("get order list");
	 BasketPager page = new BasketPager();	
	 String a_m_id = (String)session.getAttribute("id");
	 
	 page.setNum(num);
	 page.setCount(service.getCount());  
	
	 
	 
	 List<MyActionVO> actionlist = service.actionlist(page.getDisplayPost(), page.getPostNum(),a_m_id);
	 System.out.println("actionlist"+actionlist);
	 model.addAttribute("actionlist", actionlist);
	 
	 model.addAttribute("pageNum", page.getPageNum());

	 model.addAttribute("startPageNum", page.getStartPageNum());
	 model.addAttribute("endPageNum", page.getEndPageNum());
	  
	 model.addAttribute("prev", page.getPrev());
	 model.addAttribute("next", page.getNext());  
	 
	 model.addAttribute("page", page);
	 model.addAttribute("select", num);
	 return "/myAction/myAction";
	}

	@RequestMapping(value = "/paylist", method = RequestMethod.GET)
    public String getPaylist(HttpSession session, MyActionVO action, Model model,@RequestParam(value = "a_g_actionstatus",defaultValue = "1") Integer a_g_actionstatus, @RequestParam(value="num",defaultValue="1") int num) {
    	
    	try {
    		// 게시물 목록 + 페이징 추가
   		    BasketPager page = new BasketPager();
    		String a_m_id = (String)session.getAttribute("id");
    		
    		page.setNum(num);
   		    page.setCount(service.getCount()); 
    		
    		List<MyActionVO> paylist = service.paylist(page.getDisplayPost(), page.getPostNum(),a_m_id, a_g_actionstatus);
			System.out.println("paylist"+paylist);
			model.addAttribute("paylist",paylist);
    	  
			model.addAttribute("pageNum", page.getPageNum());

			model.addAttribute("startPageNum", page.getStartPageNum());
			model.addAttribute("endPageNum", page.getEndPageNum());
			  
			model.addAttribute("prev", page.getPrev());
			model.addAttribute("next", page.getNext());  
			 
			 
			 
			model.addAttribute("page", page);
			model.addAttribute("select", num);
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
    	return "/myAction/myAction2";
    }
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request) {
		
		String [] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0;i<size; i++) {
			service.delete(ajaxMsg[i]);
		}
		
		return "/MyAction/myAction2";
	}

}
