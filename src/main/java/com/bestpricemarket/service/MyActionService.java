package com.bestpricemarket.service;

import java.util.List;

import com.bestpricemarket.domain.BasketVO;
import com.bestpricemarket.domain.MyActionVO;

public interface MyActionService {
	
	public void insertAction(MyActionVO av) throws Exception;
	
	public List<MyActionVO> actionlist(int displayPost, int postNum,String a_m_id) throws Exception; 
    
	public List<MyActionVO> paylist(int displayPost, int postNum,String a_m_id) throws Exception;

	public int getCount() throws Exception;

	public int getPayCount() throws Exception;
	
	public void delete(MyActionVO vo);
}
