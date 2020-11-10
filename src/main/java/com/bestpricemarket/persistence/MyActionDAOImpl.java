package com.bestpricemarket.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.BasketVO;
import com.bestpricemarket.domain.MyActionVO;

@Repository
public class MyActionDAOImpl implements MyActionDAO {
  
	
	
	@Inject
	private SqlSession session; // mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요

	private static final String namespace = "com.bestpricemarket.mappers.myActionMapper";

	@Override
	public List<MyActionVO> actionlist(int displayPost, int postNum,String a_m_id) throws Exception {
		Map data = new HashMap();
		  
		 data.put("displayPost", displayPost);
		 data.put("postNum", postNum);
		 data.put("a_m_id", a_m_id); 
		return session.selectList(namespace + ".actionlist",data);
	}
	
	

	@Override
	public List<MyActionVO> paylist(int displayPost, int postNum, String a_m_id) throws Exception {
		Map map = new HashMap();
		map.put("displayPost", displayPost);
		map.put("postNum", postNum);
		map.put("a_m_id", a_m_id);
		return session.selectList(namespace+".paylist",map);
		
	}



	@Override
	public int getCount() throws Exception {
		
		return session.selectOne(namespace+".getCount");
	}
	
	
	
	@Override
	public int getPayCount() throws Exception {
		
		return session.selectOne(namespace+".getPayCount");
	}



	@Override
	public void delete(MyActionVO av) {
		session.delete(namespace+".delete",av);
		
	}
	
	
	
	

	

  
	

}
