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
@RequestMapping(value="/faq")
public class FaqController {
@Autowired FaqService faqService;
public static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	@RequestMapping(value="/faqList.do")
	public String faqList(Model model, @RequestParam(defaultValue="일반") String category) {
		List<FaqVO> list = faqService.selectAll(category);
		model.addAttribute("list", list);
		logger.info("faq List list.size={} , category={}",list.size(),category);

		return "faq/faqList";
	}
	
	@RequestMapping(value="/faqAdmin.do")
	public String faqAdmin(Model model, @RequestParam(defaultValue="일반") String category) {
		List<FaqVO> list = faqService.selectAll(category);
		model.addAttribute("list", list);
		logger.info("faq admin list.size={} , category={}",list.size(),category);

		return "faq/faqAdmin";
	}

	@RequestMapping(value="/faqAll.do")
	public String faqList(Model model) {
		List<FaqVO> list = faqService.selectList();
		model.addAttribute("list", list);
		logger.info("faq List list.size={}",list.size());

		return "faq/faqAdmin";
	}
	
	@RequestMapping(value="/faqWrite.do", method=RequestMethod.GET)
	public String faqWrite() {
		logger.info("faq write");
		return "faq/faqWrite";
	}
	
	@RequestMapping(value="/faqWrite.do", method=RequestMethod.POST)
	public String faqWrite_post(@ModelAttribute FaqVO faqVo) {
		int cnt=faqService.insertFaq(faqVo);
		logger.info("faq 작성! cnt={}",cnt);
		return"redirect:/faq/faqAll.do";
	}
	
	@RequestMapping(value="/deleteFaq.do")
	public String noticeDelete(@RequestParam String[]chk) {
		Map<String, String[]> map = new HashMap<>();
		map.put("nos", chk);
		int cnt=faqService.deleteMulti(map);
		logger.info("글 삭제 결과, cnt={}", cnt);
		return "redirect:/faq/faqAll.do";
	}
	
	@RequestMapping(value="/deleteOne.do" , method=RequestMethod.GET)
	public String deleteOne(@RequestParam int faqNo, Model model) {
		FaqVO vo = faqService.selectByNo(faqNo);
		model.addAttribute("vo", vo);
		logger.info("삭제화면, faqNo={}",faqNo);
		return"faq/deleteOne";
	}
	
	@RequestMapping(value="/deleteOne.do" , method=RequestMethod.POST)
	public String deleteOne_post(@ModelAttribute FaqVO vo) {
		int cnt=faqService.deleteOne(vo);
		logger.info("1개삭제성공, cnt={}",cnt);
		return "redirect:/faq/faqAll.do";
	}
	
	@RequestMapping(value="/faqBack" , method=RequestMethod.GET)
	public String faqBack(@RequestParam int faqNo, Model model) {
		FaqVO vo = faqService.selectByNo(faqNo);
		model.addAttribute("vo", vo);
		logger.info("복구화면, faqNo={}",faqNo);
		return"faq/faqBack";
	}
	
	@RequestMapping(value="/faqBack" , method=RequestMethod.POST)
	public String faqBack_post(@ModelAttribute FaqVO vo) {
		int cnt=faqService.faqBack(vo);
		logger.info("복구성공, cnt={}",cnt);
		return "redirect:/faq/faqAll.do";
		
	}
	
	@RequestMapping(value="faqEdit", method=RequestMethod.GET)
	public String faqEdit(@RequestParam int faqNo, Model model) {
		FaqVO vo = faqService.selectByNo(faqNo);
		model.addAttribute("vo", vo);
		logger.info("수정화면, faqNo={}",faqNo);
		return"faq/faqEdit";
	}
	
	@RequestMapping(value="faqEdit", method=RequestMethod.POST)
	public String faqEdit_post(@ModelAttribute FaqVO vo) {
		int cnt=faqService.faqEdit(vo);
		return"redirect:/faq/faqAll.do"	;
	}
	
	
}
