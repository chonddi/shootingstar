package com.ss.star.notice.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.notice.model.NoticeService;
import com.ss.star.notice.model.NoticeVO;

@Controller
@RequestMapping("/notice")
public class noticeController {
private static final Logger logger
=LoggerFactory.getLogger(noticeController.class);
@Autowired NoticeService noticeService;


	@RequestMapping(value="/noticeList.do")
	public String noticeList(Model model) {
		
		List<NoticeVO> list = noticeService.selectAll();
		model.addAttribute("list", list);
		
		logger.info("공지사항 페이지! list.size()={}",list.size());
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/noticeAdmin.do")
	public String noticeAdmin(Model model) {
		List<NoticeVO> list = noticeService.selectAll();
		model.addAttribute("list", list);
		logger.info("관리자 공지사항 페이지! list.size()={}",list.size());
		return"notice/noticeAdmin";
	}
	
	@RequestMapping(value="/noticeWrite.do" , method=RequestMethod.GET )
	public String noticeWrite_get() {
		logger.info("관리자 공지사항 작성 페이지!");
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do" , method=RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo
			//,@RequestParam HttpSession getSession 
			) {

		//로그인하고 세션에서 관리자 아이디 받아와야함..
		//관리자 아닐 시 false
		/*String adminId=(String) getSession.getAttribute("adminId");
		noticeVo.setAdminId(adminId);*/
		
		int cnt = noticeService.insertNotice(noticeVo);
		logger.info("관리자 공지사항 작성 post!");
		
		return "redirect:/notice/noticeAdmin.do";
	}
	
	@RequestMapping(value="/noticeEdit.do" , method=RequestMethod.GET)
	public String noticeEdit_get(@RequestParam(defaultValue="0") int nNo, Model model) {
		
		NoticeVO vo = noticeService.selectByNo(nNo);
		logger.info("수정화면 nNo={}",nNo);
		
		/*if(nNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			return "common/message";
		}*/
		
		model.addAttribute("vo", vo);
		logger.info("수정화면");
		return "notice/noticeEdit";
	}
	
	@RequestMapping(value="/noticeEdit.do" , method=RequestMethod.POST)
	public String noticeEdit_post(@ModelAttribute NoticeVO vo) {
		int cnt= noticeService.updateNotice(vo);
		
		logger.info("공지사항 수정 post");
		
		return "redirect:/notice/noticeAdmin.do";
	}
	
	@RequestMapping(value="/noticeDelete.do")
	public String noticeDelete(@RequestParam String[]chk) {
		Map<String, String[]> map = new HashMap<>();
		map.put("nos", chk);
		int cnt=noticeService.deleteMulti(map);
		logger.info("글 삭제 결과, cnt={}", cnt);
		return "redirect:/notice/noticeAdmin.do";
	}
	
	@RequestMapping(value="/noticeBack.do" , method=RequestMethod.GET)
	public String noticeBack_get(@RequestParam int nNo, Model model) {
		NoticeVO vo = noticeService.selectByNo(nNo);
		model.addAttribute("vo", vo);
		logger.info("복구화면, nNo={}",nNo);
		return"notice/noticeBack";
	}
	
	@RequestMapping(value="/noticeBack.do" , method=RequestMethod.POST)
	public String noticeBack_post(@ModelAttribute NoticeVO vo) {
		int cnt=noticeService.noticeBack(vo);
		logger.info("복구성공, cnt={}",cnt);
		return "redirect:/notice/noticeAdmin.do";
	}
	
	@RequestMapping(value="/deleteOne.do" , method=RequestMethod.GET)
	public String deleteOne(@RequestParam int nNo, Model model) {
		NoticeVO vo = noticeService.selectByNo(nNo);
		model.addAttribute("vo", vo);
		logger.info("삭제화면, nNo={}",nNo);
		return"notice/deleteOne";
	}
	@RequestMapping(value="/deleteOne.do" , method=RequestMethod.POST)
	public String deleteOne_post(@ModelAttribute NoticeVO vo) {
		int cnt=noticeService.deleteOne(vo);
		logger.info("1개삭제성공, cnt={}",cnt);
		return "redirect:/notice/noticeAdmin.do";
	}
}
