package com.ss.star.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.star.common.ExcelMember;
import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class ExcelController {

	private Logger logger = LoggerFactory.getLogger(ExcelController.class);
	@Autowired MemberService memberService;
	
	@RequestMapping(value="/excelMember.do",method=RequestMethod.GET)
    public String excelView(Model model, HttpServletRequest request, HttpServletResponse response)throws Exception{
		logger.info("엑셀 member");
		
        List<MemberVO> memberList=memberService.excelMember();
        ExcelMember exmem = new ExcelMember();
        exmem.xlsxWiter(memberList, request, response);
        
        model.addAttribute("msg", "다운되었습니다.");
        model.addAttribute("url", "/admin/member/memberList.do");
        
        return "common/message";
    }
}
