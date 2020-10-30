package com.bestpricemarket.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartRequest;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.service.GoodsService;
import com.bestpricemarket.utils.FileUtils;

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
		
		
		
		// 파일 업로드 - 방법1
		/*
		 * String imgUploadPath = uploadPath + File.separator + "imgUpload"; String
		 * ymdPath = UploadFileUtils.calcPath(imgUploadPath); String fileName = null;
		 * 
		 * if(file != null) { fileName = UploadFileUtils.fileUpload(imgUploadPath,
		 * file.getOriginalFilename(), file.getBytes(), ymdPath); } else { fileName =
		 * uploadPath + File.separator + "images" + File.separator + "none.png"; }
		 * 
		 * vo.setImage(File.separator + "imgUpload" + ymdPath + File.separator +
		 * fileName); vo.setImgThumb(File.separator + "imgUpload" + ymdPath +
		 * File.separator + "s" + File.separator + "s_" + fileName);
		 */
		// 파일 업로드 - 방법1
		
		// 파일 업로드 - 방법2
		
		// 파일 업로드 - 방법2
		
		
		
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
	public String goodsDetailGET(@RequestParam("gno") int gno, Model model) throws Exception{
		System.out.println("C : goodsDetail.jsp 이동");
		
		 
		
		model.addAttribute("goods", service.goodsDetail(gno));
		
		List<Map<String, Object>> fileList = service.selectFileList(gno);
		model.addAttribute("file", fileList);
		
		return "/goods/goodsDetail";
	}
	
	
	// 상품수정
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public String goodsModifyGET(@RequestParam("gno") int gno,Model model) throws Exception{
		
		System.out.println("C : goodsModify.jsp 이동");
		
		//GoodsVO vo = service.goodsModify(gno);
		
		
		return "/goods/goodsModify";
		
		
	}
	
	
	// 상품삭제
	
	
	
	
	//*******************************************************************************************************************************
	// 내경매
	@RequestMapping(value = "/myauction", method = RequestMethod.GET)
	public String myAuctionGET() throws Exception{
	      
	      return "/goods/myAuction";
	   }
	



}
	
	


