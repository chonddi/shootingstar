package com.ss.star.request.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ss.star.common.FileUploadUtil3;
import com.ss.star.IndexController;
import com.ss.star.request.model.RequestImgVO;
import com.ss.star.request.model.RequestService;
import com.ss.star.request.model.RequestVO;

@Controller
@RequestMapping("/request")
public class RequestController {

	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);
	
	@Autowired RequestService requestService;
	@Autowired private FileUploadUtil3 fileUploadUtil;
	
	
	@RequestMapping(value="/write.do",  method=RequestMethod.GET)
	public String RequestWrite() {
		//
		logger.info("글쓰기 화면");
				
		return "request/write";  
		
	}
		

	
	@RequestMapping(value="/write2.do",  method=RequestMethod.GET)
	public String RequestWrite2() {
		
		logger.info("글쓰기 화면");
				
		return "request/write2";  
		
	}
	
	@RequestMapping(value="/write2.do",  method=RequestMethod.POST)
	public String RequestWrite2P(@RequestParam String cg1 , Model model) {
		
		logger.info("글쓰기 화면");
		
		model.addAttribute("cg1", cg1);
		
		return "request/write2";  
		
	}
	
	
	@RequestMapping(value="/write3.do",  method=RequestMethod.GET)
	public String RequestWrite3() {
		
		logger.info("글쓰기 화면");
				
		return "request/write3";  
		
	}
	
	@RequestMapping(value="/write3.do",  method=RequestMethod.POST)
	public String RequestWrite3(@RequestParam int price ,
			@RequestParam String cg2, Model model) {
		
		logger.info("글쓰기 화면");
		
		model.addAttribute("price", price);
		model.addAttribute("cg2", cg2);
				
		return "request/write3";  
		
	}
	
	@RequestMapping(value="/detail.do",  method=RequestMethod.GET)
	public String detail_get() {
		
		logger.info("글쓰기 화면");
		
	
				
		return "request/detail";  
		
	}
	
	@RequestMapping(value="/detail.do",  method=RequestMethod.POST)
	public String detail_post(@RequestParam String selOne, String selTwo, String dtSel, String sTime,
			@RequestParam(required=false)String ck1, @RequestParam(required=false)String ck2, String cg2,
			@ModelAttribute RequestVO vo,@ModelAttribute RequestImgVO ivo,  MultipartHttpServletRequest request,
			Model model) {
	
		String region = selOne+selTwo;
		
		String stime ="";
		if(sTime==null) {
			stime=dtSel;
		}else {
			stime=dtSel+", "+sTime;
		}
		

		String rtype="";
		if(ck1==null) {
			rtype=ck2;
		}else if(ck2==null) {
			rtype=ck1;
		}else {
			rtype=ck1+", "+ck2;
		}
	
	
		if(cg2.equals("인물/프로필")) {
			vo.setCgNo(1);
		}else if(cg2.equals("푸드")) {
			vo.setCgNo(2);
		}else if(cg2.equals("패션")) {
			vo.setCgNo(3);
		}else if(cg2.equals("웨딩")) {
			vo.setCgNo(4);
		}else if(cg2.equals("행사/컨퍼런스")) {
			vo.setCgNo(5);
		}else if(cg2.equals("건축/인테리어")) {
			vo.setCgNo(6);
		}else if(cg2.equals("공연")) {
			vo.setCgNo(7);
		}else if(cg2.equals("광고")) {
			vo.setCgNo(8);
		}else if(cg2.equals("스냅사진")) {
			vo.setCgNo(9);
		}
		
		vo.setRQRegion(region);
		vo.setRQDate(stime);
		vo.setRQType(rtype);
				
		
	
	
		List<Map<String, Object>> fileList;
		try {
			fileList = fileUploadUtil.fileUpload(request, 
					fileUploadUtil.PATH_FLAG_IMAGE);
			int cnt=requestService.insertRequest(vo, fileList);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
	
		
		return "request/detail";  
		
	}
	
	
}
