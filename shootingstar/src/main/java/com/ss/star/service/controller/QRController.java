package com.ss.star.service.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public List<QRVO> QRlist(Model model) {
		logger.info("QRlist.do 처리");

		List<QRVO> list = qService.QRList();
		logger.info("댓글 목록 조회 결과, list.size={}", list.size());

		model.addAttribute("list", list);

		return list;

	}

}
