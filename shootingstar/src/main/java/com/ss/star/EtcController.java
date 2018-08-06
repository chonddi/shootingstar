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
	

	
	
	@RequestMapping(value="/information.do", method = RequestMethod.GET)
	public String information() {
		
		return "etc/information";
	}
	
	
	
	@RequestMapping(value="/intro.do", method = RequestMethod.GET)
	public String intro() {
		
		return "etc/intro";
	}
	
	
	
	
	@RequestMapping(value="/policy.do", method = RequestMethod.GET)
	public String policy() {
		
		return "etc/policy";
	}
	
	
	
	
	@RequestMapping(value="/privatei.do", method = RequestMethod.GET)
	public String privatei() {
		
		return "etc/privatei";
	}
	
	
	

}
