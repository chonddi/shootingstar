package com.ss.star.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.admin.model.ManagerService;
import com.ss.star.member.model.MemberService;

@Controller
@RequestMapping("/admin/login")
public class AdminLoginController {

	Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	@Autowired private ManagerService managerService;

	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public void login() {
		logger.info("로그인페이지");
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_admin(@RequestParam String adminId, @RequestParam String pwd, @RequestParam(required=false) String adminSaveId,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("관리자 로그인 adminId: {}, pwd: {}", adminId, pwd);
		logger.info("saveId:{}", adminSaveId);
		//
		int result = managerService.checkPwd(adminId, pwd);
		logger.info("로그인 처리 결과 result: {}", result);

		
		//로그인 처리
		String msg="", url="/admin/login/login.do";
		
		 if(result==ManagerService.LOGIN_OK) {
			 String adminName= managerService.selectNameById(adminId);
			logger.info("adminName: {}",adminName);
			//[1] 세션
			//adminid
			request.getSession().setAttribute("adminId", adminId);
			request.getSession().setAttribute("adminCode", "0");
			//userName
			request.getSession().setAttribute("adminName", adminName);
			request.getSession().setMaxInactiveInterval(60*60);
			//[2] 쿠키
			Cookie cookie= new Cookie("adminSaveId", adminId);
			cookie.setPath("/");
			if(adminSaveId!=null) {
				cookie.setMaxAge(60*24*60*60);
				response.addCookie(cookie);
			}else {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

			msg=adminName+"님 로그인되었습니다.";
			url="/admin/adminMain.do";
		}else if(result == ManagerService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result == ManagerService.ID_NONE) {
			msg="아이디가 없습니다";
		}else {
			msg="로그인 처리 실패";
		}

		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		String userCode = (String)session.getAttribute("userCode");
		String adminCode = (String)session.getAttribute("adminCode");
		logger.info("로그아웃 처리 userCode: {}", userCode);
		logger.info("로그아웃 처리 adminCode: {}", adminCode);
		session.removeAttribute("userCode");
		session.removeAttribute("adminId");
		session.removeAttribute("adminCode");
		session.removeAttribute("adminName");

		
		return "redirect:/admin/login/login.do";
	}
	
}
