package com.ss.star.zipcode.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/zipcode")
public class ZipcodeController {

	Logger logger = LoggerFactory.getLogger(ZipcodeController.class);
	
	@RequestMapping("/zipcode.do")
	public void zipcode() {
		logger.info("우편번호 찾기 화면");
	}
}
