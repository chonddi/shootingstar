package com.ss.star.request.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.star.category.model.CategoryService;
import com.ss.star.category.model.CategoryVO;
import com.ss.star.common.FileUploadUtil3;
import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.member.model.MemberService;
import com.ss.star.member.model.MemberVO;
import com.ss.star.payment.model.TransService;
import com.ss.star.portfolio.model.PortfolioService;
import com.ss.star.request.model.PickAllVO;
import com.ss.star.request.model.RequestImgVO;
import com.ss.star.request.model.RequestListVO;
import com.ss.star.request.model.RequestPickVO;
import com.ss.star.request.model.RequestService;
import com.ss.star.request.model.RequestVO;
import com.ss.star.smember.model.SMemberService;

@Controller
@RequestMapping("/request")
public class RequestController {

	private static final Logger logger = LoggerFactory.getLogger(RequestController.class);

	@Autowired
	private RequestService requestService;
	@Autowired
	private PortfolioService pfService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SMemberService smemService;
	@Autowired 
	private CategoryService ctgService;
	@Autowired
	private TransService transService;
	@Autowired
	private FileUploadUtil3 fileUploadUtil;

	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String RequestWrite() {
		//
		logger.info("글쓰기 화면");

		return "request/write";
	}

	@RequestMapping(value = "/write2.do")
	public String RequestWrite2P(@RequestParam int cg1, Model model) {

		logger.info("글쓰기 화면2");

		//카테고리 이름 가져오기
		String ctgName = ctgService.getCtgName(cg1);
		
		model.addAttribute("cname", ctgName);

		return "request/write2";

	}

	@RequestMapping(value = "/write3.do")
	public String RequestWrite3(@RequestParam String price, 
						@RequestParam String cname, Model model) {

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
		model.addAttribute("cname", cname);

		return "request/write3";

	}

