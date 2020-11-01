package com.bestpricemarket.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.BasketVO;



public interface BasketDAO {

	public void insertBasket(BasketVO bv);
	
	public List<BasketVO> Basketlist(int start,int end) throws Exception;
	
	public void deleteBasket(Integer lno) throws Exception;
	
	public int getCount() throws Exception;
	

} 
