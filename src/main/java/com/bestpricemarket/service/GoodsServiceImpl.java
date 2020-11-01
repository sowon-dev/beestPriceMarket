package com.bestpricemarket.service;

import java.io.File;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.ReportVO;
import com.bestpricemarket.persistence.GoodsDAO;
import com.bestpricemarket.utils.FileUtils;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	
	// DAO 의존 주입
	@Inject
	private GoodsDAO gdao;	
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	// 상품등록
	@Override
	public void goodsRegister(GoodsVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		
		System.out.println("S : 상품 목록");
		 gdao.registerGoods(vo);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			gdao.insertFile(list.get(i)); 
		}
		
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int gno) throws Exception {

		System.out.println("S : 첨부파일 조회");
		
		return gdao.selectFileList(gno);
	}
	

	
	// 상품목록
	@Override
	public List<GoodsVO> goodsList() throws Exception {

		System.out.println("S : 상품목록");
		return gdao.listGoods();
	}
		
	// 상품조회(상품상세페이지)
	@Override
	public GoodsVO goodsDetail(int gno) throws Exception {
		// TODO Auto-generated method stub
		
		GoodsVO vo = gdao.goodsDetail(gno);
		
		
		return vo;
	}
	
	// 상품수정
	@Override
	public void goodsModify(GoodsVO vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		System.out.println("S : 상품 수정");
		gdao.goodsModify(vo);
		
		System.out.println("S : 수정된 상품 정보 -> "+ vo);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(vo, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				gdao.insertFile(tempMap);
			}else {
				gdao.updateFile(tempMap);
			}
		}
		
	}
		
	// 상품삭제
	@Override
	public void goodsDelete(int gno) throws Exception {
		System.out.println("S : 상품 삭제"); 
		gdao.goodsDelete(gno);
	}

	
	
	
	
	
	// 상품신고 *******************************************************************************************************************************
	/* 태준 */
	// 상품신고
	@Override
	public ReportVO showReportDetail(HttpSession session, int gno) throws Exception {
		ReportVO vo = gdao.showReportDetail(session, gno);
		return vo;
	}

	// 이메일보내기
	@Override
	public void sendReportEmail(ReportVO vo) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "bestpricemarketnoreply@gmail.com";
		String hostSMTPpwd = "bestpricemarket123!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "bestpricemarketnoreply@gmail.com";
		String fromName = "(주)베프마켓";
		String subject = "";
		String msg = "";
		
		subject = "베프마켓 신고 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += vo.getReporter() + "님의 신고 내용 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>신고물품이름 : ";
		msg += vo.getGname() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</p>";
		msg += "<p>신고물품번호 : ";
		msg += vo.getGno() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</p>";
		msg += "<p>판매자 : ";
		msg += vo.getG_m_id() + "</p></div>";
		
		// 받는 사람 E-Mail 주소
		String mail = vo.getReporterEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	/* 태준 */
	// 상품신고 *******************************************************************************************************************************
	
}