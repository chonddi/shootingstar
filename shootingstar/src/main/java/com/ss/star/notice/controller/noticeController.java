package com.ss.star.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.faq.model.FaqVO;
import com.ss.star.notice.model.NoticeService;
import com.ss.star.notice.model.NoticeVO;

@Controller

public class noticeController {
private static final Logger logger
=LoggerFactory.getLogger(noticeController.class);
@Autowired NoticeService noticeService;


	@RequestMapping(value="/notice/noticeList.do")
	public String noticeList(Model model) {
		
		/*List<NoticeVO> list = noticeService.selectAll();*/
		List<NoticeVO> list = noticeService.selectAllUser();
		model.addAttribute("list", list);
		
		logger.info("공지사항 페이지! list.size()={}",list.size());
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/admin/notice/noticeAdmin.do")
	public String noticeAdmin(Model model) {
		List<NoticeVO> list = noticeService.selectAll();
		model.addAttribute("list", list);
		logger.info("관리자 공지사항 페이지! list.size()={}",list.size());
		return"admin/notice/noticeAdmin";
	}
	
	@RequestMapping(value="/admin/notice/noticeWrite.do" , method=RequestMethod.GET )
	public String noticeWrite_get() {
		logger.info("관리자 공지사항 작성 페이지!");
		return "admin/notice/noticeWrite";
	}
	
	@RequestMapping(value="/admin/notice/noticeWrite.do" , method=RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo
			) {
		
		int cnt = noticeService.insertNotice(noticeVo);
		logger.info("관리자 공지사항 작성 post!");
		
		return "redirect:/admin/notice/noticeAdmin.do";
	}

	
	@RequestMapping(value="/admin/notice/noticeEdit.do" , method=RequestMethod.GET)
	public String noticeEdit_get(@RequestParam(defaultValue="0") int nNo, Model model) {
		
		NoticeVO vo = noticeService.selectByNo(nNo);
		logger.info("수정화면 nNo={}",nNo);
		
		model.addAttribute("vo", vo);
		logger.info("수정화면");
		return "admin/notice/noticeEdit";
	}
	
	@RequestMapping(value="/admin/notice/noticeEdit.do" , method=RequestMethod.POST)
	public String noticeEdit_post(@ModelAttribute NoticeVO vo) {
		int cnt= noticeService.updateNotice(vo);
		
		logger.info("공지사항 수정 post");
		
		return "redirect:/admin/notice/noticeAdmin.do";
	}
	
	@RequestMapping(value="/admin/notice/noticeDelete.do")
	public String noticeDelete(@RequestParam String[]chk) {
		Map<String, String[]> map = new HashMap<>();
		map.put("nos", chk);
		int cnt=noticeService.deleteMulti(map);
		logger.info("글 삭제 결과, cnt={}", cnt);
		return "redirect:/admin/notice/noticeAdmin.do";
	}
	
	@RequestMapping(value="/admin/notice/noticeBack.do" , method=RequestMethod.GET)
	public String noticeBack_get(@RequestParam int nNo, Model model) {
		NoticeVO vo = noticeService.selectByNo(nNo);
		model.addAttribute("vo", vo);
		logger.info("복구화면, nNo={}",nNo);
		return"admin/notice/noticeBack";
	}
	
	@RequestMapping(value="/admin/notice/noticeBack.do" , method=RequestMethod.POST)
	public String noticeBack_post(@ModelAttribute NoticeVO vo) {
		int cnt=noticeService.noticeBack(vo);
		logger.info("복구성공, cnt={}",cnt);
		return "redirect:/admin/notice/noticeAdmin.do";
	}
	
	@RequestMapping(value="/admin/notice/deleteOne.do" , method=RequestMethod.GET)
	public String deleteOne(@RequestParam int nNo, Model model) {
		NoticeVO vo = noticeService.selectByNo(nNo);
		model.addAttribute("vo", vo);
		logger.info("삭제화면, nNo={}",nNo);
		return"admin/notice/deleteOne";
	}
	@RequestMapping(value="/admin/notice/deleteOne.do" , method=RequestMethod.POST)
	public String deleteOne_post(@ModelAttribute NoticeVO vo) {
		int cnt=noticeService.deleteOne(vo);
		logger.info("1개삭제성공, cnt={}",cnt);
		return "redirect:/admin/notice/noticeAdmin.do";
	}
}
