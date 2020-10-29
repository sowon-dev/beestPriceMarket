package com.bestpricemarket.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bestpricemarket.controller.MemberController;
import com.bestpricemarket.domain.BasketVO;
import com.bestpricemarket.persistence.BasketDAO;

@Service
public class BasketServiceImpl implements BasketService {
	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	BasketDAO bkdao;
	
	
	@Override
	public void insert(BasketVO bv) throws Exception {
		
		l.info("S: 장바구니 추가동작!");
		bkdao.insert(bv);
		
	}

	
	
}
