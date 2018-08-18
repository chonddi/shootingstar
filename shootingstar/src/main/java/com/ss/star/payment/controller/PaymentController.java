package com.ss.star.payment.controller;

import java.util.List;

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
import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;
import com.ss.star.payment.model.MileageVO;
import com.ss.star.payment.model.PayfinishVO;
import com.ss.star.payment.model.ReviewVO;
import com.ss.star.payment.model.TransService;
import com.ss.star.payment.model.TransacInfoVO;
import com.ss.star.portfolio.model.PortfolioService;
import com.ss.star.request.model.RequestService;
import com.ss.star.service.controller.QController;
import com.ss.star.service.model.QVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(QController.class);

	@Autowired
	RequestService requestService;
	@Autowired
	MemberService memberService;
	@Autowired
	TransService transService;
	@Autowired
	PortfolioService pfService;

	@RequestMapping("/port_payment.do")
	public String port_payment(@RequestParam(defaultValue = "0") int no, @ModelAttribute MileageVO mileageVo,
			HttpSession session, Model model) {
		logger.info("port_payment 화면 파라미터 no={}", no);
		logger.info("port_payment 화면 파라미터 mileageVo={}", mileageVo);

		if (no == 0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/index.do");
			return "common/message";
		}

		PayfinishVO payfinishVo = requestService.selectPayAll(no);
		logger.info("PayfinishVO 파라미터, payfinishVo={}", payfinishVo);

		// 마일리지 사용한 최종 결제금액 셋팅
		payfinishVo.setsPrice(mileageVo.getPrice());
		// 남은 마일리지 셋팅
		payfinishVo.setMileage(mileageVo.getMileage());
		// 사용한 마일리지 셋팅
		payfinishVo.setUseMile(mileageVo.getUseMile());

		model.addAttribute("payfinishVo", payfinishVo);

		return "payment/port_payment";
	}

	@RequestMapping(value = "/port_payfinish.do", method = RequestMethod.GET)
	public String port_payfinish_get(HttpSession session, Model model) {
		logger.info("결제완료 컨트롤러 get 방식으로 접근 감지");

		String msg = "잘못된 접근입니다.";
		String url = "/index.do";

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping(value = "/port_payfinish.do", method = RequestMethod.POST)
	public String port_payfinish_post(@RequestParam(defaultValue = "0") int RQNo, @ModelAttribute PayfinishVO vo,
			HttpSession session, Model model) {
		logger.info("결제 처리 PayfinishVO 파라미터 RQNo={}", RQNo);
		logger.info("결제 처리 PayfinishVO 파라미터 vo={}", vo);

		if (RQNo == 0) {
			String msg = "잘못된 접근입니다.";
			String url = "/index.do";

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}

		// 마일리지 적립
		double addMileage = Math.ceil(vo.getsPrice() * 0.03); /* 마일리지 3% 적립 */
		int mg = (int) addMileage;
		vo.setMileage(mg); /* 적립된 마일리지 PayfinishVO에 셋팅(거래내역 출력용) */
		MemberVO memberVo = memberService.selectID(vo.getMemberId());
		int mileage = memberVo.getMileage() + mg; /* 기존의 마일리지에 새 마일리지 적립 */
		memberVo.setMileage(mileage); /* memberVo에 다시 셋팅 */

		int cnt = requestService.insertPayment(vo); /* RQPAYMENT(거래내역) 테이블에 DB 추가 */
		int cnt2 = requestService.updateMileage(memberVo); /* 새로 적립된 마일리지 적용 */
		int cnt3 = requestService.pLevel3(vo.getPickNo()); /* pLevel을 3으로 업데이트 */
		logger.info("PaymentVO insert 결과 cnt={},", cnt);
		logger.info("마일리지 업데이트 결과 cnt2={},", cnt2);
		logger.info("pLevel3 업데이트 결과 cnt3={}", cnt3);

		TransacInfoVO transVo = requestService.ByNoPayment(vo.getPickNo());
		logger.info("거래내역 list 불러오기 파라미터 transVo={}", transVo);

		model.addAttribute("vo", transVo);

		return "payment/port_payfinish";

	}

	@RequestMapping("/Tlist.do")
	public String Qlist(@ModelAttribute SearchVO searchVo, Model model, HttpSession Session) {
		logger.info("거래내역 글 목록, 파라미터 searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);

		List<TransacInfoVO> list = transService.selectAll(searchVo);
		logger.info("글 목록 조회 결과, list.size={}", list.size());

		// 전체 레코드 개수 조회
		int totalRecord = transService.getTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pageVo", pagingInfo);

		return "payment/port_transactional";
	}

	@RequestMapping(value = "/Twrite.do", method = RequestMethod.GET)
	public String Twrite_get(@ModelAttribute TransacInfoVO transacVo, @RequestParam(defaultValue = "0") int no,
			Model model, HttpSession session) {
		logger.info("후기 글쓰기 화면, 파라미터 no={}", no);
		
		String userid = (String) session.getAttribute("userid");

		transacVo = transService.selectByNo(no);
		logger.info("후기 글쓰기 화면, 파라미터 transacVo={}", transacVo);
		MemberVO memberVo = memberService.selectID(userid);
		String name = memberVo.getName();
		logger.info("고객 이름 불러오기 name={}", name);
		String cgName = pfService.selCgname(transacVo.getpNo());
		logger.info("카테고리 이름 불러오기 cgName={}", cgName);

		model.addAttribute("transacVo", transacVo);
		model.addAttribute("name", name);
		model.addAttribute("cgName", cgName);

		return "payment/Twrite";
	}

	@RequestMapping(value = "/Twrite.do", method = RequestMethod.POST)
	public String Twrite_post(@ModelAttribute ReviewVO reviewVo) {

		logger.info("후기 글쓰기 처리, 파라미터 reviewVo={}", reviewVo);

		int cnt = transService.regitReview(reviewVo);
		logger.info("후기 글쓰기 결과, cnt={}", cnt);
		int cnt2 = transService.updateFlag(reviewVo.getpNo());
		logger.info("후기 플래그 업데이트 결과, cnt2={}", cnt2);

		return "redirect:/payment/Tlist.do";
	}

}