package com.ss.star.notice.controller;

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
		logger.info("공지사항 페이지!");
		return"notice/noticeList";
	}
	
	@RequestMapping(value="/noticeAdmin.do")
	public String noticeAdmin(Model model) {
		List<NoticeVO> list = noticeService.selectAll();
		model.addAttribute("list", list);
		logger.info("관리자 공지사항 페이지!");
		return"notice/noticeAdmin";
	}
	
	@RequestMapping(value="/noticeWrite.do" , method=RequestMethod.GET )
	public String noticeWrite_get() {
		logger.info("관리자 공지사항 작성 페이지!");
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do" , method=RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo,
			@RequestParam HttpSession getSession ) {

		//로그인하고 세션에서 관리자 아이디 받아와야함..
		String adminId=(String) getSession.getAttribute("adminId");
		noticeVo.setAdminId(adminId);
		
		int cnt = noticeService.insertNotice(noticeVo);
		logger.info("관리자 공지사항 작성 post!");
		
		return "redirect:notice/noticeList";
	}
	
	
}
