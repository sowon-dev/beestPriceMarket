package com.bestpricemarket.controller;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.ReportVO;
import com.bestpricemarket.service.GoodsService;

@Controller
@RequestMapping(value = "/goods/*")
public class GoodsController {
	
	private static final Logger log = LoggerFactory.getLogger(GoodsController.class);
	
	// 서비스 의존 주입 
	@Inject
	private GoodsService service;
	
	// 파일 업로드 소스 
	/*
	 * @Resource(name = "uploadPath") private String uploadPath;
	 */
	
	
	// 상품 CURD *******************************************************************************************************************************
	
	// 상품등록
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String goodsRegisterGET(Model model) throws Exception{
		
		log.info("C : goodsRegister.jsp 이동");

		System.out.println("@@@@@@@ 상품등록 페이지 이동");

		model.addAttribute("text", "text");
		return "/goods/goodsRegister";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String goodsRegisterPOST(GoodsVO vo, MultipartHttpServletRequest mpRequest) throws Exception{
		
		System.out.println("C : 뷰페이지에서 전달되는 파라미터 -> "+ vo);
		service.goodsRegister(vo, mpRequest);
		
		System.out.println("C : 상품등록 완료@@@@");
		
		return "redirect:/goods/list";
	}
	
	

	// 상품목록
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String goodsListGET(Model model) throws Exception{
		
		System.out.println("C : goodsList.jsp 이동");
		
		List<GoodsVO> goodsList = service.goodsList();
		
		model.addAttribute("goodsList",service.goodsList());
		
		return "/goods/goodsList";
	}
	
	
	
	// 상품 상세페이지 
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public String goodsDetailGET(@RequestParam("gno") int gno, Model model, HttpSession session) throws Exception{
		System.out.println("C : goodsDetail.jsp 이동");
		
		model.addAttribute("goods", service.goodsDetail(gno));
		session.setAttribute("id", "user1");
		
		List<Map<String, Object>> fileList = service.selectFileList(gno);
		model.addAttribute("file", fileList);
		
		return "/goods/goodsDetail";
	}
	
	
	// 상품수정
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public String goodsModifyGET(@RequestParam("gno") int gno,Model model) throws Exception{
		
		System.out.println("C : goodsModify.jsp 이동(GET)");
		
		GoodsVO goodsVO = service.goodsDetail(gno);
		model.addAttribute("goodsVO", goodsVO);
		
		List<Map<String, Object>> fileList = service.selectFileList(goodsVO.getGno());
		model.addAttribute("file", fileList);
		
		return "/goods/goodsModify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String goodsModifyPOST(GoodsVO vo, @RequestParam(value="fileNoDel[]") String[] files,
			 @RequestParam(value="fileNameDel[]") String[] fileNames,
			 MultipartHttpServletRequest mpRequest) throws Exception {
			System.out.println("C : 상품 수정 POST");
	 
			service.goodsModify(vo, files, fileNames, mpRequest);
			
			System.out.println("C : 수정된 정보 -> " + vo);
	 
			return "redirect:/goods/list";
	}
	
	
	// 상품삭제
	@RequestMapping(value = "/delete",method = {RequestMethod.GET,RequestMethod.POST})
	public String goodsDeletePOST(@RequestParam("gno") int gno) throws Exception{
		
		System.out.println("C : 상품 삭제 POST");
		
		service.goodsDelete(gno);
		
		return "redirect:/goods/list";
	}
	
	// 상품 CURD *******************************************************************************************************************************
	
	
	
	
	
	// 내경매 *******************************************************************************************************************************
	// 내경매
	@RequestMapping(value = "/myauction", method = RequestMethod.GET)
	public String myAuctionGET() throws Exception{
	      
	      return "/goods/myAuction";
	   }
	
	
	// 내경매 *******************************************************************************************************************************
	
	
	
	
	// 상품신고 *******************************************************************************************************************************
	/*태준*/
	// 상품신고
	// http://localhost:8088/goods/report?gno=1
	@RequestMapping(value="/report",method = RequestMethod.GET)
	public void reportGET(HttpSession session, @RequestParam("gno") int bno, Model model) throws Exception{
	//public void reportGET( @RequestParam("session") String session, @RequestParam("gno") int bno, Model model) throws Exception{
		log.info("C : /report -> report.jsp ");
		log.info("C : reportGET() 호출 ");
		session.setAttribute("id", "user1");
		model.addAttribute("reportVO", service.showReportDetail(session, bno));
	}
	
	
	
	
	@RequestMapping(value="/report",method = RequestMethod.POST) 
	public String reportGET(HttpSession session, ReportVO vo) throws Exception{
		service.sendReportEmail(vo); 
	  
		return "/goods/goodsDetail"; 
	}
	/*태준 끝*/
	// 상품신고 *******************************************************************************************************************************



}
	
	


