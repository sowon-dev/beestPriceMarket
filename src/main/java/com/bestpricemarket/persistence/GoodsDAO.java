package com.bestpricemarket.persistence;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.LikesVO;
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
	
	// 첨부파일 수정//
	public void updateFile(Map<String, Object> map) throws Exception;
	
	
	
	
	// 상품신고 *******************************************************************************************************************************
	/* 태준 */
	// 상품신고
	public ReportVO showReportDetail(HttpSession session, int gno) throws Exception;
	/* 태준 */
	// 상품신고 *******************************************************************************************************************************
	
	
	// 좋아요 *******************************************************************************************************************************
    /* 정현 */
	
	// 좋아요 입력 -> 제품상세페이지
	public int like(int gno) throws Exception; 
	
	
	
	/* 상품의 좋아요 번호가 있는지 카운트 */
//	  public int countbyLike(int lno);
	  
	  /* 좋아요 번호 등록 */
//	  public int create(HashMap hashmap);
	  
	  /**
	   * 좋아요 체크 여부 (0 -> 1)
	   * @param hashMap
	   * @return
	   */
//	  public int like_check();
	  
	  /**
	   * 좋아요 체크 여부 (1 -> 0)
	   * @param hashMap
	   * @return
	   */
//	  public int like_check_cancel();
	  
	  /* 조회 */
//	  public LikesVO read(LikesVO vo);
	  
	  /* 상품의 좋아요 삭제 */
//	  public int deletebyGno(int gno);
	  
	  /* 회원의 좋아요 삭제 */
//	  public int deletebyL_m_id(String l_m_id);
	  

	

}