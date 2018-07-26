package com.ss.star.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.ss.star.common.FileUploadUtil2;
import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;
import com.ss.star.smember.model.SMemberService;
import com.ss.star.smember.model.SMemberVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired private MemberService memberService;
	@Autowired private SMemberService sMemberService;
	@Autowired FileUploadUtil2 fileUploadUtil;

	//정보수정
	@RequestMapping(value="/memberEdit.do", method=RequestMethod.GET)
	public String memberEdit(HttpSession session, Model model) {
		String userCode = (String)session.getAttribute("userCode");
		logger.info("회원정보 수정 userCode: {}", userCode);

		if("1".equals(userCode)) {
			String memberId =(String)session.getAttribute("memberId");
			logger.info("회원정보 수정 memberId: {}", memberId);
			MemberVO memberVo= memberService.selectID(memberId);
			model.addAttribute("memberVo", memberVo);

			return "mypage/memberEdit";
		}else if("2".equals(userCode)) {
			String sMemberId =(String)session.getAttribute("sMemberId");
			logger.info("회원정보 수정 sMemberId: {}", sMemberId);
			SMemberVO sMemberVo= sMemberService.selectID(sMemberId);
			model.addAttribute("sMemberVo", sMemberVo);

			return "mypage/sMemberEdit";
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/index.do");
			return "common/message";
		}

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
	
	@RequestMapping("/sMemberEdit.do")
	public String sMemberEdit_post(@ModelAttribute SMemberVO sMemberVo, HttpServletRequest request, HttpSession session, Model model,
				@RequestParam String oldIdenti, @RequestParam String oldAnt) throws IllegalStateException, IOException {
		String sMemberId = (String)session.getAttribute("sMemberId");
		logger.info("전문가 회원정보 수정 sMemberVo:{}, sMemberId: {}", sMemberVo, sMemberId);
		logger.info("기존 파일 identi: {}, ant: {}", oldIdenti, oldAnt);
		
		int result = sMemberService.checkPwd(sMemberId, sMemberVo.getsPwd());
		logger.info("정보수정 비밀번호 확인 결과 result: {}", result);
		
		String msg="", url="/mypage/memberEdit.do";
		if(result==SMemberService.LOGIN_OK) {
			sMemberVo.setsMemberId(sMemberId);
			
			List<Map<String, String>> list = fileUploadUtil.fileUpload(request);
			logger.info("회원가입 파일의 list.size(): {}",list.size());
			
			String identification="", accountCopy="";
			if(list.size()>0) {
				for(Map<String, String> map : list) {
					if(map.get("identiCopy").equals("identi")){
						identification=map.get("originalFileName");
						sMemberVo.setIdentification(identification);
						logger.info("identification: {}, accountCopy: {}", identification, accountCopy);
					}else {
						accountCopy = map.get("originalFileName");
						sMemberVo.setAccountCopy(accountCopy);
						logger.info("identification: {}, accountCopy: {}", identification, accountCopy);
					}
				}
			}
			
			int cnt = sMemberService.updateSMember(sMemberVo);
			logger.info("회원정보 수정 결과, cnt={}", cnt);
			
			if(cnt>0) {
				//올드파일 o x => 삭제
				if(identification !=null && !identification.isEmpty()){
					File file = new File(fileUploadUtil.getUploadPath(request, FileUploadUtil2.PATH_FLAG_IDENTI), oldIdenti);
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("identi 파일 삭제 여부: {}", bool);
					}
				}else if(accountCopy !=null && !accountCopy.isEmpty()) {
					File file = new File(fileUploadUtil.getUploadPath(request, FileUploadUtil2.PATH_FLAG_IDENTI), oldAnt);
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("Ant 파일 삭제 여부: {}", bool);
					}
				}
				
				msg="수정완료";			
			}else {
				msg="글 수정 실패";
			}
			
		}else {
			msg="비밀번호가 틀렸습니다.";
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
		String userCode = (String)session.getAttribute("userCode");
		logger.info("회원정보 수정 userCode: {}", userCode);

		String msg="", url="/index.do";
		if("1".equals(userCode)) {
			String memberId = (String)session.getAttribute("memberId");
			logger.info("탈퇴 처리 memberId: {}", memberId);
			int result = memberService.checkPwd(memberId, chkPwd);
			logger.info("비밀번호 체크 결과 result: {}", result);

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

		}else if("2".equals(userCode)) {

			String sMemberId = (String)session.getAttribute("sMemberId");
			logger.info("탈퇴 처리 sMemberId: {}", sMemberId);
			int result = sMemberService.checkPwd(sMemberId, chkPwd);
			logger.info("비밀번호 체크 결과 result: {}", result);

			if(result==MemberService.LOGIN_OK) {
				//탈퇴
				int cnt = sMemberService.updateOutDate(sMemberId);
				if(cnt>0) {
					//세션 날리기
					session.removeAttribute("sMemberId");
					session.removeAttribute("userCode");
					session.removeAttribute("sName");
					msg="탈퇴되었습니다.";
				}else {
					msg="탈퇴처리가 실패했습니다.";
				}
			}else if(result==SMemberService.PWD_DISAGREE) {
				//비밀번호 틀림
				msg="비밀번호가 틀렸습니다.";
				url="/mypage/del.do";
			}else {
				//잘못된 접근
			}

		}else {
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
	
}
