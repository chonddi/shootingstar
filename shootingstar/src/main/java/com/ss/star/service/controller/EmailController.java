package com.ss.star.service.controller;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ss.star.email.EmailSender;
import com.ss.star.service.model.EmailVO;

@Controller
@RequestMapping("/SERVICE")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

	@Autowired
	private EmailSender emailSender;

	@RequestMapping("/email.do")
	public String email() {
		logger.info("이메일 발송 화면 보여주기");
		
		return "SERVICE/email";
	}

	@RequestMapping("/send.do")
	public String send(@ModelAttribute EmailVO emailVo) {
		logger.info("이메일 발송 처리 파라미터 emailVo={}", emailVo);

		String subject = emailVo.getsName() + " 전문가 님의 문의가 도착했습니다.";
		String content = "연락처 : " + emailVo.getTel() + "\n\n" + emailVo.getContent();
		String to = "hkedushootingstar@gmail.com";
		String from = emailVo.getEmail();

		try {
			emailSender.sendEmail(subject, content, to, from);
			logger.info("이메일 발송 성공");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패");
			e.printStackTrace();
		}

		return "redirect:/star/index.do";
		
		
	}

}