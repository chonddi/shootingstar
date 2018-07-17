package com.ss.star.mail.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ss.star.mail.model.MailService;
import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;
import com.ss.star.smember.model.SMemberService;
import com.ss.star.smember.model.SMemberVO;

@Controller
@RequestMapping("/member")
public class MailController {
    private Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
    Logger logger = LoggerFactory.getLogger(MailController.class);
    
    @Autowired private MemberService memberService;
    @Autowired private SMemberService sMemberService;
    
    @Autowired private MailService mailService;
 
    @RequestMapping(value = "/checkMail.do", produces = "application/text; charset=utf8")
    @ResponseBody
    private String checkMail(@RequestParam String memberId, @RequestParam String userCode) {
    	logger.info("id 중복 확인 memberId: {}, userCode: {}", memberId, userCode);
        if(userCode.equals("1")) {
        	MemberVO memberVo = memberService.selectID(memberId);
        	return gson.toJson(memberVo);
        }else {
        	SMemberVO sMemberVo = sMemberService.selectID(memberId);
        	return gson.toJson(sMemberVo);
        }
    }
 
    @RequestMapping(value = "/sendMail.do", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    private boolean sendMail(HttpSession session, @RequestParam String memberId) {
    	logger.info("메일보내기");
        int randomCode = new Random().nextInt(10000) + 1000;
        String joinCode = String.valueOf(randomCode);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "회원가입 승인 번호 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("회원가입 승인번호는 ").append(joinCode).append(" 입니다.");
        return mailService.send(subject, sb.toString(), "hand0208@gmail.com", memberId);
    }
    
    @RequestMapping("/code.do")
    @ResponseBody
    public int compareCode(@RequestParam String code, HttpServletRequest request) {
    	String joinCode = (String)request.getSession().getAttribute("joinCode");
    	logger.info("코드인증 joinCode:{}, code:{}", joinCode, code);
    	
    	int bool=1;
    	if(code.equals(joinCode)) {
    		bool=2;
    	}
    	
    	return bool;
    }
}
