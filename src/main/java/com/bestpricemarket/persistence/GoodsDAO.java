package com.bestpricemarket.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bestpricemarket.domain.GoodsVO;

public interface GoodsDAO {
	
	// 상품등록
	public void registerGoods(GoodsVO vo) throws Exception; 
	
	// 첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int gno) throws Exception; 
	
	// 상품목록
	public List<GoodsVO> listGoods() throws Exception;
		
	// 상품조회(상품상세페이지)
	public GoodsVO goodsDetail(int gno) throws Exception;

		
	// 상품수정
		
	// 상품삭제

}
