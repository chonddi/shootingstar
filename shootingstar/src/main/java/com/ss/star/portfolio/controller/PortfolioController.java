package com.ss.star.portfolio.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/portfolio")
public class PortfolioController {
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);
	
	@RequestMapping(value = "/portfolioList.do", method = RequestMethod.GET)
	public void portfolio_list() {	
		logger.info("포트폴리오 목록 화면 보여주기");
	}
 }
