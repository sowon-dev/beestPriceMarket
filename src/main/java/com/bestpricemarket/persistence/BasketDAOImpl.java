package com.bestpricemarket.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.BasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO {
  
	
	
	@Inject
	private SqlSession session; // mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요

	private static final String namespace = "com.bestpricemarket.mappers.BasketMapper";

	// 관심상품 담기
	@Override
	public void insertBasket(BasketVO bv) {
        System.out.println("D: 장바구니 추가");
		
		session.insert(namespace+".insertBasket",bv);
		
	}
	// 관심상품 목록
	@Override
	public List<BasketVO> Basketlist() throws Exception {
	 List<BasketVO> basketlist = 
	 session.selectList(namespace+".listBasket");
		
		return basketlist;
	}
	// 관심상품 삭제
	@Override
	public void deleteBasket(Integer lno) throws Exception {
		System.out.println("D: 삭제 동작!!");
	  
	    session.delete(namespace+".deleteBasket",lno);
	}
	// 관심상품 세기
	@Override
	public int getCount() throws Exception {
		
		return session.selectOne(namespace+".getCount");
	}
	// 게시물 목록 + 페이징
	@Override
	public List listPage(int displayPost, int postNum,String l_m_id) throws Exception {
		Map data = new HashMap();
		  
		 data.put("displayPost", displayPost);
		 data.put("postNum", postNum);
		 data.put("l_m_id", l_m_id); 
		 return session.selectList(namespace + ".listPage", data);
	}

	

  
	

}
