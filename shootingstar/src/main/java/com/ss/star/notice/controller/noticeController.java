package com.ss.star.notice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String notice() {
		logger.info("공지사항 페이지!");
		
		return"notice/noticeList";
	}
/*
	@RequestMapping(value="/noticeList.do")
	public String notice(@RequestParam NoticeVO noticeVo) {
		logger.info("notice 테이블 post!");
		List<NoticeVO> list = noticeService.selectAll();
		
		
		return "notice/noticeList";
	}*/
}
