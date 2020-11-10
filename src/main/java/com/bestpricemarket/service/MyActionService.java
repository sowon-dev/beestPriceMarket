package com.bestpricemarket.service;

import java.util.List;
import com.bestpricemarket.domain.MyActionVO;

public interface MyActionService {
	//입찰 목록 담기
	public void insertAction(MyActionVO av) throws Exception;
	//입찰 목록 
	public List<MyActionVO> actionlist(int displayPost, int postNum,String a_m_id) throws Exception; 
    //낙찰 목록
	public List<MyActionVO> paylist(int displayPost, int postNum,String a_m_id) throws Exception;
	//입찰 세기
	public int getCount() throws Exception;
	//낙찰 세기
	public int getPayCount() throws Exception;
	//선택 삭제
	public void delete(MyActionVO vo);
}
