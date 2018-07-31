package com.ss.star.mypage.memberShip.controller;

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

import com.ss.star.mypage.memberShip.model.MSPaymentService;
import com.ss.star.mypage.memberShip.model.MSPaymentVO;

@Controller
@RequestMapping("/mypage/membership")
public class MembershipController {

	private Logger logger = LoggerFactory.getLogger(MembershipController.class);
	@Autowired private MSPaymentService mSPaymentService;
	
	@RequestMapping("/membershipList.do")
	public void membershipList(HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");
		logger.info("멤버십 리스트 userid: {}", userid);
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
			mSPaymentVo.setPrice(30000);
			mSPaymentVo.setpContent("1개월");
		}else if("3m".equals(period)) {
			mSPaymentVo.setPrice(55000);
			mSPaymentVo.setpContent("3개월");
		}else if("6m".equals(period)) {
			mSPaymentVo.setPrice(70000);
			mSPaymentVo.setpContent("6개월");
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
		logger.info("결제페이지 mSPaymentVo: {}, userid: {}", mSPaymentVo, userid);
		
		mSPaymentVo.setsMemberId(userid);
		int cnt = mSPaymentService.msPayment(mSPaymentVo);
		logger.info("결제 처리 결과 cnt: {}", cnt);
		
		String msg="",url="/mypage/membership/membershipList.do";
		if(cnt>0) {
			msg="결제가 완료되었습니다.";
		}else {
			msg="결제가 실패했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
