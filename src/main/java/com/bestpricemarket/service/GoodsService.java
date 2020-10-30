package com.bestpricemarket.service;


import java.util.List;

import com.bestpricemarket.domain.GoodsCommentVO;
import com.bestpricemarket.domain.GoodsFileVO;
import com.bestpricemarket.domain.GoodsVO;

public interface GoodsService {
	
	
	// 상품등록

	public void goodsRegister(GoodsVO vo) throws Exception;

	// 파일 업로드
	public void fileUpload(String orginalfileName, String saveFileName, long fileSize);
	
	
	// 상품목록
	public List<GoodsVO> goodsList() throws Exception;
		
	// 상품조회(상품상세페이지)
	public GoodsVO goodsDetail(int gno) throws Exception;
		
	// 상품수정
		
	// 상품삭제
	
	

}
