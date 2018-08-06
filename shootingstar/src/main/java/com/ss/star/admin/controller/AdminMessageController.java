package com.ss.star.admin.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.mypage.message.model.SendMsgService;

@Controller
@RequestMapping("/admin/message")
public class AdminMessageController {

	@Autowired private SendMsgService sendMsgService;

		private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
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
			//0806ysh
			if(userId==null) {
				userId = (String) session.getAttribute("adminId");
			}
			
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
			//0806ysh
					if(userId==null) {
						userId = (String) session.getAttribute("adminId");
					}
					
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
		@RequestMapping("/deleteMultiAdmin.do")
		public String deleteMulti(@RequestParam String[] chk, Model model ) {

			if(chk!=null) {
				int i=0;
				for(String no : chk) {
					logger.info("{} : 파라미터 => {}", i++, no);
				}
			}//if
			
			Map<String, String[]> map = new HashMap<>();
			map.put("nos", chk);
			int cnt=0;
			cnt=sendMsgService.rDeleteMultiAdmin(map); 
			//receive 의 child 삭제 이후 send의 parent 삭제할것
			cnt=sendMsgService.deleteMultiAdmin(map);

			logger.info("여러 글 삭제 결과, cnt={}", cnt);
			String msg="", url="/admin/message/message.do";
			
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
