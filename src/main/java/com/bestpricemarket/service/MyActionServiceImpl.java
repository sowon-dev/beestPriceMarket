package com.bestpricemarket.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bestpricemarket.controller.MemberController;
import com.bestpricemarket.domain.BasketVO;
import com.bestpricemarket.domain.MyActionVO;
import com.bestpricemarket.persistence.BasketDAO;
import com.bestpricemarket.persistence.MyActionDAO;

@Service
public class MyActionServiceImpl implements MyActionService {
	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MyActionDAO adao;

	// 입찰 목록 담기
	@Override
	public void insertAction(MyActionVO av) throws Exception {
		adao.insertAction(av);
		
	}

	// 입찰 목록 
	@Override
	public List<MyActionVO> actionlist(int displayPost, int postNum,String a_m_id) throws Exception {
		
		return adao.actionlist(displayPost,postNum,a_m_id);
	}

	
	// 낙찰 목록
	@Override
	public List<MyActionVO> paylist(int displayPost, int postNum, String a_m_id) throws Exception {
		
		return adao.paylist(displayPost,postNum,a_m_id);
	}

	//입찰 세기
	@Override
	public int getCount() throws Exception {
		
		return adao.getCount();
	}
	
	//낙찰 세기
	@Override
	public int getPayCount() throws Exception {
		
		return adao.getPayCount();
	}

	//선택 삭제
	@Override
	public void delete(MyActionVO av) {
		adao.delete(av);
		
	}
}
