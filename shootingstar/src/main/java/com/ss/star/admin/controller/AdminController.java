package com.ss.star.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/adminMain.do")
	public void adminMain() {
		logger.info("관리자 메인 페이지 보여주기");
	}
	
	@RequestMapping(value="/login/login.do", method=RequestMethod.GET)
	public void login() {
		logger.info("관리자 로그인 화면 보여주기");
	}
	
	
}