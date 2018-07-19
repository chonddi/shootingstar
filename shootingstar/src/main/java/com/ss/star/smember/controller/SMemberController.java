package com.ss.star.smember.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.star.common.FileUploadUtil2;
import com.ss.star.smember.model.SMemberService;
import com.ss.star.smember.model.SMemberVO;

@Controller
@RequestMapping("/sMember")
public class SMemberController {

	Logger logger = LoggerFactory.getLogger(SMemberController.class);
	@Autowired SMemberService sMemberService;
	@Autowired FileUploadUtil2 fileUploadUtil;
	
	@RequestMapping(value="/sRegister.do", method=RequestMethod.GET)
	public void sRegister() {
		logger.info("전문가 회원가입 화면");
	}
	
	@RequestMapping(value="/sRegister.do", method=RequestMethod.POST)
	public String sRegister_post(@ModelAttribute SMemberVO sMemberVo, HttpServletRequest Request, Model model) throws IllegalStateException, IOException {
		logger.info("전문가 회원가입 처리 sMemberVo: {}", sMemberVo);
		
		List<Map<String, String>> list = fileUploadUtil.fileUpload(Request);
		logger.info("회원가입 파일의 list.size(): {}",list.size());
	    String identification="", accountCopy="";
	    for(Map<String, String> map : list) {
	    	identification = (String) map.get("identification");
	    	accountCopy = (String) map.get("accountCopy");
	    }
		logger.info("identification: {}, accountCopy: {}", identification, accountCopy);
		sMemberVo.setIdentification(identification);
        sMemberVo.setAccountCopy(accountCopy);
    
		//SMember에 인서트
		int cnt = sMemberService.insertSMember(sMemberVo);
		logger.info("등록 결과 cnt: {}", cnt);
		
		String msg="", url="/sMember/sRegister.do";
		if(cnt>0) {
			msg="회원가입되었습니다.";
			url="/index.do";
		}else {
			msg="회원가입이 정상적으로 이루어지지 않았습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
