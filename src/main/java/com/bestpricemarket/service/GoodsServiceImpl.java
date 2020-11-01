package com.bestpricemarket.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.persistence.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	
	// DAO 의존 주입
	@Inject
	private GoodsDAO gdao;	
	
	// 상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
			gdao.registerGoods(vo);
			System.out.println("S : 상품등록"+vo);
	}
	
	
	// 상품목록
		
	// 상품조회(상품상세페이지)
		
	// 상품수정
		
	// 상품삭제

}
