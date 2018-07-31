package com.ss.star.payment.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.member.model.MemberService;
import com.ss.star.payment.model.PayfinishVO;
import com.ss.star.request.model.RequestService;
import com.ss.star.service.controller.QController;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(QController.class);

	@Autowired
	RequestService requestService;
	@Autowired
	MemberService memberService;

	@RequestMapping("/port_payment.do")
	public String port_payment(@RequestParam(defaultValue = "0") int no, HttpSession session, Model model) {
		logger.info("port_payment 화면 파라미터 no={}", no);

		// 임시 세션아이디
		session.setAttribute("userid", "abc@naver.com");
		session.setAttribute("userCode", "1");

		String userid = (String) session.getAttribute("userid");
		String usercode = (String) session.getAttribute("userCode");

		if (no == 0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/index.do");
			return "common/message";
		}

		PayfinishVO vo = requestService.selectAll(no);
		logger.info("PayfinishVO 파라미터, vo={}", vo);

		model.addAttribute("vo", vo);

		if (usercode.equals("2")) {
			model.addAttribute("msg", "고객 회원만 이용가능합니다.");
			model.addAttribute("url", "/index.do");
			return "common/message";
		}

		return "payment/port_payment";
	}

	@RequestMapping(value = "/port_payfinish.do", method = RequestMethod.GET)
	public String port_payfinish_get(@RequestParam(defaultValue = "0") int no, HttpSession session) {
		logger.info("detail 화면 이동, 파라미터 no={}", no);

		return "request/port_payfinish";
	}

	@RequestMapping(value = "/port_payfinish.do", method = RequestMethod.POST)
	public String port_payfinish_post(@ModelAttribute PayfinishVO vo, HttpSession session, Model model) {
		logger.info("결제 처리 파라미터 vo={}", vo);

		// 임시 세션아이디
		session.setAttribute("userid", "abc@naver.com");
		session.setAttribute("userCode", "1");

		String userid = (String) session.getAttribute("userid");
		String usercode = (String) session.getAttribute("userCode");

		int cnt = requestService.insertPayment(vo);

		if (userid != vo.getMemberid()) {

		}

		logger.info("PayfinishVO 파라미터, vo={}", vo);

		model.addAttribute("vo", vo);

		return "payment/port_payfinish";

	}

}