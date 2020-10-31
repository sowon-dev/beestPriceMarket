package com.bestpricemarket.service;

import javax.inject.Inject;

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
			System.out.println("S: 로그인 정보 리턴");
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

	//구글 회원가입
	@Override
	public void joinMemberByGoogle(MemberVO vo) {
		mdao.joinMember(vo);
	}

	//구글 로그인
	@Override
	public MemberVO loginMemberByGoogle(MemberVO vo) {
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

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "bestpricemarketnoreply@gmail.com";
		String hostSMTPpwd = "bestpricemarket123!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "bestpricemarketnoreply@gmail.com";
		String fromName = "(주)베프마켓";
		String subject = "";
		String msg = "";
		
		if(div.equals("find_pw")) {
			subject = "베프마켓 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPw() + "</p></div>";
		}
		
		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

		
	}
	
	

}//end of MemberServiceImpl
