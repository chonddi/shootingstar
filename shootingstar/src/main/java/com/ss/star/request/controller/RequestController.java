package com.ss.star.request.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.common.FileUploadUtil3;
import com.ss.star.common.PaginationInfo;
import com.ss.star.common.Utility;
import com.ss.star.payment.model.PaymentVO;
import com.ss.star.request.model.PickAllVO;
import com.ss.star.request.model.RequestImgVO;
import com.ss.star.request.model.RequestPickVO;
import com.ss.star.request.model.RequestService;
import com.ss.star.request.model.RequestVO;
import com.ss.star.request.model.ctgRequestVO;

@Controller
@RequestMapping("/request")
public class RequestController {

	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);

	@Autowired
	RequestService requestService;
	@Autowired
	private FileUploadUtil3 fileUploadUtil;

	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String RequestWrite() {
		//
		logger.info("글쓰기 화면");

		return "request/write";
	}

	@RequestMapping(value = "/write2.do")
	public String RequestWrite2P(@RequestParam String cg1, Model model) {

		logger.info("글쓰기 화면");

		model.addAttribute("cg1", cg1);

		return "request/write2";

	}

	@RequestMapping(value = "/write3.do")
	public String RequestWrite3(@RequestParam String price, @RequestParam String cg1, Model model) {

		logger.info("글쓰기 화면 3");

		NumberFormat nf = new DecimalFormat("#,##0");
		Number n;
		int i = 0;

		try {
			n = nf.parse(price);
			i = n.intValue();
		} catch (ParseException e) {
			e.printStackTrace();
		}

		logger.info("int로 변환 후 price i={}", i);

		model.addAttribute("price", i);
		model.addAttribute("cg1", cg1);

		return "request/write3";

	}

	@RequestMapping(value = "/write4.do")
	public String request_post(@RequestParam String selOne, String selTwo, String dtSel, String sTime,
			@RequestParam(required = false) String ck1, @RequestParam(required = false) String ck2, String cg1,
			@ModelAttribute RequestVO vo, @ModelAttribute RequestImgVO ivo, HttpServletRequest request,
			HttpSession session, Model model) {

		logger.info("고객 회원 - 견적 등록, 파라미터 RequestVO={}", vo);
		logger.info("고객 회원 - 견적 등록, 파라미터 RequetImgVO={}", ivo);

		String region = selOne + " " + selTwo;

		String stime = "";
		if (sTime == null) {
			stime = dtSel;
		} else {
			stime = dtSel + ", " + sTime;
		}

		String rtype = "";

		if (ck1 == null && ck2 == null) {
			rtype = "미선택";
		} else if (ck1 != null && ck2 != null) {
			rtype = ck1 + ", " + ck2;
		} else if (ck1 == null) {
			rtype = ck2;
		} else if (ck2 == null) {
			rtype = ck1;
		}

		if (vo.getRQDate() == null || vo.getRQDate().isEmpty() || vo.getRQDate().equals(" ")) {
			vo.setRQDate("추후협의");
		}

		if (cg1.equals("인물/프로필")) {
			vo.setCgNo(1);
		} else if (cg1.equals("푸드")) {
			vo.setCgNo(2);
		} else if (cg1.equals("패션")) {
			vo.setCgNo(3);
		} else if (cg1.equals("웨딩")) {
			vo.setCgNo(4);
		} else if (cg1.equals("행사/컨퍼런스")) {
			vo.setCgNo(5);
		} else if (cg1.equals("건축/인테리어")) {
			vo.setCgNo(6);
		} else if (cg1.equals("공연")) {
			vo.setCgNo(7);
		} else if (cg1.equals("광고")) {
			vo.setCgNo(8);
		} else if (cg1.equals("스냅사진")) {
			vo.setCgNo(9);
		}

		String memberid = (String) session.getAttribute("userid");
		vo.setMemberId(memberid);
		vo.setRQRegion(region);
		vo.setRQDate(stime);
		vo.setRQType(rtype);

		logger.info("setting 후 ID, RequestVO={}", vo);
		logger.info("setting 후 RequestVO, RequestVO={}", vo);

		List<Map<String, Object>> fileList;
		try {
			fileList = fileUploadUtil.fileUpload(request, fileUploadUtil.PATH_FLAG_IMAGE);

			logger.info("파일 등록 결과, fileList={}", fileList);

			int cnt = requestService.insertRequest(vo, fileList);
			logger.info("견적 등록 결과, cnt={}", cnt);

			if (cnt >= 0) {
				model.addAttribute("url", "/request/list.do");

				return "common/message";
			}

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return "redirect:/request/list.do";

	}

	@RequestMapping("/list.do")
	public String list(@ModelAttribute ctgRequestVO searchVo, Model model, HttpSession session) {
		logger.info("글 목록, 파라미터 searchVo={}", searchVo);

		String memberid = (String) session.getAttribute("userid");
		String usercode = (String) session.getAttribute("userCode");
		logger.info("list.do 실행 후 id={}", memberid);
		logger.info("list.do 실행 후 usercode={}", usercode);

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

		String vmemberid = memberid;

		model.addAttribute("list", list);
		model.addAttribute("pageVo", pagingInfo);
		model.addAttribute("vmemberid", vmemberid);
		model.addAttribute("ucode", usercode);
		logger.info("현재 session의 id={}", memberid);
		logger.info("현재 session의 usercode={}", usercode);

		return "request/list";

	}

	@RequestMapping("/detail.do")
	public String detail(@RequestParam(required=false) int no, HttpServletRequest request, Model model, HttpSession session) {
		logger.info("request 글 번호, 파라미터 no={}", no);

		String memberid = (String) session.getAttribute("userid");
		String usercode = (String) session.getAttribute("userCode");

		RequestVO vo = requestService.selectByNo(no);
		logger.info("상세보기 결과, vo={}", vo);

		List<RequestImgVO> list = requestService.selectByNoImg(no);
		logger.info("파라미터 list, list={}", list);

		String vmemberid = vo.getMemberId();

		List<PickAllVO> pList = requestService.selectPList(no);
		logger.info("파라미터pList, pList={}", pList);

		model.addAttribute("no", no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("pList",pList);
		model.addAttribute("vmemberid", vmemberid);
		logger.info("현재 session ID, vmemberid={}", vmemberid);
		
		
		//전문가 회원일 경우 sdetail로 보낸다
		if(usercode.equals("2")) {
			return "request/sdetail";
		}
		
		//pick레벨이 1 이상일 경우 detail2로 보낸다
		if(pList.size()>=1) {
			int trans=0; 
			for(int i=0;i<pList.size();i++) {		
				trans=pList.get(i).getpLevel();
				
				if(trans>=1) {
					int pno = requestService.getPickNo(no);
					model.addAttribute("pno", pno);
					break; 
				}
			}
			logger.info("pLevel레벨 1 이상인지 여부, trans={}", trans);
			
			if(trans>=1) {
				return "redirect:detail2.do"; 
			}
			
		}
		
		return "request/detail";
		
		
	}

	@RequestMapping("/detail2.do")
	public String detail2(@RequestParam int no, @RequestParam(required=false,defaultValue="0") int pno,  
			Model model, HttpSession session) {
		
		logger.info("request 글 번호, 파라미터 no={}", no);
		
		String memberid = (String)session.getAttribute("userid");
		String usercode = (String)session.getAttribute("userCode");
		
	
		logger.info("pLevel이 1이상인 pick번호, pickno={}", pno);
		
		if(pno!=0) {
		//픽번호를 건네받은 경우 pLevel을 1 증가
			int cnt= requestService.updatePlevel(pno);
			model.addAttribute("pno",pno);
		}
		
		RequestVO vo=requestService.selectByNo(no);
		logger.info("상세보기 결과, vo={}", vo);
		 
		List<RequestImgVO> list = requestService.selectByNoImg(no);
		logger.info("파라미터 list, list={}", list);
		
		
		List<PickAllVO> pList=requestService.selectPList(no);
		logger.info("파라미터pList, pList={}", pList);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("pList",pList);
	
		return "request/detail2";
			
	}

	@RequestMapping("/detail3.do")
	public String detail3(@RequestParam(defaultValue = "0") int no, HttpServletRequest request, Model model,
			HttpSession session) {
		logger.info("request 글 번호, 파라미터 no={}", no);

		// 임시 세션아이디
		session.setAttribute("userid", "abc@naver.com");
		session.setAttribute("userCode", "1");

		String userid = (String) session.getAttribute("userid");
		String usercode = (String) session.getAttribute("userCode");

		if (no == 0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/index.do");
			return "common/message";
		}

		RequestVO vo = requestService.selectByNo(no);
		logger.info("상세보기 결과, vo={}", vo);

		String vmemberid = vo.getMemberId();

		/*PickAllVO pvo = requestService.selectByPick(no);
		logger.info("파라미터pvo, pvo={}", pvo);
*/
		model.addAttribute("vo", vo);
		/*model.addAttribute("pvo", pvo);*/
		model.addAttribute("vmemberid", vmemberid);
		logger.info("현재 session 로그인 id, vmemberid={}", vmemberid);

		if (usercode.equals("2")) {
			return "request/sdetail";
		}

		return "request/detail3";

	}

	@RequestMapping("/sdetail.do")
	public String sdetail(@RequestParam int no, HttpServletRequest request, HttpSession session, Model model) {
		logger.info("request 글 번호, 파라미터 no={}", no);

		String memid = (String) session.getAttribute("userid");
		logger.info("sdetail 현재 session 아이디, userid={}", memid);

		RequestVO vo = requestService.selectByNo(no);
		logger.info("상세보기 결과, vo={}", vo);
		List<RequestImgVO> list = requestService.selectByNoImg(no);
		logger.info("파라미터 list, list={}", list);

		model.addAttribute("no", no);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);

		List<RequestPickVO> idList = requestService.pickByNo(no);
		logger.info("sdetail 파라미터 idList, idList={}", idList);
		
		//현재 Session 아이디와 List에 있는 ID가 하나라도 일치하면 sdetail2로 보냄 
		if (idList.size() >= 1) {
			Boolean trans = false;
			for (int i = 0; i < idList.size(); i++) {
				trans = idList.get(i).getsMemberId().contains(memid);

				if (trans == true) {
					break;
				}
			}
			logger.info("해당 아이디 검색 결과, boolean={}", trans);

			if (trans == true) {
				return "redirect:sdetail2.do";
			}

		}

		return "request/sdetail";
	}

	@RequestMapping("/sdetail2.do")
	public String sdetail2(@RequestParam int no, HttpServletRequest request, HttpSession session, Model model) {
		logger.info("본인이 pick한 request 글 번호, 파라미터 no={}", no);

		String memberid = (String) session.getAttribute("userid");
		logger.info("sdetail2 현재 session 아이디, userid={}", memberid);

		RequestVO vo = requestService.selectByNo(no);
		logger.info("상세보기 결과, vo={}", vo);

		List<PickAllVO> pList = requestService.selectPList(no);
		logger.info("파라미터pList, pList={}", pList);

		List<RequestImgVO> list = requestService.selectByNoImg(no);
		logger.info("파라미터 list, list={}", list);

		model.addAttribute("no", no);
		model.addAttribute("vo", vo);
		model.addAttribute("pList", pList);
		model.addAttribute("list", list);
		
		//전문가가 클릭한 글의 pick레벨이 1 이상일 경우 sdetail3으로 보낸다
		if(pList.size()>=1) {
			int trans=0; 
			for(int i=0;i<pList.size();i++) {		
				trans=pList.get(i).getpLevel();
				
				if(trans>=1) {
					break; 
				}
			}
			logger.info("?대떦 ?꾩씠??寃??寃곌낵, boolean={}", trans);
			
			if(trans>=1) {
				return "redirect:sdetail3.do"; 
			}
	
		}


		return "request/sdetail2";

	}
	
	@RequestMapping("/sdetail3.do")
	public String sdetail3(@RequestParam int no, HttpSession session, Model model) {
		logger.info("蹂몄씤??pick??request 湲 踰덊샇, ?뚮씪誘명꽣 no={}", no);
		
		String memberid = (String) session.getAttribute("userid");
		logger.info("sdetail3 현재 session 아이디, userid={}", memberid);
		
		
		int pno = requestService.getPickNo(no);
		String pmem = requestService.getPkMem(pno);
		logger.info("선택받은 pick에 해당하는 id, pno={}", pno);
		
		RequestVO vo = requestService.selectByNo(no);
		logger.info("상세보기 결과, vo={}", vo);

		List<PickAllVO> pList = requestService.selectPList(no);
		logger.info("파라미터pList, pList={}", pList);

		List<RequestImgVO> list = requestService.selectByNoImg(no);
		logger.info("파라미터 list, list={}", list);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pmem", pmem);
		model.addAttribute("pList", pList);
		model.addAttribute("list", list);
	
		return "request/sdetail3";
	
	}


	@RequestMapping(value = "/addpick.do")
	public String addpick(@ModelAttribute RequestPickVO pvo, @RequestParam String price, @RequestParam int rqno,
			HttpSession session, Model model) {

		String memberid = (String) session.getAttribute("userid");

		NumberFormat nf = new DecimalFormat("#,##0");
		Number n;

		int i = 0;
		try {
			n = nf.parse(price);
			i = n.intValue();
		} catch (ParseException e) {
			e.printStackTrace();
		}

		logger.info("전문가 회원 - pick 등록, 파라미터 RequestPickVO={}", pvo);

		pvo.setsPrice(i);
		pvo.setsMemberId(memberid);
		pvo.setRQNo(rqno);

		logger.info("세팅 후 RequestPickVO={}", pvo);

		model.addAttribute("pvo", pvo);

		int cnt = requestService.insertPick(pvo);
		logger.info("Pick 등록 결과, cnt={}", cnt);

		if (cnt >= 0) {
			model.addAttribute("url", "/request/list.do");

			return "common/message";
		}

		return "redirect:/request/list.do";
	}
	 

}
