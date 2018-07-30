package com.ss.star.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.star.service.controller.QController;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(QController.class);
	
	@RequestMapping("/practice.do")
	public String prt_get() {
		logger.info("practice 화면");

		return "payment/practice";
	}
	
	@RequestMapping("/practice2.do")
	public String prt2_get() {
		logger.info("practice 화면");

		return "payment/practice2";
	}
	
	@RequestMapping("/port_payment.do")
	public String port_payment() {
		logger.info("port_payment 화면");
		
		return "payment/port_payment";
	}

}