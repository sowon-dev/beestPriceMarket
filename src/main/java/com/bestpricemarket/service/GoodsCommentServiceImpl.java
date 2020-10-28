package com.bestpricemarket.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bestpricemarket.domain.GoodsCommentVO;
import com.bestpricemarket.persistence.GoodsCommentDAO;


@Service
public class GoodsCommentServiceImpl implements GoodsCommentService {

	
	// DAO 의존 주입
	@Inject
	private GoodsCommentDAO gcdao;

	  
	//댓글 목록
    @Override
    public List<GoodsCommentVO> commentList(int c_num) {
        System.out.println(c_num);
        
        return gcdao.commentList(c_num);
        
    }
 
    //댓글의 갯수
    @Override
    public int count(int c_num) {
    	
        return 0;
    }
    

	// 댓글 작성
	@Override
	public void commentInsert(GoodsCommentVO cmt) {
		gcdao.commentInsert(cmt);
		System.out.println("DAO : 댓글 등록" + cmt);
		
		
		
	}

	
	//댓글의 수정
	@Override
	public void commentUpdate(GoodsCommentVO cmt) {
		gcdao.commentUpdate(cmt);
		
	}

	
	//댓글의 삭제
	@Override
	public void commentDelete(int c_num) {
		gcdao.commentDelete(c_num);
		
	}
	
	
	
	
	

}
