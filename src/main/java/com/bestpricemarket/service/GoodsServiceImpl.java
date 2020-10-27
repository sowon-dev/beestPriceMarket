package com.bestpricemarket.service;

import java.util.List;


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
	  public void goodsRegister(GoodsVO vo) throws Exception {
	       gdao.registerGoods(vo); 
	       System.out.println("S : 상품등록"+vo); 
	  }
	 
	
	// 상품목록
	//@Override
	//public List<GoodsVO> goodsList() throws Exception {

		//System.out.println("S : 상품목록");
		//return gdao.listGoods();
	//}
		
	// 상품조회(상품상세페이지)
	//@Override
	//public GoodsVO goodsDetail(int gno) throws Exception {
		//System.out.println("S : 상품조회");
		//sreturn gdao.goodsDetail(gno);
	}
		
	// 상품수정
		
	// 상품삭제

//}
