package com.bestpricemarket.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.ReportVO;

public interface GoodsService {
	
	
	// 상품등록
	public void goodsRegister(GoodsVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 상품목록
	public List<GoodsVO> goodsList() throws Exception;
		
	// 상품조회(상품상세페이지)
	public GoodsVO goodsDetail(int gno) throws Exception;
		
	// 상품수정
	public void goodsModify(GoodsVO vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
		
	// 상품삭제
	public void goodsDelete(int gno) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int gno) throws Exception;
	
	
	
	
	// 상품신고 *******************************************************************************************************************************
	/* 태준 */
	// 상품신고
	public ReportVO showReportDetail(HttpSession session, int gno) throws Exception;
	
	// 이메일보내기(신고물품, 신고자, 판매자)
	public void sendReportEmail(ReportVO vo) throws Exception;
	/* 태준 */
	// 상품신고 *******************************************************************************************************************************
}