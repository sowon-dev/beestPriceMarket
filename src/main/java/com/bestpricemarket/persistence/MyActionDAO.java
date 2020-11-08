package com.bestpricemarket.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.BasketVO;
import com.bestpricemarket.domain.MyActionVO;



public interface MyActionDAO {

	//입찰 목록
	public List<MyActionVO> actionlist(int displayPost, int postNum,String a_m_id) throws Exception; 
	
	//낙찰 목록
	public List<MyActionVO> paylist(int displayPost, int postNum,String a_m_id,Integer a_g_actionstatus) throws Exception;
	
	//게시물 세기
	public int getCount() throws Exception;
} 
