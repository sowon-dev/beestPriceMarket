package com.bestpricemarket.service;

import java.util.List;

import com.bestpricemarket.domain.GoodsCommentVO;

public interface GoodsCommentService {
	
	// 댓글 목록
	public List<GoodsCommentVO> commentList(Integer gno) throws Exception;
	
	// 댓글 목록 each
	public GoodsCommentVO commentListEach(Integer gno) throws Exception;
	
	//AI제약조건 있는 c_num가져오기
	public int getCnum() throws Exception;
	
	// 댓글 개수 
	// public int count(int c_num);  
	
	// 댓글 작성
	public void commentInsert(GoodsCommentVO cmt) throws Exception;
	
	// 댓글 수정
	// public void commentUpdate(GoodsCommentVO cmt);
	
	// 댓글 삭제
	// public void commentDelete(int c_num);

}