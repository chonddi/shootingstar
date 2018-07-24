package com.ss.star.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;
import com.ss.star.mypage.message.model.SendMsgService;
import com.ss.star.mypage.message.model.SendMsgVO;
import com.ss.star.smember.model.SMemberService;
import com.ss.star.smember.model.SMemberVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired private MemberService memberService;
	@Autowired private SMemberService sMemberService;
	@Autowired private SendMsgService sendMsgService;
	
	//정보수정
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
	
	//회원탈퇴
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
	
	//나의 견적상황
	@RequestMapping("/myRequest.do")
	public void myRequest(HttpSession session) {
		String memberId = (String) session.getAttribute("memberId");
		logger.info("나의 견적상황 화면, 세션 memberId:{}", memberId);
		
	}
	//쪽지
	@RequestMapping("/message/message.do")
	public void message(HttpSession session, Model model) {
		String userCode = (String) session.getAttribute("userCode");
		String userId = "";
		if("1".equals(userCode)) {
			userId=(String)session.getAttribute("memberId");
		}else if("2".equals(userCode)) {
			userId=(String)session.getAttribute("sMemberId");
		}
		logger.info("쪽지목록, userId:{}, userCode:{}",userId, userCode);
		
		
		List<Map<String, Object>> list = sendMsgService.selectSendMsg(userId, userCode);
		logger.info("보낸쪽지 리스트 list.size(): {}", list.size());
		
		model.addAttribute("sendList", list);
	}
	
	@RequestMapping("/message/messageReceive.do")
	public void messageReceive(HttpSession session, Model model) {
		String userCode = (String) session.getAttribute("userCode");
		String userId = "";
		if("1".equals(userCode)) {
			userId=(String)session.getAttribute("memberId");
		}else if("2".equals(userCode)) {
			userId=(String)session.getAttribute("sMemberId");
		}
		logger.info("쪽지목록, userId:{}, userCode:{}",userId, userCode);
		
		List<Map<String, Object>> list = sendMsgService.selectReceiveMsg(userId, userCode);
		logger.info("받은쪽지 리스트 list.size(): {}", list.size());
		
		model.addAttribute("receiveList", list);
	}

	//쪽지쓰기
	@RequestMapping(value="/message/messageWrite.do", method=RequestMethod.GET)
	public void messageWrite() {
		logger.info("쪽지쓰기");
	}
	
	@RequestMapping("/message/messageWriteReceiver.do")
	@ResponseBody
	public int messageWrite_receiver(HttpSession session,@RequestParam String receiver) {
		String userCode=(String)session.getAttribute("userCode");
		logger.info("receiver: {}", receiver);
		
		int result=3;
		if("1".equals(userCode)) {
			result = sMemberService.selectCountSMemberId(receiver);
		}else if("2".equals(userCode)) {
			result = memberService.selectCountMemberId(receiver);
		}
		logger.info("쪽지 키다운 userCode: {}, result: {}", userCode, result);
		return result;
	}
	
	@RequestMapping(value="/message/messageWrite.do", method=RequestMethod.POST)
	public String messageWrite_post(@ModelAttribute SendMsgVO sendMsgVo, HttpSession session, @RequestParam String recipient, Model model) {
		String userCode = (String)session.getAttribute("userCode");
		logger.info("쪽지보내기 userCode: {}, receiver: {}", userCode, recipient);
		
		String userId="";
		if("1".equals(userCode)) {
			userId = (String) session.getAttribute("memberId");
		}else if("2".equals(userCode)) {
			userId = (String) session.getAttribute("sMemberId");
		}
		sendMsgVo.setSender(userId);
		sendMsgVo.setCode(userCode);
		
		logger.info("sendMsgVo: {}", sendMsgVo);
		
		int cnt = sendMsgService.insertAll(sendMsgVo, recipient);
		logger.info("cnt: {}", cnt);
		
		String msg = "", url="/mypage/message/messageWrite.do";
		if(cnt>0) {
			msg="전송되었습니다.";
		}else {
			msg="전송 실패했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
