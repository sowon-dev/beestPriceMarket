package com.bestpricemarket.service;

import java.util.List;

import com.bestpricemarket.domain.BasketVO;

public interface BasketService {
	
	public void insertBasket(BasketVO bv) throws Exception;

	public List<BasketVO> Basketlist() throws Exception;

    public void deleteBasket(Integer lno) throws Exception;
	
    public int getCount() throws Exception;

 // 게시물 목록 + 페이징
    public List listPage(int displayPost, int postNum) throws Exception;
}
