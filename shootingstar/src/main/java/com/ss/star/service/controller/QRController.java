package com.ss.star.service.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.star.service.model.QRVO;
import com.ss.star.service.model.QService;

@Controller
@RequestMapping("/SERVICE")
public class QRController {
	private static final Logger logger = LoggerFactory.getLogger(QController.class);

	@Autowired
	private QService qService;

	@RequestMapping("/QRlist.do")
	@ResponseBody
	public List<QRVO> QRlist(@ModelAttribute QRVO QRVo, Model model) {
		logger.info("QRlist, 파라미터 QRVO={}", QRVo);

		List<QRVO> list = qService.QRList(QRVo.getqNo());
		logger.info("댓글 목록 조회 결과, list.size={}", list.size());

		model.addAttribute("list", list);

		return list;

	}

	@RequestMapping("/QRwrite.do")
	@ResponseBody
	public String Qwrite(@ModelAttribute QRVO QRVo) {
		logger.info("댓글쓰기 처리, 파라미터 vo={}", QRVo);

		int cnt = qService.insertQR(QRVo);
		logger.info("댓글쓰기 결과, cnt={}", cnt);

		return "success";
	}

	@RequestMapping("/QRreply.do")
	@ResponseBody
	public String reply(@ModelAttribute QRVO QRVo) {
		logger.info("대댓글쓰기 처리, 파라미터 vo={}", QRVo);

		int cnt = qService.insertQR(QRVo);
		logger.info("대댓글쓰기 결과, cnt={}", cnt);

		return "success";
	}

	@RequestMapping("/QRUpdate.do")
	@ResponseBody
	public String QRUpdate(@ModelAttribute QRVO QRVo) {
		logger.info("댓글수정 처리, 파라미터 QRVo={}", QRVo);

		int cnt = qService.QRUpdate(QRVo);
		logger.info("댓글수정 결과, cnt={}", cnt);

		return "success";
	}
	
	@RequestMapping("/QRdetail.do")
	@ResponseBody
	public List<QRVO> detail(@RequestParam(defaultValue="0") int qrNo) {
		logger.info("댓글 상세보기, 파라미터 qrNo={}", qrNo);

		List<QRVO> list = qService.QRselectByNo(qrNo);
		logger.info("상세보기 결과, vo={}", list);

		return list;
	}
	
	

}