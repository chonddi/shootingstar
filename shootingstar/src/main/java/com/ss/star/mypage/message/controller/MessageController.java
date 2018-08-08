package com.ss.star.mypage.message.controller;

import java.util.HashMap;
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
	public void messageWrite(@RequestParam(required=false) String sMemberId) {
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
		}//0806ysh
		else if("3".equals(userCode)) {
			result=memberService.selectCountMemberId(receiver);
			if(result==0) {
				result = sMemberService.selectCountSMemberId(receiver);
			}
		}
		logger.info("쪽지 키다운 userCode: {}, result: {}", userCode, result);
		return result;
	}

	@RequestMapping(value="/messageWrite.do", method=RequestMethod.POST)
	public String messageWrite_post(@ModelAttribute SendMsgVO sendMsgVo, HttpSession session, @RequestParam String recipient, Model model) {
		String userCode = (String) session.getAttribute("userCode");
		logger.info("쪽지보내기 userCode: {}, receiver: {}", userCode, recipient);

		String userId=(String) session.getAttribute("userid");
		//0806ysh
				if(userId==null) {
					userId = (String) session.getAttribute("adminId");
				}
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
	public String messageDetail(@RequestParam(defaultValue="0") int sMsgNo, HttpSession session, Model model) {
		String userCode = (String)session.getAttribute("userCode");
		logger.info("보낸쪽지 디테일 입력된 값 sMsgNo: {}, userCode: {}", sMsgNo, userCode);
		String userid = (String) session.getAttribute("userid");
		//0806ysh
		if(userid==null) {
			userid = (String) session.getAttribute("adminId");
		}
		logger.info("userid: {}",userid);
		
		if(sMsgNo==0) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/index.do");
			
			return "common/message";
		}
		
		int result = sendMsgService.selectDetailChk(sMsgNo, session);
		logger.info("디테일 체크 결과 result: {}", result);
		
		if(result==sendMsgService.SESSION_CHECK_OK) {
			Map<String, Object> map=sendMsgService.selectDetail(sMsgNo);
			logger.info("map.size(): {}", map.size());
			model.addAttribute("map", map);
			
			return "mypage/message/messageDetail";
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/index.do");
			
			return "common/selfClose";
		}
		
	}
	
	@RequestMapping("/messageDetailRead.do")
	public String messageDetailRead(@RequestParam(defaultValue="0") int sMsgNo, HttpSession session, Model model){
		String userCode = (String)session.getAttribute("userCode");
		logger.info("받은쪽지 안읽은 상태 디테일 입력된 값 sMsgNo: {}, userCode: {}", sMsgNo, userCode);
		String userid = (String) session.getAttribute("userid");
		//0806ysh
		if(userid==null) {
			userid = (String) session.getAttribute("adminId");
		}
		logger.info("userid: {}",userid);
		
		
		if(sMsgNo==0) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/selfClose.do");
			
			return "common/message";
		}
		
		int result = sendMsgService.selectDetailChk2(sMsgNo, session);
		logger.info("디테일 체크 결과 result: {}", result);
		
		if(result==sendMsgService.SESSION_CHECK_OK) {
			int cnt = sendMsgService.updateRead(sMsgNo);
			if(cnt>0) {
				return "redirect:/mypage/message/messageDetail2.do?sMsgNo="+sMsgNo;
			}else {
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "/selfClose.do");

				return "common/message";
			}
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/selfClose.do");
			
			return "common/selfClose";
		}
		
	}

	@RequestMapping("/messageDetail2.do")
	public String messageDetail2(@RequestParam(defaultValue="0") int sMsgNo, HttpSession session, Model model) {
		String userCode = (String)session.getAttribute("userCode");
		logger.info("받은쪽지 안읽은 상태 디테일 입력된 값 sMsgNo: {}, userCode: {}", sMsgNo, userCode);
		String userid = (String) session.getAttribute("userid");
		//0806ysh
		if(userid==null) {
			userid = (String) session.getAttribute("adminId");
		}
		logger.info("userid: {}",userid);
		
		if(sMsgNo==0) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/selfClose.do");
			
			return "common/message";
		}
		
		int result = sendMsgService.selectDetailChk2(sMsgNo, session);
		logger.info("디테일 체크 결과 result: {}", result);
		
		if(result==sendMsgService.SESSION_CHECK_OK) {
			Map<String, Object> map=sendMsgService.selectDetail(sMsgNo);
			logger.info("map.size(): {}", map.size());
			model.addAttribute("map", map);
			
			return "mypage/message/messageDetail2";
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/selfClose.do");
			
			return "common/selfClose";
		}
	}
	
	@RequestMapping("/deleteMulti.do")
	public String deleteMulti(@RequestParam String[] chk, Model model) {
		logger.info("여러 글 삭제 chk.length: {}", chk.length);

		if(chk!=null) {
			int i=0;
			for(String no : chk) {
				logger.info("{} : 파라미터 => {}", i++, no);
			}
		}//if
		
		Map<String, String[]> map = new HashMap<>();
		map.put("nos", chk);
		int cnt=0;
		String msg="", url="";
		
			cnt=sendMsgService.deleteMulti(map);
			url="/mypage/message/message.do";
		
		logger.info("여러 글 삭제 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="삭제되었습니다.";
		}else {
			msg="삭제를 실패했습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/rDeleteMulti.do")
	public String rDeleteMulti(@RequestParam String[] chk, Model model) {
		logger.info("여러 글 삭제 chk.length: {}", chk.length);
		
		if(chk!=null) {
			int i=0;
			for(String no : chk) {
				logger.info("{} : 파라미터 => {}", i++, no);
			}
		}//if
		
		Map<String, String[]> map = new HashMap<>();
		map.put("nos", chk);
		int cnt=sendMsgService.rDeleteMulti(map);
		logger.info("여러 글 삭제 결과, cnt={}", cnt);
		
		String msg="", url="/mypage/message/messageReceive.do";
		if(cnt>0) {
			msg="삭제되었습니다.";
		}else {
			msg="삭제를 실패했습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
