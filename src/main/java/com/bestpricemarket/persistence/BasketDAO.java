package com.bestpricemarket.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.BasketVO;



public interface BasketDAO {

	public void insertBasket(BasketVO bv);
	
	public List<BasketVO> Basketlist() throws Exception;
	
	public void deleteBasket(Integer lno) throws Exception;
	
	public int getCount() throws Exception;
	
	// 게시물 목록 + 페이징
	public List listPage(int displayPost, int postNum,String l_m_id) throws Exception;
} 
