package com.bestpricemarket.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bestpricemarket.domain.GoodsCommentVO;
import com.bestpricemarket.domain.GoodsFileVO;
import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.service.GoodsCommentService;
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

		System.out.println("@@@@@@@ 상품등록 페이지 이동");

		return "/goods/goodsRegister";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String goodsRegisterPOST(GoodsVO vo, HttpSession session,
			MultipartHttpServletRequest mhsq) throws Exception{
		
		String id = (String) session.getAttribute("id");
		
		service.goodsRegister(vo);
		log.info("C : 상품 등록 정보 " +vo);
		System.out.println("C : 뷰페이지에서 전달되는 파라미터 -> "+ vo);
		
		
		  String realFolder = "d:/upload2/"; File dir = new File(realFolder); if(
		  !dir.isDirectory()) { dir.mkdir(); }
		  
		  // 넘어온 파일을 리스트로 저장 
		  List<MultipartFile> mf = mhsq.getFiles("uploadFile");
		  if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
		  
		  }else { 
			  for(int i=0; i<mf.size(); i++) { 
				  // 파일 중복명 처리 
				  String getId = UUID.randomUUID().toString(); 
				  // 본래 파일명 
				  String originalfileName = mf.get(i).getOriginalFilename(); 
				  // 저장되는 파일 이름  
				  //String saveFileName = getId+ "." + getExtension(originalfileName); 
				  String saveFileName = getId + "." +FilenameUtils.getExtension(originalfileName);
		  
		  
				  String savePath = realFolder + saveFileName; // 저장 될 파일 경로
		  
				  long fileSize = mf.get(i).getSize(); // 파일 사이즈
		  
				  mf.get(i).transferTo(new File(savePath)); // 파일 저장
		  
				  service.fileUpload(originalfileName, saveFileName, fileSize);
		  
		  } }
		 
		  log.info("C : 상품등록완료!");
		  System.out.println("C : 상품등록 완료@@@@");
		
		return "redirect:/goods/list";
	}
	
	
	

	// 상품목록
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String goodsListGET(Model model) throws Exception{
		
		log.info("goodsList.jsp 이동");
		
		List<GoodsVO> goodsList = service.goodsList();
		
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
