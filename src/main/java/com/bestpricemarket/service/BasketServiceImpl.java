package com.bestpricemarket.service;

import java.util.List;

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
	public void insertBasket(BasketVO bv) throws Exception {

		l.info("S: 장바구니 추가동작!");
		bkdao.insertBasket(bv);
		
	}

	@Override
	public List<BasketVO> Basketlist(int start,int end) throws Exception {
		l.info("S: 장바구니 추가동작!");
		List<BasketVO> basketlist = 
				bkdao.Basketlist(start,end);
		return basketlist;
	}

	@Override
	public void deleteBasket(Integer lno) throws Exception {
		System.out.println("S: 삭제 동작");
      
		 bkdao.deleteBasket(lno);
	}

	@Override
	public int getCount() throws Exception {
		
		return bkdao.getCount();
	}

	
	

	
	
   
	
	
	
	

	
	
}
