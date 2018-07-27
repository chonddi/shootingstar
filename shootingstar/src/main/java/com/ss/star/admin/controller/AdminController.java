package com.ss.star.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.star.admin.model.ManagerService;

@Controller
@RequestMapping("/admin")
public class AdminController {
@Autowired ManagerService managerService;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/adminMain.do")
	public void adminMain() {
		logger.info("관리자 메인 페이지 보여주기");
	}
	
	@RequestMapping("/register.do")
	public void register() {
		logger.info("관리자 회원가입 페이지");
	}
	
	@RequestMapping("/ajaxCheckId.do")
	@ResponseBody
	public boolean ajaxCheckId(@RequestParam String userid) {
		logger.info("ajax-아이디 중복 확인, 파라미터 userid={}",userid);
		
		int result=managerService.checkDuplicate(userid);
		logger.info("ajax-아이디 중복 확인 결과, result={}",result);
		
		boolean bool=false;//사용불가
		if(result==managerService.AVAILABLE_ID) {
			bool=true;//사용가능
		}
		return bool;
	}
	
}