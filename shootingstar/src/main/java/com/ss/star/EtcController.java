package com.ss.star;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/etc")
public class EtcController {
	
	private static final Logger logger = LoggerFactory.getLogger(EtcController.class);
	
	
	@RequestMapping(value = "/greetings.do")
	public String greetings() {
		
		return "etc/greetings";
	}
	
	@RequestMapping(value = "/information.do")
	public String information() {
		
		return "etc/information";
	}
	
	@RequestMapping(value = "/intro.do")
	public String intro() {
		
		return "etc/intro";
	}
	
	@RequestMapping(value = "/policy.do")
	public String policy() {
		
		return "etc/policy";
	}
	
	@RequestMapping(value = "/privatei.do")
	public String privatei() {
		
		return "etc/privatei";
	}
	
	
	

}
