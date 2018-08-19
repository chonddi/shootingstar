package com.ss.star.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;
import com.ss.star.smember.model.SMemberService;

@Controller
@RequestMapping("/login")
public class LoginController {

	Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired private MemberService memberService;
	@Autowired private SMemberService sMemberService;

	@RequestMapping("/login.do")
	public void login() {
		logger.info("로그인페이지");
	}

	@RequestMapping("/loginMember.do")
	public String login_member(@RequestParam String memberId, @RequestParam String pwd, @RequestParam(required=false) String saveId,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("고객회원 로그인 memberId: {}, pwd: {}", memberId, pwd);
		logger.info("saveId:{}", saveId);

		int result = memberService.checkPwd(memberId, pwd);
		logger.info("로그인 처리 결과 result: {}", result);

		//로그인 처리
		String msg="", url="/login/login.do";


		if(result==MemberService.LOGIN_OK) {
			String name= memberService.selectNameById(memberId);
			logger.info("로그인 처리 memberId로  불러온 결과 name: {}",name);
			MemberVO memberVo = memberService.selectID(memberId); 
			int mileage = memberVo.getMileage();
			logger.info("로그인 처리 파라미터 mileage={}", mileage);
			//[1] 세션
			//userid
			request.getSession().setAttribute("userid", memberId);
			//userName
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("userCode", "1");
			request.getSession().setMaxInactiveInterval(60*60);
			//mileage
			request.getSession().setAttribute("mileage", mileage);
			//[2] 쿠키
			Cookie cookie= new Cookie("saveId", memberId);
			cookie.setPath("/");
			if(saveId!=null) {
				cookie.setMaxAge(60*24*60*60);
				response.addCookie(cookie);
			}else {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

			msg=name+"님 로그인되었습니다.";
			url="/index.do";
		}else if(result == MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result == MemberService.ID_NONE) {
			msg="아이디가 없습니다";
		}else {
			msg="로그인 처리 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}
	
	@RequestMapping("/loginSMember.do")
	public String login_sMember(@RequestParam String sMemberId, @RequestParam String sPwd, @RequestParam(required=false) String sSaveId,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("전문가회원 로그인 sMemberId: {}, sPwd: {}", sMemberId, sPwd);
		logger.info("sSaveId:{}", sSaveId);
		
		int result = sMemberService.checkPwd(sMemberId, sPwd);
		logger.info("로그인 처리 결과 result: {}", result);

		//로그인 처리
		String msg="", url="/login/login.do";


		if(result==MemberService.LOGIN_OK) {
			String sName= sMemberService.selectNameById(sMemberId);
			logger.info("로그인 처리 sMemberId로  불러온 결과 sName: {}",sName);
			//[1] 세션
			//userid
			request.getSession().setAttribute("userid", sMemberId);
			//userName
			request.getSession().setAttribute("name", sName);
			request.getSession().setAttribute("userCode", "2");
			
			logger.info("현재 session의 memberId: {}", sMemberId);
			
			//[2] 쿠키
			Cookie cookie= new Cookie("sSaveId", sMemberId);
			cookie.setPath("/");
			if(sSaveId!=null) {
				cookie.setMaxAge(60*24*60*60);
				response.addCookie(cookie);
			}else {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

			msg=sName+"님 로그인되었습니다.";
			url="/index.do";
		}else if(result == SMemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result == SMemberService.ID_NONE) {
			msg="아이디가 없습니다";
		}else {
			msg="로그인 처리 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		String userCode = (String)session.getAttribute("userCode");
		logger.info("로그아웃 처리 userCode: {}", userCode);
		
		if("1".equals(userCode)) {
			session.removeAttribute("userid");
			session.removeAttribute("userCode");
			session.removeAttribute("name");
		}else if("2".equals(userCode)) {
			session.removeAttribute("userid");
			session.removeAttribute("userCode");
			session.removeAttribute("name");
		}
		
		return "redirect:/index.do";
	}
	
	//비밀번호 찾기
	@RequestMapping("/forgotPassword.do")
	public void forgotPassword(@RequestParam String userCode) {
		logger.info("비밀번호 찾기 userCode: {}", userCode);
		
	}
	
	@RequestMapping(value="/findPassword.do", method=RequestMethod.GET)
	public String findPassword(@RequestParam(defaultValue="0") String tempPwd, @RequestParam String userCode
				,Model model) {
		logger.info("비밀번호 찾기 토큰입력 페이지 tempPwd: {}", tempPwd);
		
		if("0".equals(tempPwd)) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/login/login.do");
			
			return "common/message";
		}
		String userid="";
		if("1".equals(userCode)) {
			userid=memberService.selectTempPwd(tempPwd);
			if(userid!=null) {
				model.addAttribute("userid", userid);
				return "login/findPassword";
			}else {
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "/login/login.do");
				
				return "common/message";
			}
			
		}else {
			userid=sMemberService.selectTempPwd(tempPwd);
			if(userid!=null) {
				model.addAttribute("userid", userid);
				return "login/findPassword";
			}else {
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "/login/login.do");
				
				return "common/message";
			}
		}
	}
	@RequestMapping(value="findPassword.do", method=RequestMethod.POST)
	public String findPassword_post(@RequestParam String pwd, @RequestParam String userid, @RequestParam String userCode, Model model) {
		logger.info("비밀번호 찾기 후 변경 처리 입력한 pwd: {}, userid: {}", pwd, userid);
		logger.info("userCode: {}", userCode);
		
		int cnt = 0;
		String msg="", url="";
		if("1".equals(userCode)) {
			cnt = memberService.changeNewPwd(pwd, userid);
		}else {
			cnt = sMemberService.changeNewPwd(pwd, userid);
		}
		logger.info("비밀번호 변경 후 cnt: {}");
		if(cnt>0) {
			msg="비밀번호가 변경되었습니다.";
			url="/login/login.do";
		}else {
			msg="변경 실패, 재시도 해주십시오";
			url="/login/login.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("forgotPasswordChk.do")
	public void forgotPasswordChk() {
		logger.info("임시번호 발급 후 나가기 페이지");
	}
	
}
