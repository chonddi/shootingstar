package com.ss.star.smember.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.star.smember.model.SMemberService;

@Controller
@RequestMapping("/sMember")
public class SMemberController {

	Logger logger = LoggerFactory.getLogger(SMemberController.class);
	@Autowired SMemberService sMemberService;
	
	@RequestMapping("/sRegister.do")
	public void sRegister() {
		logger.info("전문가 회원가입 화면");
	}
}
