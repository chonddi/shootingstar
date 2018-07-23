package com.ss.star.mypage.controller;

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
import com.ss.star.member.model.MemberVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="/memberEdit.do", method=RequestMethod.GET)
	public String memberEdit(HttpSession session, Model model) {
		String memberId =(String)session.getAttribute("memberId");
		logger.info("회원정보 수정 memberId: {}", memberId);
		
		MemberVO memberVo= memberService.selectID(memberId);
		model.addAttribute("memberVo", memberVo);
		
		return "mypage/memberEdit";
	}
	
	@RequestMapping(value="/memberEdit.do", method=RequestMethod.POST)
	public String memberEdit_post(@ModelAttribute MemberVO memberVo, HttpSession session, Model model) {
		String memberId = (String)session.getAttribute("memberId");
		logger.info("회원정보수정 입력된 vo: {}, session아이디: {}", memberVo, memberId);
		
		int result = memberService.checkPwd(memberId, memberVo.getPwd());
		logger.info("비밀번호 체크 결과 result: {}", result);
		
		String msg="", url="/mypage/memberEdit.do";
		if(result==MemberService.LOGIN_OK) {
			//정보 수정
			memberVo.setMemberId(memberId);
			int cnt = memberService.updateMember(memberVo);
			if(cnt>0) {
				msg="수정되었습니다.";
			}else {
				msg="수정이 실패했습니다.";
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			//비밀번호 틀림
			msg="비밀번호가 틀렸습니다.";
		}else {
			//잘못된 접근
			msg="잘못된 접근입니다.";
			url="/index.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/del.do", method=RequestMethod.GET)
	public void del() {
		logger.info("탈퇴");
	}
	
	@RequestMapping(value="/del.do", method=RequestMethod.POST)
	public String del_post(HttpSession session, Model model, @RequestParam String chkPwd) {
		String memberId = (String)session.getAttribute("memberId");
		logger.info("탈퇴 처리 memberId: {}", memberId);
		int result = memberService.checkPwd(memberId, chkPwd);
		logger.info("비밀번호 체크 결과 result: {}", result);
		
		String msg="", url="/index.do";
		if(result==MemberService.LOGIN_OK) {
			//탈퇴
			int cnt = memberService.updateOutDate(memberId);
			if(cnt>0) {
				//세션 날리기
				session.removeAttribute("memberId");
				session.removeAttribute("userCode");
				session.removeAttribute("name");
				msg="탈퇴되었습니다.";
			}else {
				msg="탈퇴처리가 실패했습니다.";
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			//비밀번호 틀림
			msg="비밀번호가 틀렸습니다.";
			url="/mypage/del.do";
		}else {
			//잘못된 접근
			msg="잘못된 접근입니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
