package com.bestpricemarket.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	// DB 의존 주입
	@Inject
	private SqlSession sqlSession;
	
	// 상품등록
	
	// 상품목록
		
	// 상품조회(상품상세페이지)
		
	// 상품수정
		
	// 상품삭제

}
