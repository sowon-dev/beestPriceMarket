package com.bestpricemarket.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bestpricemarket.domain.GoodsCommentVO;
import com.bestpricemarket.persistence.GoodsCommentDAO;


@Service
public class GoodsCommentServiceImpl implements GoodsCommentService {

	
	// DAO 의존 주입
	@Inject
	private GoodsCommentDAO gcdao;

	// 댓글 작성
	@Override
	public void commentInsert(GoodsCommentVO gcmt) throws Exception {
		gcdao.commentInsert(gcmt);
		System.out.println("S : 댓글 등록" + gcmt);
		
	}	
	
	
	
	

}
