package com.ss.star.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.member.model.MemberService;

@Controller
@RequestMapping("/login")
public class LoginController {

	Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired private MemberService memberService;

	@RequestMapping("/login.do")
	public void login() {
		logger.info("로그인페이지");
	}

	@RequestMapping("/loginMember.do")
	public String login_member(@RequestParam String memberId, @RequestParam String pwd, @RequestParam(required=false) String saveId,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("고객회원 로그인 memberId: {}, pwd: {}", memberId, pwd);

		int result = memberService.checkPwd(memberId, pwd);
		logger.info("로그인 처리 결과 result: {}", result);

		//로그인 처리
		String msg="", url="/login/login.do";


		if(result==memberService.LOGIN_OK) {
			String name= memberService.selectNameById(memberId);
			logger.info("로그인 처리 memberId로  불러온 결과 name: {}",name);
			//[1] 세션
			//userid
			request.getSession().setAttribute("memberId", memberId);
			//userName
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("userCode", 1);
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
		}else if(result == memberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result == memberService.ID_NONE) {
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
		logger.info("전문가회원 로그인 sMemberId: {}, sPpwd: {}", sMemberId, sPwd);

		int result = memberService.checkPwd(sMemberId, sPwd);
		logger.info("로그인 처리 결과 result: {}", result);

		//로그인 처리
		String msg="", url="/login/login.do";


		if(result==memberService.LOGIN_OK) {
			String sName= memberService.selectNameById(sMemberId);
			logger.info("로그인 처리 sMemberId로  불러온 결과 sName: {}",sName);
			//[1] 세션
			//userid
			request.getSession().setAttribute("sMemberId", sMemberId);
			//userName
			request.getSession().setAttribute("sName", sName);
			request.getSession().setAttribute("userCode", 2);
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
		}else if(result == memberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result == memberService.ID_NONE) {
			msg="아이디가 없습니다";
		}else {
			msg="로그인 처리 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}
}
