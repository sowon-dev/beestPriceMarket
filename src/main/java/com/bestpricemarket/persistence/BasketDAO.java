package com.bestpricemarket.persistence;

import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.BasketVO;



public interface BasketDAO {

	public void insert(BasketVO bv);
	
} 
