package com.bestpricemarket.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.ReportVO;

public interface GoodsDAO {
	
	// 상품등록
	public void registerGoods(GoodsVO vo) throws Exception; 
	
	// 상품목록
	public List<GoodsVO> listGoods() throws Exception;
		
	// 상품조회(상품상세페이지)
	public GoodsVO goodsDetail(int gno) throws Exception;
		
	// 상품수정
	public void goodsModify(GoodsVO vo) throws Exception;
		
	// 상품삭제
	public void goodsDelete(int gno) throws Exception;
	
	// 첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
		
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int gno) throws Exception; 
	
	// 첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
	
	
	
	
	// 상품신고 *******************************************************************************************************************************
	/* 태준 */
	// 상품신고
	public ReportVO showReportDetail(HttpSession session, int gno) throws Exception;
	/* 태준 */
	// 상품신고 *******************************************************************************************************************************
	
	
	
	

}
