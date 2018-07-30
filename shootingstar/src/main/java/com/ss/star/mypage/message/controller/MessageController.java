package com.ss.star.mypage.message.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.member.model.MemberService;
import com.ss.star.mypage.message.model.SendMsgService;
import com.ss.star.mypage.message.model.SendMsgVO;
import com.ss.star.smember.model.SMemberService;

@Controller
@RequestMapping("/mypage/message")
public class MessageController {

	private Logger logger = LoggerFactory.getLogger(MessageController.class);
	@Autowired private SendMsgService sendMsgService;
	@Autowired private MemberService memberService;
	@Autowired private SMemberService sMemberService;
		
	//보낸쪽지
	@RequestMapping("/message.do")
	public void message(HttpSession session, Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("보낸쪽지 리스트 searchVo: {}", searchVo);
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVO 에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);
		
		String userCode = (String) session.getAttribute("userCode");
		String userId = (String) session.getAttribute("userid");
		
		logger.info("보낸 쪽지목록, userId:{}, userCode:{}",userId, userCode);


		List<Map<String, Object>> list = sendMsgService.selectSendMsg(userId, userCode, searchVo);
		logger.info("보낸쪽지 리스트 list.size(): {}", list.size());
		
		//전체 레코드 개수 조회
		int totalRecord=sendMsgService.getTotalRecord(userId, userCode, searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("보낸 쪽지 전체 레코드 개수={}", totalRecord);
		

		model.addAttribute("sendList", list);
		model.addAttribute("pageVo", pagingInfo);
	}

	//받은 쪽지
	@RequestMapping("/messageReceive.do")
	public void messageReceive(HttpSession session, Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("받은 쪽지 리스트 searchVo: {}", searchVo);
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVO 에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);
		
		String userCode = (String) session.getAttribute("userCode");
		String userId = (String) session.getAttribute("userid");
		
		logger.info("받은 쪽지목록, userId:{}, userCode:{}",userId, userCode);


		List<Map<String, Object>> list = sendMsgService.selectReceiveMsg(userId, userCode, searchVo);
		logger.info("받은 쪽지 리스트 list.size(): {}", list.size());
		
		//전체 레코드 개수 조회
		int totalRecord=sendMsgService.getTotalRecordReceive(userId, userCode, searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("받은 쪽지 전체 레코드 개수={}", totalRecord);
		

		model.addAttribute("receiveList", list);
		model.addAttribute("pageVo", pagingInfo);
	}

	//쪽지쓰기
	@RequestMapping(value="/messageWrite.do", method=RequestMethod.GET)
	public void messageWrite() {
		logger.info("쪽지쓰기");
	}

	@RequestMapping("/messageWriteReceiver.do")
	@ResponseBody
	public int messageWrite_receiver(HttpSession session,@RequestParam String receiver) {
		String userCode=(String)session.getAttribute("userCode");
		logger.info("receiver: {}", receiver);

		int result=0;
		if("1".equals(userCode)) {
			result = sMemberService.selectCountSMemberId(receiver);
		}else if("2".equals(userCode)) {
			result = memberService.selectCountMemberId(receiver);
		}
		logger.info("쪽지 키다운 userCode: {}, result: {}", userCode, result);
		return result;
	}

	@RequestMapping(value="/messageWrite.do", method=RequestMethod.POST)
	public String messageWrite_post(@ModelAttribute SendMsgVO sendMsgVo, HttpSession session, @RequestParam String recipient, Model model) {
		String userCode = (String) session.getAttribute("userCode");
		logger.info("쪽지보내기 userCode: {}, receiver: {}", userCode, recipient);

		String userId=(String) session.getAttribute("userid");
		logger.info("userid: {}", userId);
		
		sendMsgVo.setSender(userId);
		sendMsgVo.setCode(userCode);

		logger.info("sendMsgVo: {}", sendMsgVo);

		int cnt = sendMsgService.insertAll(sendMsgVo, recipient);
		logger.info("cnt: {}", cnt);

		String msg = "", url="/mypage/message/messageWrite.do";
		if(cnt>0) {
			msg="전송되었습니다.";
		}else {
			msg="전송 실패했습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping("/messageDetail.do")
	public String messageDetail(@RequestParam String sender, @RequestParam int sMsgNo, @RequestParam String code, HttpSession session, Model model) {
		logger.info("메세지 디테일 입력된 값 sender: {}, sMsgNo: {}", sender, sMsgNo);
		String userCode = (String)session.getAttribute("userCode");
		logger.info("메세지 디테일 입력된 값 code: {}, userCode: {}", code, userCode);
		String userid = (String) session.getAttribute("userid");
		logger.info("userid: {}",userid);
		
		if(userid.equals(sender)&&code.equals(userCode)) {
			Map<String, Object> map = sendMsgService.selectDetail(sMsgNo);
			logger.info("map.size(): {}", map.size());
			model.addAttribute("map", map);
			
			return "mypage/message/messageDetail";
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/index.do");
			
			return "common/message";
		}
	}
	
	@RequestMapping("/messageDetailRead.do")
	public String messageDetailRead(@RequestParam String recipient, @RequestParam int sMsgNo, @RequestParam String code, HttpSession session, Model model){
		logger.info("메세지 디테일 read, recipient:{}, sMsgNo: {}", recipient, sMsgNo);
		String userCode = (String)session.getAttribute("userCode");
		logger.info("메세지 디테일 read, code: {}", code, userCode);
		String userid = (String) session.getAttribute("userid");
		logger.info("userid: {}",userid);
		
		if(userid.equals(recipient)&&code.equals(userCode)) {
			int cnt = sendMsgService.updateRead(sMsgNo);
			if(cnt>0) {
				model.addAttribute("recipient", recipient);
				model.addAttribute("sMsgNo", sMsgNo);
				model.addAttribute("code", code);
				return "/mypage/message/messageDetail2.do";
			}else {
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "/index.do");
				
				return "common/message";
			}
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/index.do");
			
			return "common/message";
		}
	}

	@RequestMapping("/messageDetail2.do")
	public String messageDetail2(@RequestParam String recipient, @RequestParam int sMsgNo, @RequestParam String code, HttpSession session, Model model) {
		logger.info("메세지 디테일 입력된 값 recipient: {}, sMsgNo: {}", recipient, sMsgNo);
		String userCode = (String)session.getAttribute("userCode");
		logger.info("메세지 디테일 입력된 값 code: {}, userCode: {}", code, userCode);
		String userid = (String) session.getAttribute("userid");
		logger.info("userid: {}",userid);
		
		if(userid.equals(recipient)&&code.equals(userCode)) {
			Map<String, Object> map = sendMsgService.selectDetail(sMsgNo);
			logger.info("map.size(): {}", map.size());
			model.addAttribute("map", map);
			
			return "mypage/message/messageDetail2";
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/index.do");
			
			return "common/message";
		}
	}
}
