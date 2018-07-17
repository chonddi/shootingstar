package com.ss.star.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired private MemberService memberService;
	Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/registerChoice.do")
	public void registerChoice() {
		logger.info("회원가입 페이지");
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public void register() {
		logger.info("회원가입 페이지");
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register_post(@ModelAttribute MemberVO memberVo ,Model model) {
		logger.info("회원가입 처리 memberVo: {}", memberVo);
		
		int cnt = memberService.insertMember(memberVo);
		logger.info("회원가입처리 cnt: {}");
		
		String msg="회원가입이 정상적으로 이루어지지 않았습니다.", url="/member/registerChoice.do";
		if(cnt>0) {
			msg="회원가입 되었습니다.";
			url="/index.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	
	@RequestMapping("/sampleRegister.do")
	public void sampleRegister() {
		logger.info("sample회원가입");
	}
}
