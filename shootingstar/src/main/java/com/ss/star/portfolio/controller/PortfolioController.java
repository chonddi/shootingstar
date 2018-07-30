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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ss.star.category.model.CategoryService;
import com.ss.star.category.model.CategoryVO;
import com.ss.star.common.FileUploadUtil;
import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.portfolio.model.PortfolioService;
import com.ss.star.portfolio.model.PortfolioVO;

@Controller
@RequestMapping("/portfolio")
public class PortfolioController {
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);
	
	@Autowired CategoryService cgService;

	@Autowired
	private PortfolioService pfService;
	@Autowired private FileUploadUtil fileUploadUtil;

	@RequestMapping(value = "/portfolioList.do")
	public String portfolio_list(@ModelAttribute SearchVO searchVo ,Model model) {
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVO 에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);
		
		List<Map<String, Object>> vList = pfService.selectAllList(searchVo);
		logger.info("글 목록 조회 결과, vlist.size={}", vList.size());
		
		//전체 레코드 개수 조회
		int totalRecord=pfService.getTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);
		
		//카테고리 가져오기
		List<CategoryVO> list=cgService.selectCategoryAll();
		logger.info("카테고리 조회 결과, list.size={}", list.size());
		
		//카테고리 네임 조회하기
		
				
		model.addAttribute("list", list);
		model.addAttribute("vList", vList);
		model.addAttribute("pageVo", pagingInfo);
		model.addAttribute("totalRecord",totalRecord);
		
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
				int cnt=pfService.insertPf(protfolioVo, fileList);
	
		return "portfolio/protfolioWrite";
	}
	
	@RequestMapping(value = "/portfolioDetail.do", method = RequestMethod.GET)
	public String portfolio_detail(@RequestParam int pfNo, Model model) {
		logger.info("포트폴리오 디테일 화면 보여주기");
		List<Map<String, Object>> list = pfService.selectPfDetail(pfNo);
		model.addAttribute("list", list);
		return "portfolio/portfolioDetail";
		
	}

}
