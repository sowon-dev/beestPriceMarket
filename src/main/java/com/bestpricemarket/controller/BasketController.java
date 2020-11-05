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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bestpricemarket.domain.BasketPager;
import com.bestpricemarket.domain.BasketVO;
import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.service.BasketService;
import com.bestpricemarket.service.MemberService;

@Controller
@RequestMapping(value ="/basket/*")
public class BasketController {

	@Inject
	private BasketService service;
	

	
	private static final Logger l = LoggerFactory.getLogger(BasketController.class);
	
	
	 @RequestMapping(value="/insert") 
	 public String insert(@ModelAttribute BasketVO bv, HttpSession session){ 
		 l.info("C: vo 확인"+bv);
	  
	 
	 return "/basket/basket"; }
	 
	
	
	
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public  String listGET(HttpSession session,Model model) throws Exception{
    	String id = (String)session.getAttribute("id");
    	
    	if(id == null) {
    		
    		return "/member/loginandjoin";
    	}
    	
    	List<BasketVO> basketlist = null;
    	basketlist = service.Basketlist();
    	
    	return"/basket/basket";
    } 
    
    

    
    @RequestMapping(value="/delete", method=RequestMethod.POST)
    public String deletePOST(@RequestParam(value="lno")Integer lno,HttpSession session) throws Exception{
    	
    	System.out.println("lno :"+lno);
    	service.deleteBasket(lno);
		
    	
    	System.out.println("C: 삭제 성공");
    	
    	return "redirect:/basket/listPage";
    
    }

	
	  @RequestMapping(value="/listPage", method = RequestMethod.GET) 
	  public String getListPage(Model model, @RequestParam(value="num",defaultValue="1") int num) throws Exception{ 
		// 게시물 목록 + 페이징 추가
		 BasketPager page = new BasketPager();
		 
		 
		 
		 page.setNum(num);
		 page.setCount(service.getCount());  
		
		 List<BasketVO> basketlist = null; 
		 basketlist = service.listPage(page.getDisplayPost(), page.getPostNum());
		 System.out.println("basketlist"+basketlist);
		 model.addAttribute("basketlist", basketlist);   
		 model.addAttribute("pageNum", page.getPageNum());

		 model.addAttribute("startPageNum", page.getStartPageNum());
		 model.addAttribute("endPageNum", page.getEndPageNum());
		  
		 model.addAttribute("prev", page.getPrev());
		 model.addAttribute("next", page.getNext());  
		 
		 
		 
		 model.addAttribute("page", page);
		 model.addAttribute("select", num);
	  
			 return "/basket/listPage"; 
	  }
	  

}
	 


