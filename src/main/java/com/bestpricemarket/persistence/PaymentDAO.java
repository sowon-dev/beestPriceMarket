package com.bestpricemarket.persistence;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.MemberVO;

public interface PaymentDAO {
	// 회원정보 가져오기
	public MemberVO getMember(String id) throws Exception;
			
	// 상품정보 가져오기
	public GoodsVO getGoods(int gno) throws Exception;
}
