package com.bestpricemarket.service;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.MemberVO;

public interface PaymentService {
	// id에 맞는 회원정보를 가져오는 메서드
	public MemberVO getMember(String id) throws Exception;
		
	// 해당 상품번호에 맞는 상품정보를 가져오는 메서드
	public GoodsVO getGoods(int gno) throws Exception;
}
