package com.ss.star.mypage.memberShip.controller;

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

import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.mypage.memberShip.model.MSPaymentService;
import com.ss.star.mypage.memberShip.model.MSPaymentVO;
import com.ss.star.smember.model.SMemberService;
import com.ss.star.smember.model.SMemberVO;

@Controller
@RequestMapping("/mypage/membership")
public class MembershipController {

	private Logger logger = LoggerFactory.getLogger(MembershipController.class);
	@Autowired private MSPaymentService mSPaymentService;
	@Autowired private SMemberService sMemberService;
	
	@RequestMapping("/membershipList.do")
	public void membershipList(HttpSession session, Model model, @ModelAttribute SearchVO searchVo) {
		String userid = (String)session.getAttribute("userid");
		logger.info("멤버십 리스트 userid: {}, searchVo: {}", userid, searchVo);
		
		SMemberVO sMemberVo = sMemberService.selectID(userid);
		logger.info("리스트의 sMmemberVo: {}", sMemberVo);

		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVO 에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);

		List<Map<String, Object>> list = mSPaymentService.selectAllPayment(userid, searchVo);
		logger.info("멤버십 리스트 list.size(): {}", list.size());
		
		//전체 레코드 개수 조회
		int totalRecord=mSPaymentService.getTotalRecord(userid);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("멤버십 내역 전체 레코드 개수={}", totalRecord);
		
		model.addAttribute("sMemberVo", sMemberVo);
		model.addAttribute("list", list);
		model.addAttribute("pageVo", pagingInfo);
	}
	
	@RequestMapping("/membershipBuy.do")
	public void membershipBuy() {
		logger.info("멤버십 구매페이지");
	}
	
	@RequestMapping(value="/membershipPayment.do",method=RequestMethod.GET)
	public String membershipPayment(@RequestParam(defaultValue="0") String period, Model model) {
		logger.info("결제페이지 period: {}", period);
		
		if(period.equals("0")) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/mypage/membership/membershipPayment.do");
			return "common/message";
		}
		
		MSPaymentVO mSPaymentVo= new MSPaymentVO();
		if("1m".equals(period)) {
			mSPaymentVo.setpPrice(30000);
			mSPaymentVo.setpContent("1개월");
			mSPaymentVo.setPeriod(1);
		}else if("3m".equals(period)) {
			mSPaymentVo.setpPrice(55000);
			mSPaymentVo.setpContent("3개월");
			mSPaymentVo.setPeriod(3);
		}else if("6m".equals(period)) {
			mSPaymentVo.setpPrice(70000);
			mSPaymentVo.setpContent("6개월");
			mSPaymentVo.setPeriod(6);
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/mypage/membership/membershipPayment.do");
			return "common/message";
		}
		logger.info("mSPaymentVo: {}", mSPaymentVo);
		
		model.addAttribute("mSPaymentVo", mSPaymentVo);
		return "mypage/membership/membershipPayment";
	}
	
	@RequestMapping(value="/membershipPayment.do",method=RequestMethod.POST)
	public String membershipPayment_post(@ModelAttribute MSPaymentVO mSPaymentVo, HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");
		mSPaymentVo.setsMemberId(userid);
		logger.info("결제페이지 mSPaymentVo: {}, 세션 userid: {}", mSPaymentVo, userid);
		
		int cnt = mSPaymentService.msPayment(mSPaymentVo);
		logger.info("결제 처리 결과 cnt: {}", cnt);
		
		String msg="결제가 실패했습니다.",url="/mypage/membership/membershipList.do";
		if(cnt>0) {
			msg="결제가 완료되었습니다.";
			url="/mypage/membership/membershipFinish.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/membershipFinish.do")
	public void membershipFinish(HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");
		logger.info("결제 완료 페이지 userid: {}", userid);
		MSPaymentVO mSPaymentVo = mSPaymentService.PaymentFinish(userid);
		logger.info("결제 완료 페이지 mSPaymentVo: {}", mSPaymentVo);
		
		model.addAttribute("mSPaymentVo", mSPaymentVo);
	}
}
