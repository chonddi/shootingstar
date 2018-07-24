package com.ss.star.request.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
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
import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.request.model.ctgRequestVO;
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
		
	
	@RequestMapping(value="/write2.do")
	public String RequestWrite2P(@RequestParam String cg1 , Model model) {
		
		logger.info("글쓰기 화면");
		
		model.addAttribute("cg1", cg1);
		
		return "request/write2";  
		
	}
	
	
	@RequestMapping(value="/write3.do")
	public String RequestWrite3(@RequestParam String price ,
			@RequestParam String cg1, Model model) {
		
		logger.info("글쓰기 화면 3");
		
		
		NumberFormat nf = new DecimalFormat("#,##0"); 
		Number n;
		int i=0;
		
		try {
			n = nf.parse(price);
			i = n.intValue();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		 
		logger.info("int로 변환 후 price i={}", i);
		
		model.addAttribute("price", i);
		model.addAttribute("cg1", cg1);
				
		return "request/write3";  
		
	}
	

	
	@RequestMapping(value="/write4.do")
	public String request_post(@RequestParam String selOne, String selTwo, String dtSel, String sTime,
			@RequestParam(required=false)String ck1, @RequestParam(required=false)String ck2, String cg1,
			@ModelAttribute RequestVO vo,@ModelAttribute RequestImgVO ivo,  HttpServletRequest request,
			Model model) {
		
		logger.info("고객 회원 - 견적 등록, 파라미터 RequestVO={}", vo);
		logger.info("고객 회원 - 견적 등록, 파라미터 RequetImgVO={}", ivo);
		
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
	
	
		if(cg1.equals("인물/프로필")) {
			vo.setCgNo(1);
		}else if(cg1.equals("푸드")) {
			vo.setCgNo(2);
		}else if(cg1.equals("패션")) {
			vo.setCgNo(3);
		}else if(cg1.equals("웨딩")) {
			vo.setCgNo(4);
		}else if(cg1.equals("행사/컨퍼런스")) {
			vo.setCgNo(5);
		}else if(cg1.equals("건축/인테리어")) {
			vo.setCgNo(6);
		}else if(cg1.equals("공연")) {
			vo.setCgNo(7);
		}else if(cg1.equals("광고")) {
			vo.setCgNo(8);
		}else if(cg1.equals("스냅사진")) {
			vo.setCgNo(9);
		}
		
		vo.setRQRegion(region);
		vo.setRQDate(stime);
		vo.setRQType(rtype);
				
		
		logger.info("setting 후 RequestVO, RequestVO={}", vo);
	
		List<Map<String, Object>> fileList;
		try {
			fileList = fileUploadUtil.fileUpload(request, 
					fileUploadUtil.PATH_FLAG_IMAGE);
			
			logger.info("파일 등록 결과, fileList={}", fileList);
			
			int cnt=requestService.insertRequest(vo, fileList);
			logger.info("견적 등록 결과, cnt={}", cnt);
			
			if(cnt>=0) {
				model.addAttribute("msg", "REQUEST 등록에 성공하였습니다.");
				model.addAttribute("url", "/request/list.do");
				
				return "common/message";
			}
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/request/list.do";  
		
	}
	
	
	
	@RequestMapping("/list.do")
	public String list(@ModelAttribute ctgRequestVO searchVo, Model model) {
		logger.info("글 목록, 파라미터 searchVo={}", searchVo);
		
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVO 에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);
		
		List<RequestVO> list =requestService.selectAll(searchVo);
		logger.info("견적 글 목록 조회 결과, list.size={}", list.size());
		
		
		
		//전체 레코드 개수 조회
		int totalRecord=requestService.getTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);
		
	
		
		model.addAttribute("list", list);
		model.addAttribute("pageVo", pagingInfo);
		
		return "request/list";
	}
	
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam int no, HttpServletRequest request, Model model) {
		logger.info("글 번호, 파라미터 no={}", no);
	
		RequestVO vo=requestService.selectByNo(no);
		logger.info("상세보기 결과, vo={}", vo);
		
		RequestImgVO ivo = requestService.selectByNoImg(no);
		logger.info("파라미터 RequestImgVO, ivo={}", ivo);
		
		
		if(ivo!=null) {
			String fileInfo = Utility.getFileInfo(ivo.getOriginalFileName(), request);
			model.addAttribute("fileInfo", fileInfo);
			}
		
		model.addAttribute("vo", vo);
		model.addAttribute("ivo", ivo);
	
		return "request/detail";
	
	}
}
