package com.ss.star.faq.controller;

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

import com.ss.star.faq.model.FaqService;
import com.ss.star.faq.model.FaqVO;
import com.ss.star.notice.model.NoticeVO;

@Controller

public class FaqController {
@Autowired FaqService faqService;
public static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	@RequestMapping(value="/faq/faqList.do")
	public String faqList(Model model, @RequestParam(defaultValue="일반") String category) {
		/*List<FaqVO> list = faqService.selectAll(category);*/
		List<FaqVO> list = faqService.selectAllUser(category);
		model.addAttribute("list", list);
		logger.info("faq List list.size={} , category={}",list.size(),category);

		return "faq/faqList";
	}
	
	@RequestMapping(value="/admin/faq/faqAdmin.do")
	public String faqAdmin(Model model, @RequestParam(defaultValue="일반") String category) {
		List<FaqVO> list = faqService.selectAll(category);
		model.addAttribute("list", list);
		logger.info("faq admin list.size={} , category={}",list.size(),category);

		return "admin/faq/faqAdmin";
	}

	@RequestMapping(value="/admin/faq/faqAll.do")
	public String faqList(Model model) {
		List<FaqVO> list = faqService.selectList();
		model.addAttribute("list", list);
		logger.info("faq List list.size={}",list.size());

		return "admin/faq/faqAdmin";
	}
	
	@RequestMapping(value="/admin/faq/faqWrite.do", method=RequestMethod.GET)
	public String faqWrite() {
		logger.info("faq write");
		return "admin/faq/faqWrite";
	}
	
	@RequestMapping(value="/admin/faq/faqWrite.do", method=RequestMethod.POST)
	public String faqWrite_post(@ModelAttribute FaqVO faqVo) {
		int cnt=faqService.insertFaq(faqVo);
		logger.info("faq 작성! cnt={}",cnt);
		return"redirect:/admin/faq/faqAll.do";
	}
	
	@RequestMapping(value="/admin/faq/deleteFaq.do")
	public String noticeDelete(@RequestParam String[]chk) {
		Map<String, String[]> map = new HashMap<>();
		map.put("nos", chk);
		int cnt=faqService.deleteMulti(map);
		logger.info("글 삭제 결과, cnt={}", cnt);
		return "redirect:/admin/faq/faqAll.do";
	}
	
	@RequestMapping(value="/admin/faq/deleteOne.do" , method=RequestMethod.GET)
	public String deleteOne(@RequestParam int faqNo, Model model) {
		FaqVO vo = faqService.selectByNo(faqNo);
		model.addAttribute("vo", vo);
		logger.info("삭제화면, faqNo={}",faqNo);
		return"admin/faq/deleteOne";
	}
	
	@RequestMapping(value="/admin/faq/deleteOne.do" , method=RequestMethod.POST)
	public String deleteOne_post(@ModelAttribute FaqVO vo) {
		int cnt=faqService.deleteOne(vo);
		logger.info("1개삭제성공, cnt={}",cnt);
		return "redirect:/admin/faq/faqAll.do";
	}
	
	@RequestMapping(value="/admin/faq/faqBack.do" , method=RequestMethod.GET)
	public String faqBack(@RequestParam int faqNo, Model model) {
		FaqVO vo = faqService.selectByNo(faqNo);
		model.addAttribute("vo", vo);
		logger.info("복구화면, faqNo={}",faqNo);
		return"admin/faq/faqBack";
	}
	
	@RequestMapping(value="/admin/faq/faqBack.do" , method=RequestMethod.POST)
	public String faqBack_post(@ModelAttribute FaqVO vo) {
		int cnt=faqService.faqBack(vo);
		logger.info("복구성공, cnt={}",cnt);
		return "redirect:/admin/faq/faqAll.do";
		
	}
	
	@RequestMapping(value="/admin/faq/faqEdit.do", method=RequestMethod.GET)
	public String faqEdit(@RequestParam int faqNo, Model model) {
		FaqVO vo = faqService.selectByNo(faqNo);
		model.addAttribute("vo", vo);
		logger.info("수정화면, faqNo={}",faqNo);
		return"admin/faq/faqEdit";
	}
	
	@RequestMapping(value="/admin/faq/faqEdit.do", method=RequestMethod.POST)
	public String faqEdit_post(@ModelAttribute FaqVO vo) {
		int cnt=faqService.faqEdit(vo);
		return"redirect:/admin/faq/faqAll.do"	;
	}
	
	
}
