package com.bestpricemarket.service;

import com.bestpricemarket.domain.MemberVO;

// 일반적으로는 DAO랑 같은 메소드명을 사용하여 일관성을 유지한다
public interface MemberService {
	// 회원 가입 (일반회원가입테이블에 sns계정 컬럼 추가하기)	
	public void joinMember(MemberVO vo);
	
	// 로그인
	public MemberVO loginMember(MemberVO vo);

	// 회원가입시 아이디중복확인
	public MemberVO idCheck(String id);
	
	// 회원정보 보기
	public MemberVO readMember(String id);
	
	// 회원정보 수정
	public void updateMember(MemberVO vo);
	
	// 회원탈퇴
	public void deleteMember(MemberVO vo);
}
