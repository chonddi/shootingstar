package com.ss.star;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String home() {
		logger.info("Welcome index!");
		return "index";
	}

	@RequestMapping(value = "/common/selfClose.do", method = RequestMethod.GET)
	public String selfClose() {
		logger.info("selfClose");
		return "/common/selfClose";
	}
	
}

