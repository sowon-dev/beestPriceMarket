package com.bestpricemarket.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.BasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO {
  
	
	
	@Inject
	private SqlSession session; // mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요

	private static final String namespace = "com.bestpricemarket.mappers.BasketMapper";

	@Override
	public void insertBasket(BasketVO bv) {
        System.out.println("D: 장바구니 추가");
		
		session.insert(namespace+".insertBasket",bv);
		
	}

	@Override
	public List<BasketVO> Basketlist() throws Exception {
	 System.out.println("D: 장바구니 리스트");	
	  
	 List<BasketVO> basketlist =
	 session.selectList(namespace+".listBasket");
		
		return basketlist;
	}

	@Override
	public void deleteBasket(BasketVO bv) throws Exception {
		System.out.println("D: 삭제 동작!!");
	  
	    session.selectOne(namespace+".deleteBasket");
	}

	  
	

}
