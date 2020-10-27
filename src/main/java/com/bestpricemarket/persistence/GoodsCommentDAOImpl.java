package com.bestpricemarket.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.GoodsCommentVO;

@Repository
public class GoodsCommentDAOImpl implements GoodsCommentDAO {
	
	// DB 의존 주입
	@Inject
	private SqlSession sqlSession;
		
	private static final String namespace = "com.bestpricemarket.mappers.goodsMapper";

	// 댓글 작성
	@Override
	public void commentInsert(GoodsCommentVO cmt) throws Exception {
		sqlSession.insert(namespace + ".comment", cmt);
		System.out.println("DAO : 댓글 등록" + cmt);
		
		
		
	}
    
	
	

}
