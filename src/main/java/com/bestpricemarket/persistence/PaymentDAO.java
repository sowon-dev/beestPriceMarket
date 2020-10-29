package com.bestpricemarket.persistence;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.domain.ParamVO;
import com.bestpricemarket.domain.PaymentVO;

public interface PaymentDAO {
	// 회원정보 가져오기
	public MemberVO getMember(String id) throws Exception;
			
	// 상품정보 가져오기
	public GoodsVO getGoods(int gno) throws Exception;
	
	// 결제내역 저장하기
	public void insertParam(PaymentVO pvo) throws Exception;
	
	public PaymentVO getPayment(int p_g_gno) throws Exception;
}
