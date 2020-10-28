package com.bestpricemarket.persistence;

import java.util.List;

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
	
	
	//댓글 목록
    @Override
    public List<GoodsCommentVO> commentList(int c_num) {
        System.out.println(c_num);
        
        return sqlSession.selectList("commentInsert.commentList", c_num);
        
    }
 
    //댓글의 갯수
    @Override
    public int count(int c_num) {
    	
        return 0;
    }
    

	// 댓글 작성
	@Override
	public void commentInsert(GoodsCommentVO cmt) {
		sqlSession.insert(namespace + "commentInsert.commentList", cmt);
		System.out.println("DAO : 댓글 등록" + cmt);
		
		
		
	}

	
	//댓글의 수정
	@Override
	public void commentUpdate(GoodsCommentVO cmt) {
		sqlSession.update("commentInsert.commentList", cmt);
		
	}

	
	//댓글의 삭제
	@Override
	public void commentDelete(int c_num) {
		sqlSession.delete("commentInsert.commentList", c_num);
		
	}
	
	
	
   
    
 
    
    
	
	

}
