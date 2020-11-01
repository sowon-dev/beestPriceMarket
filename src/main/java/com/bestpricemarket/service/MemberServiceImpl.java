package com.bestpricemarket.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	//DB와 연결 (의존주입)
	@Inject
	//@Autowired
	private MemberDAO mdao;

	// 회원가입
	@Override
	public void joinMember(MemberVO vo) {
		mdao.joinMember(vo);		
	}

	// 로그인
	@Override
	public MemberVO loginMember(MemberVO vo) {
		MemberVO returnVO = null;
		try {
			returnVO = mdao.readMemberWithIDPW(vo.getId(), vo.getPw());
			System.out.println("S: 로그인 아디: "+vo.getId()+" 비번: "+vo.getPw()+" 이름: "+vo.getUsername());
		} catch (Exception e) {
			e.printStackTrace();
			returnVO = null; //실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 = 예외처리
		}
		return returnVO; 
	}
	
	// 회원가입시 아이디중복확인
	@Override
	public MemberVO idCheck(String id) {
		return mdao.idCheck(id);
	}

	// 회원정보보기
	@Override
	public MemberVO readMember(String id) {
		MemberVO vo = null;
		try {
			vo = mdao.readMember(id);
			System.out.println("S: DAO 처리 완료, 정보 리턴");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	// 회원정보 수정
	@Override
	public void updateMember(MemberVO vo) {
		try {
			mdao.updateMember(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	// 회원탈퇴
	@Override
	public void deleteMember(MemberVO vo) {
	    try {
			mdao.deleteMember(vo);
			System.out.println("S: vo 확인"+vo);
	    } catch (Exception e) {
		
			e.printStackTrace();
		}
	}
}
