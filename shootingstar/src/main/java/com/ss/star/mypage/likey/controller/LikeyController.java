package com.ss.star.mypage.likey.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.star.category.model.CategoryService;
import com.ss.star.category.model.CategoryVO;
import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.mypage.likey.model.LikeyService;
import com.ss.star.portfolio.controller.PortfolioController;

@Controller
public class LikeyController {

	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);
	@Autowired LikeyService likeyService;
	@Autowired CategoryService cgService;
	
	@RequestMapping("/likey/heart.do")
	@ResponseBody
	public int heart(@RequestParam(defaultValue="0") int pfNo, HttpSession session) {
		String userCode=(String)session.getAttribute("userCode");
		logger.info("관심등록 pfNo: {}, userCode: {}", pfNo, userCode);
		int result=0;
		
		if(pfNo==0) {
			result=1;   //pfNo 에러 ->잘못된접근
			logger.info("result: {}", result);
			return result;
		}
		
		if(!"1".equals(userCode)) {
			result=2;   //고객회원으로 로그인
			logger.info("result: {}", result);
			return result;
		}else {
			String memberId = (String)session.getAttribute("userid");
			int cnt = likeyService.countLikey(memberId, pfNo);
			logger.info("countLikey cnt: {}", cnt);
			
			if(cnt>0) {
				likeyService.deleteLikey(memberId, pfNo);
				result=3;
				logger.info("result: {}", result);	//관심삭제
			}else {
				likeyService.insertLikey(memberId, pfNo);
				result=4;
				logger.info("result: {}", result);	//관심등록
			}
		}
		return result;
		
	}
	
	@RequestMapping("/mypage/myLikey.do")
	public void myLikey(@ModelAttribute SearchVO searchVo,HttpSession session, Model model) {
		String userid= (String)session.getAttribute("userid");
		logger.info("나의 관심목록 화면 userid: {}", userid);
		
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_MYPOFOL);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVO 에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_MYPOFOL);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);
		
		
		List<Integer> list = likeyService.myLikey(userid);
		logger.info("myLikey id로 pfNo조회 결과 list.size: {}", list.size());
		
		List<Map<String, Object>> myLikeyList=null;
		if(list.size()>0) {
			myLikeyList = likeyService.myLikeyList(list, searchVo);
			logger.info("글 목록 조회 결과, myLikeyList.size: {}", myLikeyList.size());
			
			//전체 레코드 개수 조회
			int totalRecord=likeyService.getTotalMyLikey(list, searchVo);
			pagingInfo.setTotalRecord(totalRecord);
			logger.info("전체 레코드 개수={}", totalRecord);
		}
		//카테고리 가져오기
		List<CategoryVO> cgList=cgService.selectCategoryAll();
		logger.info("카테고리 조회 결과, cgList.size={}", cgList.size());
		
		model.addAttribute("pageVo", pagingInfo);
		model.addAttribute("myLikeyList", myLikeyList);
		model.addAttribute("cgList", cgList);
	}
}
