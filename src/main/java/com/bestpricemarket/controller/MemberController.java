package com.bestpricemarket.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	@Inject
	//@Autowired
	private MemberService service;
	
	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	/* 회원가입 */
	// http://localhost:8088/member/join
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String insertGET() throws Exception {
		return "/member/loginandjoin";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String insertPOST(MemberVO vo) throws Exception{
		l.info("C: 회원가입포스트메서드"+ vo);
		service.joinMember(vo);		
		return "redirect:/member/login";
	}
	
	//회원가입시 아이디중복확인
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public @ResponseBody int idCheck(@RequestParam("id") String id) throws Exception {
		MemberVO ck = service.idCheck(id);
		if(ck != null) return 1;
		else return 0;
	}
	
	/* 로그인 기능 */
	// http://localhost:8088/member/login
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception{
		return "/member/loginandjoin";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		MemberVO returnVO = service.loginMember(vo);
		System.out.println("C: 리턴VO결과(서비스에서 예외처리를 진행했으므로 null이 출력되면 코드에 문제있다는 의미) "+returnVO);
		
		if(returnVO != null) {
			session.setAttribute("id", returnVO.getId());			
			rttr.addFlashAttribute("mvo", returnVO);
			return "redirect:/member/main"; 
		} else {
			return "redirect:/member/login";
		}
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logoutGET(HttpSession session) throws Exception{
		l.info("C: 로그아웃 GET");
		session.invalidate();
		// return "redirect:/member/main"; 얼럿창출력안하고싶을때 사용
	}
	
	/* 메인페이지 */
	// http://localhost:8088/member/main
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainGET(HttpSession session, Model model) throws Exception{
		l.info("C: 메인 출력페이지 GET");
		MemberVO vo = service.readMember((String)session.getAttribute("id"));
		model.addAttribute("memVO", vo);
		return "main";
	}
	
	/* 회원정보보기 */
	// http://localhost:8088/test/member/info
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void infoGET(HttpSession session, Model model) throws Exception{
		MemberVO vo = service.readMember((String)session.getAttribute("id"));
		model.addAttribute("memVO", vo);
		l.info("C: 회원정보보기 GET의 VO "+ vo);
	}
	
	/* 회원정보 수정(update) */
	// http://localhost:8088/member/update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateGET(HttpSession session, Model model) throws Exception{
		model.addAttribute("memberVO",service.readMember((String)session.getAttribute("id")));
		return "/member/updateForm";
   }	

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(MemberVO vo) throws Exception{        
        l.info("C: 수정할 정보 ->"+vo);
        service.updateMember(vo);
    	return "redirect:/member/main";
    }
    
    /* 회원탈퇴 */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET(HttpSession session) throws Exception{
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "redirect:/member/main";
		}
		return "/member/deleteForm";
	}
    
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deletePOST(MemberVO vo, HttpSession session) throws Exception{
    	l.info("post"+vo);
    	service.deleteMember(vo);
    	session.invalidate();
    	return "redirect:/member/login ";
    }
	
	
	
}
