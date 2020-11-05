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
	private static final String namespace = "com.bestpricemarket.mappers.commentMapper";
	
	//댓글 목록
	@Override
	public List<GoodsCommentVO> commentList(Integer gno) throws Exception{
		
		System.out.println("D : 댓글 목록");
		return sqlSession.selectList(namespace + ".commentList", gno);
	}
	
	//댓글 목록 each
	@Override
	public GoodsCommentVO commentListEach(Integer c_num) throws Exception {
		return sqlSession.selectOne(namespace + ".commentListEach", c_num);
	}

	// AI제약조건 있는 c_num가져오기
	@Override
	public int getCnum() throws Exception {
		return sqlSession.selectOne(namespace + ".getCnum");
	}

	// 댓글 작성
	@Override
	public void commentInsert(GoodsCommentVO cmt) throws Exception{

		System.out.println("D : 댓글 작성 성공!");
		sqlSession.insert(namespace + ".commentInsert", cmt);
		
	}
/*	
    //댓글의 갯수
    @Override
    public int count(int c_num) {
        return 0;
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
*/	

}