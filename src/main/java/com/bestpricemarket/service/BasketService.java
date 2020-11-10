package com.bestpricemarket.service;

import java.util.List;

import com.bestpricemarket.domain.BasketVO;

public interface BasketService {
	// 관심상품 담기
	public void insertBasket(BasketVO bv) throws Exception;
	// 관심상품 목록
	public List<BasketVO> Basketlist() throws Exception;
	// 관심상품 삭제
    public void deleteBasket(Integer lno) throws Exception;
	// 관심상품 세기
    public int getCount() throws Exception;
    // 게시물 목록 + 페이징
    public List listPage(int displayPost, int postNum,String l_m_id) throws Exception;
}
