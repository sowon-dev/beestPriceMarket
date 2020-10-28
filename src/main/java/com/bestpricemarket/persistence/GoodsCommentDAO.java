package com.bestpricemarket.persistence;

import java.util.List;

import com.bestpricemarket.domain.GoodsCommentVO;

public interface GoodsCommentDAO {
	
	// 댓글 목록
     public List<GoodsCommentVO> commentList(int c_num);
     
    // 댓글 개수 
     public int count(int c_num);  
	
	// 댓글 작성
	 public void commentInsert(GoodsCommentVO cmt);

	// 댓글 수정
	 public void commentUpdate(GoodsCommentVO cmt);

	// 댓글 삭제
	 public void commentDelete(int c_num);

	
	

}
