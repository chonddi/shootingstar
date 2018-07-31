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

import com.ss.star.admin.model.ManagerService;
import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;
import com.ss.star.smember.model.SMemberService;


@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	@Autowired ManagerService managerService;
	@Autowired MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model) {

		List<MemberVO> list = managerService.memberList();
		model.addAttribute("list", list);
		logger.info("allmember List list.size={} ",list.size());

		return "admin/member/memberList";
	}

		@RequestMapping(value="/memberEdit.do" , method=RequestMethod.GET)
		public String memberEdit(Model model , @RequestParam String id) {

			MemberVO memberVo = memberService.selectID(id);
			model.addAttribute("memberVo", memberVo); 
			
			return "admin/member/memberEdit";
		}

	

	@RequestMapping(value="/memberEdit.do", method=RequestMethod.POST)
	public String memberEdit_post(@ModelAttribute MemberVO memberVo, HttpSession session, Model model) {
	
	String adminId=(String)session.getAttribute("adminId");
			logger.info("회원정보 수정 화면, 파라미탸={}",adminId);
			String msg="", url="/admin/member/memberList.do";
			if(adminId==null ||adminId.isEmpty()) {
				model.addAttribute("msg", "로그인을 먼저 하세요");
				model.addAttribute("url", "/admin/login/login.do");
				return"common/message"	;
			}else {
				int cnt = managerService.updateMember(memberVo);
				if(cnt>0) {
					msg="수정되었습니다.";
				}else {
					msg="수정이 실패했습니다.";
				}
			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		return "common/message";

	}
	
	@RequestMapping("/pwdEdit.do")
	public String passwordEdit(HttpSession session, @RequestParam String pwd, String memberId, Model model) {
		String adminId=(String)session.getAttribute("adminId");
		logger.info("회원정보 수정 화면, 파라미탸={}",adminId);
		String msg="", url="/admin/member/memberEdit.do";
		if(adminId==null ||adminId.isEmpty()) {
			model.addAttribute("msg", "로그인을 먼저 하세요");
			model.addAttribute("url", "/admin/login/login.do");
			return"common/message"	;
		}else {

				int cnt=memberService.updatePwd(pwd, memberId);
				if(cnt>0) {
					msg="수정되었습니다.";
				}else {
					msg="수정 실패하였습니다.";
				}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
}