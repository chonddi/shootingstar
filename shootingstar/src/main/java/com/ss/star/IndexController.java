package com.ss.star;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.star.common.PaginationInfo;
import com.ss.star.request.model.RequestService;
import com.ss.star.request.model.RequestVO;
import com.ss.star.smember.model.SMemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	@Autowired
	RequestService requestService;
	@Autowired
	SMemberService smemService;
	
	
	@RequestMapping(value = "/index.do")
	public String home(Model model) {
		logger.info("Welcome index!");
		
		//index화면에 등록 전문가 수와 견적 요청 수를 표시할 파라미터 전달
		int totalRecord = requestService.ReqCount();
		logger.info("전체 레코드 개수={}", totalRecord);
		
		int totalmem = smemService.selCount();
		
		model.addAttribute("total", totalRecord);
		model.addAttribute("tmem",totalmem);
		
		return "index";
	}

	
	@RequestMapping(value = "/common/selfClose.do", method = RequestMethod.GET)
	public String selfClose() {
		logger.info("selfClose");
		return "/common/selfClose";
	}
	
}

