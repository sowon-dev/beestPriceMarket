package com.bestpricemarket.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.LikesVO;
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
	
	
	// 좋아요 ********************************************************************************************************************************
		/* 정현 */
		
		// 좋아요 입력 -> 제품상세페이지
		public int like(int gno) throws Exception;
		
		/* 상품의 좋아요 번호가 있는지 카운트 */
	//	  public int countbyLike(HashMap hashMap);
		  
		  /* 좋아요 번호 등록 */
	//	  public int create(HashMap hashMap);
		  
		  /**
		   * 좋아요 체크 여부 (0 -> 1)
		   * @param hashMap
		   * @return
		   */
	//	  public int like_check(HashMap hashMap);
		  
		  /**
		   * 좋아요 체크 여부 (1 -> 0)
		   * @param hashMap
		   * @return
		   */
	//	  public int like_check_cancel(HashMap hashMap);
		  
		  /* 조회 */
	//	  public LikesVO read(HashMap hashMap);
		  

		  /* 상품의 좋아요 삭제 */
	//	  public int deletebyGno(int boarGno);
		  
		  /* 회원의 좋아요 삭제 */
	//	  public int deletebyL_m_id(String l_m_id);
		
		
		  
		
		
		
		
		
		// 좋아요 ********************************************************************************************************************************
		
	
	
	
	
	
	
}