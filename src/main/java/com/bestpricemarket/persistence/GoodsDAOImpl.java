package com.bestpricemarket.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	// DB 의존 주입
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.bestpricemarket.mappers.goodsMapper";
	
	// 상품등록
	@Override
	public void registerGoods(GoodsVO vo) throws Exception {
		
		System.out.println("DAO : 상품등록"+vo);
		
		sqlSession.insert(namespace+".register",vo);
		
		
		
		
	}
	
	// 첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		
		System.out.println("DAO : 첨부 파일 업로드 -> " + map);
		sqlSession.insert(namespace+".insertFile", map);
		
		
		
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int gno) throws Exception {

		System.out.println("DAO : 첨부 파일 조회 -> " + gno);
		return sqlSession.selectList(namespace+".selectFileList", gno);
	}
	
	
	
	// 상품목록
	@Override
	public List<GoodsVO> listGoods() throws Exception {
		System.out.println("DAO : 상품 목록");
		
		return sqlSession.selectList(namespace+".listGoods");
	}
		
	// 상품조회(상품상세페이지)
	@Override
	public GoodsVO goodsDetail(int gno) throws Exception {
		System.out.println("DAO : 상품 조회");
		
		return sqlSession.selectOne(namespace+".detailGoods", gno);
	}
		
	// 상품수정
		
	// 상품삭제

}
