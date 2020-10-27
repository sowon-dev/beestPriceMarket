package com.bestpricemarket.persistence;

import java.util.List;

import com.bestpricemarket.domain.GoodsCommentVO;

public interface GoodsCommentDAO {
	
	
	// 댓글 작성
	 public void commentInsert(GoodsCommentVO cmt) throws Exception;

	// 댓글 수정
//	 public int commentUpdate(GoodsCommentVO cmt) throws Exception;

	// 댓글 삭제
//	 public int commentDelete(int c_num) throws Exception;

	
	// 댓글 목록
//	public List<GoodsCommentVO> commentList() throws Exception;

}
