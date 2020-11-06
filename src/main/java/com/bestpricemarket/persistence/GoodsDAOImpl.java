package com.bestpricemarket.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.PricemonitoringVO;
import com.bestpricemarket.domain.ReportVO;

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
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		
		System.out.println("DAO : 상품 수정");
		
		sqlSession.update(namespace+".modifyGoods", vo);
		
		System.out.println("DAO : 수정된 상품 정보 -> " + vo);
		
	}
		
	// 상품삭제
	@Override
	public void goodsDelete(int gno) throws Exception {
		System.out.println("DAO : 상품 삭제");
		
		sqlSession.delete(namespace+".deleteGoods", gno);
		
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
	
	// 첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {

		System.out.println("DAO : 첨부파일 수정");
		sqlSession.update(namespace+".updateFile",map);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		
		System.out.println("DAO : 첨부파일 다운로드");
		return sqlSession.selectOne(namespace+".selectFileInfo",map);
	}
	
	// 카테고리별 상품 분류
	@Override
	public List<GoodsVO> goodsCategoryList(String category) throws Exception {
			
		System.out.println("DAO : 카테고리 분류");
		
		return sqlSession.selectList(namespace+".category",category);
	}
	
	
	
	// 상품신고 *******************************************************************************************************************************
	/* 태준 */
	// 상품신고
	@Override
	public ReportVO showReportDetail(HttpSession session, int gno) throws Exception {
		
		return sqlSession.selectOne(namespace+".showReportDetail", gno);
	}
	/* 태준 */
	// 상품신고 *******************************************************************************************************************************
	
	
	// 입찰하기 *******************************************************************************************************************************
	// 입찰하기
	@Override
	public List<PricemonitoringVO> getBidding(int pm_g_gno) throws Exception {
		List<PricemonitoringVO> prvo = sqlSession.selectList(namespace + ".getBidding",pm_g_gno);
		return prvo;
	}
		

	@Override
	public int getMaxPrice(int pm_g_gno) throws Exception {
		int maxVO = sqlSession.selectOne(namespace + ".getMaxPrice",pm_g_gno);
		return maxVO;
	}

	@Override
	public void insertBidding(PricemonitoringVO prvo) throws Exception {
		sqlSession.selectOne(namespace + ".insertBidding",prvo);
	}	
	// 입찰하기 *******************************************************************************************************************************
	
	
	
	
	
	
	
}