package com.bestpricemarket.service;

import java.util.Map;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.domain.ParamVO;
import com.bestpricemarket.domain.PaymentVO;

public interface PaymentService {
	// id에 맞는 회원정보를 가져오는 메서드
	public MemberVO getMember(String id) throws Exception;
		
	// 해당 상품번호에 맞는 상품정보를 가져오는 메서드
	public GoodsVO getGoods(int gno) throws Exception;	
	
	// 결제 내역 저장하기
	public void insertParam(PaymentVO pvo) throws Exception;
	
	public PaymentVO getpayment(int p_g_gno) throws Exception;
}