	@RequestMapping(value = "/write4.do")
	public String request_post(@RequestParam String selOne, String selTwo, String dtSel, String sTime,
			@RequestParam(required = false) String ck1, @RequestParam(required = false) String ck2, String cname,
			@ModelAttribute RequestVO vo, @ModelAttribute RequestImgVO ivo, HttpServletRequest request,
			HttpSession session, Model model) {

		logger.info("고객 회원 - 견적 등록, 파라미터 RequestVO={}", vo);
		logger.info("고객 회원 - 견적 등록, 파라미터 RequetImgVO={}", ivo);
		logger.info("카테고리이름 cname={}", cname);
		
		String region="";
		if(selOne==null && selTwo==null) {
			region="미선택";
		}
		region = selOne + " " + selTwo;
				
		
		String stime = "";
		if (dtSel==null&&sTime == null) {
			stime = "미선택";
		}else if(dtSel==null&&sTime!=null) {
			stime = "날짜 미정, 선호 시간대-"+sTime;
		}else if(dtSel!=null) {
			stime = dtSel;
		}else if(dtSel==null) {
			stime="미선택";
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
		
		
		String memberid = (String) session.getAttribute("userid");
		int cg1 = ctgService.getCtgNum(cname);
		
		vo.setMemberId(memberid);
		vo.setRQRegion(region);
		vo.setRQDate(stime);
		vo.setRQType(rtype);
		vo.setCgNo(cg1);
		
		logger.info("setting 후 ID, RequestVO={}", vo);
		logger.info("setting 후 RequestVO, RequestVO={}", vo);
		
	

		List<Map<String, Object>> fileList;
		try {
			fileList = fileUploadUtil.fileUpload(request, fileUploadUtil.PATH_FLAG_IMAGE);

			logger.info("파일 등록 결과, fileList={}", fileList);

			int cnt = requestService.insertRequest(vo, fileList);
			logger.info("견적 등록 결과, cnt={}", cnt);
			
			int rqno = vo.getRQNo();
			logger.info("pick을 초기화 할 글 번호, rqno={}", rqno);
			int cnt1 = requestService.insertPick(rqno);
			logger.info("pick 초기화 결과, cnt1={}", cnt1);
			

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
	public String list(@ModelAttribute SearchVO searchVo, Model model, HttpSession session) {
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
		model.addAttribute("vmemberid", memberid);
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

		List<PickAllVO> pList = requestService.selectPList(no);
		logger.info("파라미터pList, pList={}", pList);

		model.addAttribute("no", no);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("pList",pList);
		logger.info("현재 session ID, vmemberid={}", memberid);
		
		
		//전문가 회원일 경우 sdetail로 보낸다
		if(usercode.equals("2")) {
			return "request/sdetail";
		}
		
		//pick레벨이 2 이상일 경우 detail3로 보낸다
		if(pList.size()>=1) {
			int trans=0; 
			for(int i=0;i<pList.size();i++) {		
				trans=pList.get(i).getpLevel();
				if(trans>=2) {
				break; 
				}
			}
				if(trans>=2) {
					return "redirect:detail3.do"; 
				}
				
			}
		//pick레벨이 1 이상일 경우 detail2로 보낸다
		if(pList.size()>=1) {
			int trans=0; 
			for(int i=0;i<pList.size();i++) {		
				trans=pList.get(i).getpLevel();
				
				if(trans>=1) {
					
					break; 
				}
			}
			logger.info("pLevel레벨 1 이상인지 여부, trans={}", trans);
		
			if(trans==1) {
			return "redirect:detail2.do"; 
				}
					
		}		
		//아무 해당사항이 없을 경우 글 상세보기로 이동
		return "request/detail";
	
	}
	

	@RequestMapping("/detail2.do")
	public String detail2(@RequestParam int no, @RequestParam(required=false,defaultValue="0") int pno,  
			Model model, HttpSession session) {
		
		logger.info("detail2 request 글 번호, 파라미터 no={}", no);
		
		String memberid = (String)session.getAttribute("userid");
		String usercode = (String)session.getAttribute("userCode");
		
	
		logger.info("고객인 선택한 pick번호, pickno={}", pno);
		
		int pl=requestService.getPLevel(no);
		logger.info("pLevel 1 이상 갯수, pl={}", pl);
		
		if(pno!=0&&pl==0) {
		//pLevel이 1인 이상인 pick이 없고, 픽번호를 건네받은 경우 pLevel을 1 증가
			int cnt= requestService.updatePlevel(pno);
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
	public String detail3(@ModelAttribute PickAllVO pvo, 
			@RequestParam(defaultValue = "0") int no, Model model, HttpSession session) {
		
		logger.info("request 글 번호, 파라미터 no={}", no);
		logger.info("전문가 최종 입력 정보를 담은 VO, 파라미터 pvo={}", pvo);
		
		//현재 세션 아이디, 유저코드 받아오기
		String userid = (String) session.getAttribute("userid");
		String usercode = (String) session.getAttribute("userCode");
		
		//pick번호 구하기
		int pno = requestService.getPickNo(no);
		logger.info("금액이 수정될 pick의 번호, pno={}", pno);
		
		//거래 완료 후 재진입 방지
		int cnt4 = transService.selectPickNo(pno);

		if (cnt4 > 0) {
			String msg = "잘못된 접근입니다.";
			String url = "/index.do";

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
				
		//고객회원이 detail3.do 요청하는 경우 pvo에 새로운 정보를 담아 보낸다
		PickAllVO pvo2 = new PickAllVO();
		
		if(usercode.equals("1")) {
			pvo2 = requestService.selPvo(pno);
		
		logger.info("고객회원으로 detail3.do 이동시 setting된 pvo, pvo={}", pvo2);
		model.addAttribute("pvo", pvo2);
		}
		
		RequestVO vo = requestService.selectByNo(no);
		logger.info("상세보기 결과, vo={}", vo);
		
		List<RequestImgVO> list = requestService.selectByNoImg(no);
		logger.info("파라미터 list, list={}", list);

		List<PickAllVO> pList = requestService.selectPList(no);
		logger.info("파라미터pList, pList={}", pList);
		
		//현재 request글 작성자 아이디를 담은 vo구하기
		String vname = vo.getMemberId();
		
		MemberVO mvo = memberService.selectID(vname);
		logger.info("파라미터mvo, mvo={}", mvo);
		
		model.addAttribute("mvo",mvo);
		model.addAttribute("no", no);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("pList",pList);
		
		//금액을 구한다
		int rprice = pvo.getsPrice();
		
		if(usercode.equals("1")) {
				rprice = pvo2.getsPrice();
		}
		logger.info("전문가회원의  최종입력 가격, price={}", rprice);	
		
		//가격 갱신에 사용될 파라미터(금액, 픽번호) map에 넣기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("price", rprice);
		map.put("no", pno);

		if(rprice!=0) {
			//결제가격 갱신
			int result = requestService.updatePrice(map);
			if(result>=1) {
				logger.info("최종입력 처리결과 1이상이면 성공, result={}", result);
			}
		}
		
		int pl=requestService.getPLevel2(no);
		logger.info("pl2 갯수가 0이면 pLevel1에서 2으로 증가실시, pl={}", pl);
		
		
		//pLevel 2 이상 pick이 없고, 픽번호를 받은 경우 pLevel을  1 증가
		if(pno!=0&&pl==0) {
			int cnt= requestService.updatePlevel(pno);
			}
		
		if(usercode.equals("2")) {
			return "request/sdetail4";
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
				
				model.addAttribute("idList",idList);
				return "redirect:sdetail2.do";
				}

			}
		
		//pLevel이 2인 이상인 pick이 있으면 fdetail로 보냄
		int pl2=requestService.getPLevel2(no);
		logger.info("pLevel 2 이상 갯수, pl2={}", pl2);
		
		
		if(pl2!=0) {
			return "request/fdetail";
			
			}
		
		//pLevel이 1인 이상인 pick이 있으면 sdetail3으로 보냄
		int pl=requestService.getPLevel(no);
		logger.info("pLevel 1 이상 갯수, pl={}", pl);
		
		
		if(pl!=0) {
			return "redirect:sdetail3.do";
			
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
		int trans=0;
		if(pList.size()>=1) {	 
			
			for(int i=0;i<pList.size();i++) {		
				trans=pList.get(i).getpLevel();
				
				if(trans>=1) {
					break; 
					}
				}
				logger.info("pLevel레벨 2 이상인지 여부, pLevel={}", trans);
			
				if(trans>=1) {
				
					return "redirect:sdetail3.do"; 
				}
			}
			return "request/sdetail2";

	}
	
	@RequestMapping("/sdetail3.do")
	public String sdetail3(@RequestParam int no, HttpSession session, Model model) {
		logger.info("본인이 pick한 request 글 번호, 파라미터 no={}", no);
		
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
		
		//현재 request글 작성자 아이디를 담은 vo구하기
		String vname = vo.getMemberId();
		
		MemberVO mvo = memberService.selectID(vname);
		logger.info("파라미터mvo, mvo={}", mvo);
		
		model.addAttribute("mvo",mvo);
		model.addAttribute("no",no);
		model.addAttribute("vo", vo);
		model.addAttribute("pList", pList);
		model.addAttribute("list", list);
	
		//전문가가 클릭한 글의 pick레벨이 2 이상일 경우 sdetail4로 보낸다
			int trans=0;
			if(pList.size()>=1) {
				for(int i=0;i<pList.size();i++) {		
					trans=pList.get(i).getpLevel();
					
					if(trans>=2) {
						break; 
						}
					}
					logger.info("pLevel레벨 2 이상인지 여부, pLevel={}", trans);
				
					if(trans>=2) {
					return "redirect:sdetail4.do"; 
					}
				}
		return "request/sdetail3";
	
	}
	
	@RequestMapping("/sdetail4.do")
	public String sdetail4(@RequestParam int no, HttpSession session, Model model) {
		logger.info("본인이 pick한 request 글 번호, 파라미터 no={}", no);
		
		String memberid = (String) session.getAttribute("userid");
		logger.info("sdetail4 현재 session 아이디, memberid={}", memberid);
		
		
		int pno = requestService.getPickNo(no);
		String pmem = requestService.getPkMem(pno);
		logger.info("선택받은 pick에 해당하는 id, pmem={}", pmem);
		
	
				
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
	
		//pick된 전문가회원이 아닌 경우 거래완료화면으로 보낸다
		if(!memberid.equals(pmem)) {
			return "request/fdetail";
		}
		
		return "request/sdetail4";
	
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

		int cnt = requestService.smemPick(pvo);
		logger.info("Pick 등록 결과, cnt={}", cnt);

		if (cnt >= 0) {
			model.addAttribute("url", "/request/list.do");

			return "common/message";
		}

		return "redirect:/request/list.do";
	}
	 
	
	
	@RequestMapping(value = "/fdetail.do")
	public String fdetail(@ModelAttribute RequestPickVO pvo, @RequestParam String price, @RequestParam int rqno,
			HttpSession session, Model model) {

		

		return "redirect:/request/fdetail.do";
	}

	
	@RequestMapping(value="/portDetail.do")
	public String portfolio_detail(@RequestParam String sname, Model model, HttpSession session) {
		logger.info("포트폴리오 디테일 화면 보여주기, sname={}", sname);
		
		List<Map<String, Object>> list = pfService.selectPfDetailByN(sname);
		logger.info("포트폴리오 디테일 list.size(): {}", list.size());
		model.addAttribute("list", list);
		
		String smemid=smemService.selectIdByName(sname);
		logger.info("해당 smemberid, smemid={}", smemid);
		model.addAttribute("smemid", smemid);
		
		return "request/portDetail"; 	
	}
	
	@RequestMapping(value="/deleteMulti2.do")
	public String deleteMulti2(@ModelAttribute RequestListVO rqListVo,
			HttpServletRequest request, Model model) {
		logger.info("선택한 상품 삭제, 파라미터 pdListVo={}", rqListVo);
		
		List<RequestVO> list=rqListVo.getPdItems();
		
		int cnt=requestService.deleteMulti(list);
		logger.info("다중삭제 결과, cnt={}", cnt);
		
		String msg="", url="/mypage/myRequest.do";
		
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
}
