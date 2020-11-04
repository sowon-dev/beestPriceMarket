package com.bestpricemarket.controller;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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


	// 상품 CURD
	// *******************************************************************************************************************************

	// 상품등록

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String goodsRegisterGET(Model model, HttpSession session) throws Exception {


		System.out.println("@@@@@@@ 상품등록 페이지 이동");

		// id 세션값
		model.addAttribute("id", (String) session.getAttribute("id"));

		return "/goods/goodsRegister";
	}


	
 @RequestMapping(value = "/register",method = RequestMethod.POST)
	public String goodsRegisterPOST(GoodsVO vo, MultipartHttpServletRequest mpRequest) throws Exception{
		
		System.out.println("C : 뷰페이지에서 전달되는 파라미터 -> "+ vo);
		
		// 상품 등록 서비스 
		service.goodsRegister(vo, mpRequest);

		System.out.println("C : 상품등록 완료@@@@");

		return "redirect:/goods/list";
	}

	// 상품목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goodsListGET(Model model) throws Exception {

		System.out.println("C : goodsList.jsp 이동");

		List<GoodsVO> goodsList = service.goodsList();

		model.addAttribute("goodsList", service.goodsList());

		return "/goods/goodsList";
	}

	// 상품 상세페이지
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String goodsDetailGET(@RequestParam("gno") int gno, Model model, HttpSession session) throws Exception {
		System.out.println("C : goodsDetail.jsp 이동");

		model.addAttribute("goods", service.goodsDetail(gno));
		model.addAttribute("id", (String) session.getAttribute("id"));

		List<Map<String, Object>> fileList = service.selectFileList(gno);
		model.addAttribute("file", fileList);

		return "/goods/goodsDetail";
	}

	// 상품수정
	@RequestMapping(value = "/modify",method = RequestMethod.GET)
	public String goodsModifyGET(@RequestParam("gno") int gno,Model model,HttpSession session) throws Exception{
		
		System.out.println("C : goodsModify.jsp 이동(GET)");
		
		// 아이디 세션값 
		model.addAttribute("id", (String)session.getAttribute("id"));
		
		GoodsVO goodsVO = service.goodsDetail(gno);
		model.addAttribute("goodsVO", goodsVO);

		// 이미지 업로드 수정
		List<Map<String, Object>> fileList = service.selectFileList(goodsVO.getGno());
		model.addAttribute("file", fileList);

		return "/goods/goodsModify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String goodsModifyPOST(GoodsVO vo, @RequestParam(value = "fileNoDel[]") String[] files,
			@RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest)
			throws Exception {
		System.out.println("C : 상품 수정 POST");

		service.goodsModify(vo, files, fileNames, mpRequest);

		System.out.println("C : 수정된 정보 -> " + vo);

		return "redirect:/goods/list";
	}

	// 상품삭제
	@RequestMapping(value = "/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String goodsDeletePOST(@RequestParam("gno") int gno) throws Exception {

		System.out.println("C : 상품 삭제 POST");

		service.goodsDelete(gno);

		return "redirect:/goods/list";
	}
	


	 // ck에디터 이미지 업로드
	
	  @RequestMapping(value="/ckUpload", method = RequestMethod.POST) 
	  public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			  		MultipartHttpServletRequest multiFile , @RequestParam MultipartFile upload)  throws Exception{ 
		  
		  // 랜덤 문자 생성 
		  UUID uid = UUID.randomUUID();
	  
		  OutputStream out = null; 
		  PrintWriter printWriter = null;
	  
		  //인코딩 response.setCharacterEncoding("utf-8");
		  response.setContentType("text/html;charset=utf-8");
	  
		  try{
	  
			  //파일 이름 가져오기 
			  String fileName = upload.getOriginalFilename(); 
			  byte[] bytes = upload.getBytes();
	  
			  //이미지 경로 생성 
			  String path = "C:\\mp\\file\\";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다. 
			  String ckUploadPath = path + uid + "_" + fileName; 
			  File folder = new File(path);
	  
			  //해당 디렉토리 확인 
			  if(!folder.exists()){ 
				  try{ folder.mkdirs(); // 폴더 생성
				  }catch(Exception e){ 
					  e.getStackTrace(); 
				  } 
			  }
	  
	  out = new FileOutputStream(new File(ckUploadPath)); 
	  out.write(bytes);
	  out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
	  
	  String callback = request.getParameter("CKEditorFuncNum"); 
	  printWriter = response.getWriter(); 
	  String fileUrl = "ckImgSubmit?uid=" + uid +"&fileName=" + fileName; // 작성화면
	  
	  // 업로드시 메시지 출력 
	  printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	  printWriter.flush();
	  
	  }catch(IOException e){ 
		  e.printStackTrace(); 
	  } finally { 
		  try { 
			  if(out != null){ 
				  out.close(); 
			} if(printWriter != null) { 
				printWriter.close(); 
		 } 
	}catch(IOException e) { 
		e.printStackTrace(); 
		} 
	}
	  
	  return; 
	 }
	  
			  
			  @RequestMapping(value="/ckImgSubmit") 
			  public void ckSubmit(@RequestParam(value="uid") String uid, @RequestParam(value="fileName") String fileName , HttpServletRequest
					  request, HttpServletResponse response) throws ServletException, IOException{
			  
			  //서버에 저장된 이미지 경로 
				  String path = "C:\\mp\\file\\"; 
				 // String path ="C:\\mp\\file\\" + "ckImage/";
			  
			  String sDirPath = path + uid + "_" + fileName;
			  
			  File imgFile = new File(sDirPath);
			  
			  //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다. 
			  if(imgFile.isFile()){ 
				  byte[] buf = new byte[1024]; 
				  int readByte = 0; 
				  int length = 0; 
				  byte[] imgBuf = null;
			  
			  FileInputStream fileInputStream = null;
			  ByteArrayOutputStream outputStream = null; 
			  ServletOutputStream out = null;
			  
			  try{ 
				  fileInputStream = new FileInputStream(imgFile); 
				  outputStream = new ByteArrayOutputStream(); out = response.getOutputStream();
			  
			  while((readByte = fileInputStream.read(buf)) != -1){ 
				  outputStream.write(buf,0, readByte); 
				}
			  
			  imgBuf = outputStream.toByteArray(); 
			  length = imgBuf.length;
			  out.write(imgBuf, 0, length); 
			  out.flush();
			  
			  }catch(IOException e){ 
				  System.out.println(e); 
				  } 
			  } 
			} 
			  
	// ck 이미지 업로드
	
	// 상품 CURD
	// *******************************************************************************************************************************

	// 내경매
	// *******************************************************************************************************************************
	// 내경매
	@RequestMapping(value = "/myauction", method = RequestMethod.GET)
	public String myAuctionGET() throws Exception {

		return "/goods/myAuction";
	}

	// 내경매
	// *******************************************************************************************************************************

	// 상품신고
	// *******************************************************************************************************************************
	/* 태준 */
	// 상품신고
	// http://localhost:8088/goods/report?gno=1
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public void reportGET(HttpSession session, @RequestParam("gno") int bno, Model model) throws Exception {
		// public void reportGET( @RequestParam("session") String session,
		// @RequestParam("gno") int bno, Model model) throws Exception{
		log.info("C : /report -> report.jsp ");
		log.info("C : reportGET() 호출 ");
		session.setAttribute("id", "user1");
		model.addAttribute("reportVO", service.showReportDetail(session, bno));
	}

	@RequestMapping(value = "/report", method = RequestMethod.POST)
	public String reportGET(HttpSession session, ReportVO vo) throws Exception {
		service.sendReportEmail(vo);

		return "/goods/goodsDetail";
	}
	/* 태준 끝 */
	// 상품신고
	// *******************************************************************************************************************************

}