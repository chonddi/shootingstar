package com.ss.star.admin.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.star.admin.model.ManagerService;
import com.ss.star.admin.model.ManagerVO;
import com.ss.star.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
@Autowired ManagerService managerService;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/adminMain.do")
	public void adminMain() {
		logger.info("관리자 메인 페이지 보여주기");
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public void register() {
		logger.info("관리자 회원가입 페이지");
	}
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register_post(@ModelAttribute ManagerVO managerVo ,Model model) {
		logger.info("회원가입 처리 managerVo: {}", managerVo);

		int cnt = managerService.insertManager(managerVo);
		logger.info("회원가입처리 cnt: {}",cnt);

		String msg="회원가입이 정상적으로 이루어지지 않았습니다.", url="/register.do";
		if(cnt>0) {
			msg="회원가입 되었습니다.";
			url="adminMain.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	
	 @RequestMapping("/ajaxAdminCheckId.do" )
		@ResponseBody
		public boolean ajaxCheckId(@RequestParam String adminId) {
			logger.info("ajax-아이디 중복 확인, 파라미터 adminId={}",adminId);
			
			int result=managerService.checkDuplicate(adminId);
			logger.info("ajax-아이디 중복 확인 결과, result={}",result);
			
			boolean bool=false;//사용불가
			if(result==ManagerService.AVAILABLE_ID) {
				bool=true;//사용가능
			}
			return bool;
		}
	 
	 @RequestMapping(value="/adminEdit.do" , method=RequestMethod.GET)
		public String edit_get(HttpSession session, Model model) {
			
			String adminId=(String)session.getAttribute("adminId");
			logger.info("회원정보 수정 화면, 파라미탸={}",adminId);
			
			if(adminId==null ||adminId.isEmpty()) {
				model.addAttribute("msg", "로그인을 먼저 하세요");
				model.addAttribute("url", "/admin/login/login.do");
				return"common/message"	;
			}
			ManagerVO vo = managerService.selectID(adminId);
			logger.info("회원정보 조회 결과, vo={}",vo);

			model.addAttribute("vo",vo);
			return "admin/adminEdit";
		}
		
	 @RequestMapping(value="/adminEdit.do", method=RequestMethod.POST)
	 public String edit_post(HttpSession session, @ModelAttribute ManagerVO vo , Model model, 
			 @RequestParam String adminId, String pwd, String newPwd) {
		 logger.info("관리자 수정 처리 managerVo: {}", vo);
		 	
		 int cnt= managerService.adminUpdate(vo);
		 cnt=managerService.checkPwd(adminId, pwd);
		 
		 String msg="",url="/admin/adminEdit.do";

				if(cnt==ManagerService.LOGIN_OK) {
				msg="수정 성공";
					if(newPwd!="") {
				 		cnt=managerService.pwdUpdate(vo);
				 		msg="비밀번호가 변경되었습니다";
				 	}
				}else if(cnt==ManagerService.PWD_DISAGREE) {
					msg="수정 실패. 비밀번호를 확인해주세요";
				}

			logger.info("관리자 수정 cnt={}",cnt);
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return"common/message";
		 	
	 }
	 

}
