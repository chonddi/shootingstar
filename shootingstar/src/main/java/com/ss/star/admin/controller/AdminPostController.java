package com.ss.star.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.admin.model.ManagerService;
import com.ss.star.common.FileUploadUtil3;
import com.ss.star.common.PaginationInfo;
import com.ss.star.common.Utility;
import com.ss.star.member.model.MemberService;
import com.ss.star.request.controller.RequestController;
import com.ss.star.request.model.PickAllVO;
import com.ss.star.request.model.RequestListVO;
import com.ss.star.request.model.RequestImgVO;
import com.ss.star.request.model.RequestService;
import com.ss.star.request.model.RequestVO;
import com.ss.star.request.model.ctgRequestVO;


@Controller
@RequestMapping("/admin/post")
public class AdminPostController {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);

	@Autowired
	RequestService requestService;
	@Autowired
	MemberService memberService;
	@Autowired private ManagerService managerService;
	@Autowired
	private FileUploadUtil3 fileUploadUtil;

	
	
	@RequestMapping(value="/request.do")
	public String requestEdit(@ModelAttribute ctgRequestVO searchVo, Model model, HttpSession session) {
		logger.info("글 목록, 파라미터 searchVo={}", searchVo);

		// [1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		// [2] SearchVO 에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);

		List<RequestVO> list = requestService.selectAll(searchVo);
		logger.info("견적 글 목록 조회 결과, list.size={}", list.size());

		int cno = searchVo.getCgNo();
		if (cno != 0) {
			model.addAttribute("cno", cno);
			logger.info("검색을 적용한 카테고리, cno={}", cno);
		}

		// 전체 레코드 개수 조회
		int totalRecord = requestService.getTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pageVo", pagingInfo);
	
		return "admin/post/request";
		
	}
	
	
	@RequestMapping(value="/reqDetail.do")
	public String requestDetail(@RequestParam int detailNo, Model model) {
		
		logger.info("선택한 글 번호, detailNo={}", detailNo);
		
		RequestVO vo = requestService.selectByNo(detailNo);
		logger.info("상세보기 결과, vo={}", vo);

		List<RequestImgVO> list = requestService.selectByNoImg(detailNo);
		logger.info("파라미터 list, list={}", list);

		List<PickAllVO> pList = requestService.selectPList(detailNo);
		logger.info("파라미터pList, pList={}", pList);
		
		model.addAttribute("no", detailNo);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("pList",pList);

		
		return "admin/post/reqDetail";
			
	}


	
	
	@RequestMapping(value="/deleteMulti.do")
	public String deleteMulti(@ModelAttribute RequestListVO rqListVo,
			HttpServletRequest request, Model model) {
		logger.info("선택한 상품 삭제, 파라미터 pdListVo={}", rqListVo);
		
		List<RequestVO> list=rqListVo.getPdItems();
		
		int cnt=requestService.deleteMulti(list);
		logger.info("다중삭제 결과, cnt={}", cnt);
		
		String msg="", url="/admin/post/request.do";
		
		if(cnt>0) {		
			for(int i=0;i<list.size();i++) {
				
				RequestVO vo =list.get(i);
				logger.info(i+" : RQNo={}", vo.getRQNo());
				
				//선택한 글의 이미지 삭제
				if(vo.getRQNo()>0) {
					List<RequestImgVO> ilist = new ArrayList<RequestImgVO>();
					ilist= requestService.selImgName(vo.getRQNo());
					logger.info("삭제할 글에 해당하는 RequestImgVO, ilist={}", ilist);
					
					//해당 글 번호에 있는 파일이름 구하기
					for(int j=0;j<ilist.size();j++) {
					String fname= ilist.get(j).getFileName();
					logger.info("삭제할 글에 저장된 파일 이름, fname={}", fname);
					
					File file 
					= new File(fileUploadUtil.getUploadPath(request, fileUploadUtil.PATH_FLAG_IMAGE), fname);
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("이미지 삭제 여부:{}", bool);
					}
				  }
				}
			}//for
			
			/*msg="다중 삭제 처리되었습니다.";
		}else {
			msg="다중 삭제처리 중 에러 발생!";*/
		}
		/*model.addAttribute("msg", msg);*/
		model.addAttribute("url", url);
		
		return "common/message";
		
		
	}
	
	
	
	
	@RequestMapping(value="/portfolio.do")
	public String portfolioEdit() {
	
		return "admin/post/portfolio";
	}
	
	

		 	
	 }


