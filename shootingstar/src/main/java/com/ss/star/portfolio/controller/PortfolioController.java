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
import com.ss.star.portfolio.model.reviewVO;

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
	public String portfolioWrite_get(Model model) {
		logger.info("포트폴리오 등록 화면 보여주기");
		
		List<CategoryVO> list=cgService.selectCategoryAll();
		logger.info("카테고리 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "portfolio/portfolioWrite";
	}

	@RequestMapping(value = "/portfolioWrite.do", method = RequestMethod.POST)
	public String portfolioWrite_post(HttpSession session,@ModelAttribute PortfolioVO portfolioVo, MultipartHttpServletRequest request, Model model)
			throws IOException {
		logger.info("포트폴리오 등록 처리, 파라미터 vo={}",portfolioVo);
		String smemberId = (String) session.getAttribute("userid");
		portfolioVo.setSmemberId(smemberId);
		
		//파일 업로드 처리
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
		int cnt=pfService.insertPf(portfolioVo, fileList);
		logger.info("포트폴리오 insert 결과 cnt: {}", cnt);
		
		if(cnt>0) {
			PortfolioVO vo = pfService.selectBySmemberId(smemberId);
			int pfNo = vo.getPfNo();
			return "redirect:/portfolio/portfolioDetail.do?pfNo="+pfNo;
		}else {
			model.addAttribute("msg", "등록을 실패했습니다.");
			model.addAttribute("url", "redirect:/portfolio/portfolioWrite.do");
			
			return "common/message";
		}
	}
	
	@RequestMapping("/pofolReadCount.do")
	public String pofolReadCount(@RequestParam(defaultValue="0") int pfNo, Model model ) {
		logger.info("readcount pfNo: {}", pfNo);

		if(pfNo==0) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/portfolio/portfolioList.do");
			return "common/message";
		}
		
		int cnt = pfService.updateReadCount(pfNo);
		logger.info("readcount 처리 후 cnt: {}", cnt);
		
		if(cnt>0) {
			return "redirect:/portfolio/portfolioDetail.do?pfNo="+pfNo;
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/portfolio/portfolioList.do");
			return "common/message";
		}
	}
	
	@RequestMapping(value = "/portfolioDetail.do", method = RequestMethod.GET)
	public String portfolio_detail(@RequestParam(defaultValue="0") int pfNo, Model model) {
		logger.info("포트폴리오 디테일 화면 보여주기, pfNo={}", pfNo);

		if(pfNo==0) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/portfolio/portfolioList.do");
			return "common/message";
		}
		
		List<Map<String, Object>> list = pfService.selectPfDetail(pfNo);
		logger.info("포트폴리오 디테일 list.size(): {}", list.size());
		model.addAttribute("list", list);
		
		List<reviewVO> list2 = pfService.selectReview(pfNo);
		model.addAttribute("list2", list2);
		logger.info("list2 값={}", list2.size());
		
		int reviewSize = list2.size();
		model.addAttribute("reviewSize",reviewSize);
		
		/*String address = pfService.selectAdd(pfNo);
		model.addAttribute("address",address);*/
		
		return "portfolio/portfolioDetail";
		
	}

	@RequestMapping("/pofolImg.do")
	public void pofolImg( ) {
		
	}
}
