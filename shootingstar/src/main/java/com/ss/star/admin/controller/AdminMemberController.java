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
import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.faq.model.FaqVO;
import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;
import com.ss.star.smember.model.SMemberService;
import com.ss.star.smember.model.SMemberVO;


@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	@Autowired ManagerService managerService;
	@Autowired MemberService memberService;
	@Autowired SMemberService SmemberService;
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model, @ModelAttribute SearchVO searchVo) {
		// [1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		// [2] SearchVO 에 값 셋팅
		searchVo.setBlockSize(Utility.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);	
				
		List<MemberVO> list = managerService.memberList(searchVo);
		logger.info("List list.size={} ",list.size());
		
		int totalRecord =managerService.getTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pageVo", pagingInfo);
		return "admin/member/memberList";
	}

		@RequestMapping(value="/memberEdit.do" , method=RequestMethod.GET)
		public String memberEdit(Model model , @RequestParam String id) {

			MemberVO memberVo = memberService.selectID(id);
			model.addAttribute("memberVo", memberVo); 
			
			return "admin/member/memberEdit";
		}

	@RequestMapping(value="/memberEdit.do", method=RequestMethod.POST)
	public String memberEdit_post(@ModelAttribute MemberVO memberVo,  Model model) {
	
	
			
			String msg="", url="/admin/member/memberList.do";
			
				int cnt = managerService.updateMember(memberVo);
				if(cnt>0) {
					msg="수정되었습니다.";
				}else {
					msg="수정이 실패했습니다.";
				}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		return "common/message";

	}
	
	@RequestMapping("/pwdEdit.do")
	public String passwordEdit(@RequestParam String pwd, String memberId, Model model) {
		
		String msg="", url="/admin/member/memberList.do";
		

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


	@RequestMapping(value="/smemberList.do")
	public String smemberList(Model model, @ModelAttribute SearchVO searchVo) {
		// [1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		// [2] SearchVO 에 값 셋팅
		searchVo.setBlockSize(Utility.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);	

		List<SMemberVO> list = managerService.sMemberList(searchVo);
		logger.info("Smember List list.size={} ",list.size());
		
		int totalRecord =managerService.getSTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pageVo", pagingInfo);
		return "admin/member/smemberList";
	}
	@RequestMapping(value="/smemberEdit.do" , method=RequestMethod.GET)
	public String SmemberEdit(Model model , @RequestParam String id) {

		SMemberVO smemberVo = SmemberService.selectID(id);
		model.addAttribute("smemberVo", smemberVo); 
		
		return "admin/member/smemberEdit";
	}
	@RequestMapping(value="/smemberEdit.do", method=RequestMethod.POST)
	public String smemberEdit_post(@ModelAttribute SMemberVO smemberVo, Model model) {
	
			String msg="", url="/admin/member/smemberList.do";
			
				int cnt = managerService.updateSMember(smemberVo);
				if(cnt>0) {
					msg="수정되었습니다.";
				}else {
					msg="수정이 실패했습니다.";
				}
	
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		return "common/message";

	}
	
	@RequestMapping("/pwdSEdit.do")
	public String passwordSEdit( @RequestParam String pwd, String sMemberId, Model model) {
		
		String msg="", url="/admin/member/smemberList.do";
		

				int cnt=SmemberService.updatePwd(pwd, sMemberId);
				if(cnt>0) {
					msg="수정되었습니다.";
				}else {
					msg="수정 실패하였습니다.";
				}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
/*

	@RequestMapping(value="/smemberAuOut.do")
	public String smemberAuOut(@RequestParam String id, @ModelAttribute SMemberVO vo, Model model) {
	
	
			String msg="", url="/admin/member/smemberList.do";
			
				SMemberVO Smembervo = SmemberService.selectID(id);
				int cnt = managerService.smemberAuOut(Smembervo);
				if(cnt>0) {
					msg="권한을 뺏었습니다.";
				}else {
					msg="수정이 실패했습니다.";
				}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		return "common/message";

	}
	
	@RequestMapping(value="/smemberAuBack.do")
	public String smemberAuBack(@RequestParam String id, @ModelAttribute SMemberVO vo, Model model) {
	

			String msg="", url="/admin/member/smemberList.do";
			
				SMemberVO Smembervo = SmemberService.selectID(id);
				int cnt = managerService.smemberAuBack(Smembervo);
				if(cnt>0) {
					msg="권한을 돌려주었습니다.";
				}else {
					msg="수정이 실패했습니다.";
				}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		return "common/message";

	}*/

	@RequestMapping(value="/smemberOut.do")
	public String smemberOut(@RequestParam String id, @ModelAttribute SMemberVO vo, Model model) {
	
	
			String msg="", url="/admin/member/smemberList.do";
			
				SMemberVO Smembervo = SmemberService.selectID(id);
				int cnt = managerService.smemberOut(Smembervo);
				if(cnt>0) {
					msg="탈퇴 처리 되었습니다.";
				}else {
					msg="수정이 실패했습니다.";
				}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		return "common/message";

	}
	
	@RequestMapping(value="/smemberBack.do")
	public String smemberBack(@RequestParam String id, @ModelAttribute SMemberVO vo, Model model) {
	
	
			String msg="", url="/admin/member/smemberList.do";
			
				SMemberVO Smembervo = SmemberService.selectID(id);
				int cnt = managerService.smemberBack(Smembervo);
				if(cnt>0) {
					msg="탈퇴 복구 되었습니다.";
				}else {
					msg="수정이 실패했습니다.";
				}
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		return "common/message";

	}	
	
	@RequestMapping(value="/memberOut.do")
	public String memberOut(@RequestParam String id, @ModelAttribute MemberVO vo, Model model) {
	
	
			String msg="", url="/admin/member/memberList.do";
			
				MemberVO membervo = memberService.selectID(id);
				int cnt = managerService.memberOut(membervo);
				if(cnt>0) {
					msg="탈퇴 처리 되었습니다.";
				}else {
					msg="수정이 실패했습니다.";
				}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		return "common/message";

	}
	
	@RequestMapping(value="/memberBack.do")
	public String memberBack(@RequestParam String id, @ModelAttribute MemberVO vo, Model model) {
	
	
			String msg="", url="/admin/member/memberList.do";
		
				MemberVO membervo = memberService.selectID(id);
				int cnt = managerService.memberBack(membervo);
				if(cnt>0) {
					msg="탈퇴 복구 되었습니다.";
				}else {
					msg="수정이 실패했습니다.";
				}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		return "common/message";

	}	
	
	@RequestMapping(value="/smemberOutList.do") //만료회원목록
	public String smemberOutList(Model model, @ModelAttribute SearchVO searchVo) {
		// [1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		// [2] SearchVO 에 값 셋팅
		searchVo.setBlockSize(Utility.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);	

		List<SMemberVO> list = managerService.sMemberOutList(searchVo);
		logger.info("List list.size={} ",list.size());
		
		int totalRecord =managerService.getSOTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pageVo", pagingInfo);

		return "admin/member/smemberOutList";
	}
}