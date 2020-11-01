package com.bestpricemarket.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bestpricemarket.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	//DB연결
	@Inject
	private SqlSession sqlSession; //mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요
	
	private static final String namespace = "com.bestpricemarket.mappers.memberMapper";

	//회원가입
	@Override
	public void joinMember(MemberVO vo) {
		System.out.println("DAO: 회원가입");
		sqlSession.insert(namespace+".joinMember", vo);
	}

	//회원정보읽기
	@Override
	public MemberVO readMemberWithIDPW(String id, String pw) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("id", id);
		paramMap.put("pw", pw);
		
		System.out.println("DAO: 로그인- "+paramMap);
		return sqlSession.selectOne(namespace+".readMemberWithIDPW", paramMap);	
	}

	// 회원가입 아이디 중복확인
	@Override
	public MemberVO idCheck(String id) {
		return sqlSession.selectOne(namespace+".idCheck", id);
	}
	
	// 회원정보 읽기
	@Override
	public MemberVO readMember(String id) throws Exception {
		return sqlSession.selectOne(namespace + ".readMember",id);
	}

	// 회원정보 수정
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		 sqlSession.update(namespace+".updateMember", vo);
	}

	// 회원 탈퇴
	@Override
	public void deleteMember(MemberVO vo) throws Exception {	
		System.out.println("DAO: 확인! "+vo);
		sqlSession.delete(namespace+".deleteMember",vo);
	}
	
}
