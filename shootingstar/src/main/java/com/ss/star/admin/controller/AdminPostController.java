package com.ss.star.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ss.star.category.model.CategoryService;
import com.ss.star.category.model.CategoryVO;
import com.ss.star.common.FileUploadUtil3;
import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.member.model.MemberService;
import com.ss.star.portfolio.model.PortfolioImgVO;
import com.ss.star.portfolio.model.PortfolioListVO;
import com.ss.star.portfolio.model.PortfolioService;
import com.ss.star.portfolio.model.PortfolioVO;
import com.ss.star.request.controller.RequestController;
import com.ss.star.request.model.PickAllVO;
import com.ss.star.request.model.RequestImgVO;
import com.ss.star.request.model.RequestListVO;
import com.ss.star.request.model.RequestService;
import com.ss.star.request.model.RequestVO;



@Controller
@RequestMapping("/admin/post")
public class AdminPostController {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);

	@Autowired
	private RequestService requestService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PortfolioService pfService;
	@Autowired 
	private ManagerService managerService;
	@Autowired 
	private CategoryService ctgService;
	@Autowired
	private FileUploadUtil3 fileUploadUtil;

	
	
	@RequestMapping(value="/request.do")
	public String requestEdit(@ModelAttribute SearchVO searchVo, Model model, HttpSession session) {
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

		List<Map<String, Object>> list = requestService.selectAll(searchVo);
		logger.info("견적 글 목록 조회 결과, list.size={}", list.size());
	
		// 전체 레코드 개수 조회
		int totalRecord = requestService.getTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);
		
		//카테고리 가져오기
		List<CategoryVO> cList=ctgService.selectCategoryAll();
		logger.info("카테고리 조회 결과, cList.size={}", cList.size());


		model.addAttribute("list", list);
		model.addAttribute("cList", cList);
		model.addAttribute("pageVo", pagingInfo);
	
		return "admin/post/request";
		
	}
	
	
	@RequestMapping(value="/reqDetail.do")
	public String requestDetail(@RequestParam int detailNo, Model model) {
		
		logger.info("선택한 글 번호, detailNo={}", detailNo);
		//상세보기 vo
		RequestVO vo = requestService.selectByNo(detailNo);
		logger.info("상세보기 결과, vo={}", vo);
		//해당 글의 최대 pLevel 가져오기
		int plevel = requestService.getMaxP(detailNo);
		
		//이미지 출력
		List<RequestImgVO> list = requestService.selectByNoImg(detailNo);
		logger.info("파라미터 list, list={}", list);
		//PICK정보
		List<PickAllVO> pList = requestService.selectPList(detailNo);
		logger.info("파라미터pList, pList={}", pList);
		
		model.addAttribute("plevel", plevel);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("pList",pList);
	
		return "admin/post/reqDetail";
			
	}
	
	@RequestMapping(value="/reqDetail2.do")
	public String requestDetail2(@RequestParam int detailNo, Model model) {
		
		logger.info("선택한 글 번호, detailNo={}", detailNo);
		//상세보기 vo
		RequestVO vo = requestService.selectByNo(detailNo);
		logger.info("상세보기 결과, vo={}", vo);
		//해당 글의 최대 pLevel 가져오기
		int plevel = requestService.getMaxP(detailNo);
		
		
		//PICK정보
		List<PickAllVO> pList = requestService.selectPList(detailNo);
		logger.info("파라미터pList, pList={}", pList);
		
		model.addAttribute("plevel", plevel);
		model.addAttribute("vo", vo);
		
		model.addAttribute("pList",pList);
	
		return "admin/post/reqDetail2";
			
	}

	@RequestMapping(value="/reqDetail3.do")
	public String requestDetail3(@RequestParam int sPrice, int RQNo,  Model model) {
		
		//가격 갱신에 사용될 파라미터(금액, 픽번호) map에 넣기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sprice", sPrice);
		map.put("no", RQNo);
		
		int result = requestService.adminUpPrice(map);
		logger.info("최종입력 처리결과 1이상이면 성공, result={}", result);
		
		return "admin/post/reqDetail3";
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

	@RequestMapping(value="/resMulti.do")
	public String resMulti(@ModelAttribute RequestListVO rqListVo,
			HttpServletRequest request, Model model) {
		logger.info("선택한 상품 삭제, 파라미터 pdListVo={}", rqListVo);
		
		List<RequestVO> list=rqListVo.getPdItems();
		
		int cnt=requestService.resMulti(list);
		logger.info("다중복원 결과, cnt={}", cnt);
		
		String msg="", url="/admin/post/request.do";
	
		model.addAttribute("url", url);
		
		return "common/message";
		
		
	}
	
	
	@RequestMapping(value="/portfolio.do")
	public String portfolioEdit(@ModelAttribute SearchVO searchVo, Model model, HttpSession session) {
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
		
		List<Map<String, Object>> pList = pfService.selectAllList2(searchVo);
		logger.info("글 목록 조회 결과, pList.size={}", pList.size());
		
		//전체 레코드 개수 조회
		int totalRecord=pfService.getTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);
		
		//카테고리 가져오기
		List<CategoryVO> cList=ctgService.selectCategoryAll();
		logger.info("카테고리 조회 결과, cList.size={}", cList.size());
				
		model.addAttribute("cList", cList);
		model.addAttribute("pList", pList);
		model.addAttribute("pageVo", pagingInfo);
		model.addAttribute("totalRecord",totalRecord);
				
				
		
		return "admin/post/portfolio";
	}
	
	@RequestMapping(value="/portDetail.do")
	public String portfolio_detail(@RequestParam(defaultValue="0") int pfNo, Model model, HttpSession session) {
		logger.info("포트폴리오 디테일 화면 보여주기, pfNo={}", pfNo);
		
		List<Map<String, Object>> list = pfService.selectPfDetail(pfNo);
		logger.info("포트폴리오 디테일 list.size(): {}", list.size());
		model.addAttribute("list", list);
		
		String smemberid=pfService.detailSmemberId(pfNo);
		model.addAttribute("smemberid", smemberid);
		
		//후기 들어갈 자리
		
		String address = pfService.selectAdd(pfNo);
		model.addAttribute("address",address);
		
	
		return "admin/post/portDetail"; 	
	}
	
	
	@RequestMapping(value="/pdeleteMulti.do")
	public String PdeleteMulti(@ModelAttribute PortfolioListVO pfListVo, Model model, 
			HttpServletRequest request) {
		logger.info("선택한 포폴 삭제, 파라미터 pfListVo={}", pfListVo);
		
		List<PortfolioVO> list=pfListVo.getPdItems();
		
		int cnt=pfService.deleteMulti(list);
		logger.info("다중삭제 결과, cnt={}", cnt);
		
		String msg="", url="/admin/post/portfolio.do";
		
		if(cnt>0) {		
			for(int i=0;i<list.size();i++) {
				
				PortfolioVO vo =list.get(i);
				logger.info(i+" : pfNo={}", vo.getPfNo());
				
				//선택한 글의 이미지 삭제
				if(vo.getPfNo()>0) {
					List<PortfolioImgVO> ilist = new ArrayList<PortfolioImgVO>();
					ilist= pfService.selImgName(vo.getPfNo());
					logger.info("삭제할 글에 해당하는 RequestImgVO, ilist={}", ilist);
					
					//해당 글 번호에 있는 파일이름 구하기
					for(int j=0;j<ilist.size();j++) {
					String fname= ilist.get(j).getFileName();
					logger.info("삭제할 글에 저장된 파일 이름, fname={}", fname);
					
					File file 
					= new File(fileUploadUtil.getUploadPath(request, fileUploadUtil.PATH_FLAG_PDS), fname);
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("이미지 삭제 여부:{}", bool);
					}
				  }
				}
			}//for
			
		}
		model.addAttribute("url", url);
		
		return "common/message";
		
		
	}
	
	@RequestMapping(value="/presMulti.do")
	public String presMulti(@ModelAttribute PortfolioListVO pfListVo,
			HttpServletRequest request, Model model) {
		logger.info("선택한 포폴 복원, 파라미터 pdListVo={}", pfListVo);

		List<PortfolioVO> list=pfListVo.getPdItems();
		
		int cnt=pfService.resMulti(list);
		logger.info("다중복원 결과, cnt={}", cnt);
		
		String msg="", url="/admin/post/portfolio.do";
	
		model.addAttribute("url", url);
		
		return "common/message";
		
		
	}
	
	
	
	
	
}


