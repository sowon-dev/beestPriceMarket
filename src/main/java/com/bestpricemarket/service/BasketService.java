package com.bestpricemarket.service;

import java.util.List;

import com.bestpricemarket.domain.BasketVO;

public interface BasketService {
	
	public void insertBasket(BasketVO bv) throws Exception;

	public List<BasketVO> Basketlist() throws Exception;

    public void deleteBasket(BasketVO bv) throws Exception;
		
}
