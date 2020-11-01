package com.bestpricemarket.service;

import java.util.List;

import com.bestpricemarket.domain.BasketVO;

public interface BasketService {
	
	public void insertBasket(BasketVO bv) throws Exception;

	public List<BasketVO> Basketlist(int start, int end) throws Exception;

    public void deleteBasket(Integer lno) throws Exception;
	
    public int getCount() throws Exception;
}
