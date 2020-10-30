package com.bestpricemarket.service;


import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bestpricemarket.domain.GoodsVO;

public interface GoodsService {
	
	
	// 상품등록
	public void goodsRegister(GoodsVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 상품목록
	public List<GoodsVO> goodsList() throws Exception;
		
	// 상품조회(상품상세페이지)
	public GoodsVO goodsDetail(int gno) throws Exception;
		
	// 상품수정
		
	// 상품삭제
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int gno) throws Exception;

}
