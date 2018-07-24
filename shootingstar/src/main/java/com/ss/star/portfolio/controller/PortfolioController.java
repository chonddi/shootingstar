package com.ss.star.portfolio.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ss.star.category.model.CategoryService;
import com.ss.star.category.model.CategoryVO;
import com.ss.star.common.FileUploadUtil;
import com.ss.star.portfolio.model.PortfolioService;
import com.ss.star.portfolio.model.PortfolioVO;

@Controller
@RequestMapping("/portfolio")
public class PortfolioController {
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);
	
	@Autowired CategoryService cgService;

	@Autowired
	private PortfolioService PfService;
	@Autowired private FileUploadUtil fileUploadUtil;

	@RequestMapping(value = "/portfolioList.do", method = RequestMethod.GET)
	public String portfolio_list(Model model) {
		logger.info("포트폴리오 목록 화면 보여주기");
		
		List<CategoryVO> list=cgService.selectCategoryAll();
		logger.info("카테고리 조회 결과, list.size={}", list.size());
		
		
		
		model.addAttribute("list", list);
		
		return "portfolio/portfolioList";
	}

	@RequestMapping(value = "/portfolioWrite.do", method = RequestMethod.GET)
	public void portfolioWrite_get() {
		logger.info("포트폴리오 등록 화면 보여주기");
	}

	@RequestMapping(value = "/portfolioWrite.do", method = RequestMethod.POST)
	public String portfolioWrite_post(HttpSession session,@ModelAttribute PortfolioVO protfolioVo, MultipartHttpServletRequest request)
			throws IOException {
		logger.info("포트폴리오 등록 처리, 파라미터 vo={},protfolioVo");
		String sMemberId = (String) session.getAttribute("sMemberId");
		protfolioVo.setSmemberId(sMemberId);
		
		//파일 업로드 처리
				String fileName="", originalFileName="";
				List<Map<String, Object>> fileList = null;
				try {
					fileList = fileUploadUtil.fileUpload(request, fileUploadUtil.PATH_FLAG_IMAGE);
					System.out.println(fileList.size());
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					logger.info("2M 이상의 파일은 업로드 불가!");
					e.printStackTrace();
				}
				int cnt=PfService.insertPf(protfolioVo, fileList);
	
		return "protfolio/protfolioWrite";
	}
	
	@RequestMapping(value = "/portfolioDetail.do", method = RequestMethod.GET)
	public void portfolio_detail() {
		logger.info("포트폴리오 디테일 화면 보여주기");
	}

}
