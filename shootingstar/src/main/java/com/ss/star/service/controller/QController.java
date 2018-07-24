package com.ss.star.service.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.star.common.PaginationInfo;
import com.ss.star.common.SearchVO;
import com.ss.star.common.Utility;
import com.ss.star.service.model.QService;
import com.ss.star.service.model.QVO;
import com.ss.star.service.model.QdetailVO;

@Controller
@RequestMapping("/SERVICE")
public class QController {
	private static final Logger logger = LoggerFactory.getLogger(QController.class);

	@Autowired
	private QService qService;

	@RequestMapping(value = "/Qwrite.do", method = RequestMethod.GET)
	public String Qwrite_get() {
		logger.info("Q&A 글쓰기 화면");

		return "SERVICE/Qwrite";
	}

	@RequestMapping(value = "/Qwrite.do", method = RequestMethod.POST)
	public String Qwrite_post(@ModelAttribute QVO QVo) {
		logger.info("글쓰기 처리, 파라미터 vo={}", QVo);

		int cnt = qService.insertQ(QVo);
		logger.info("글쓰기 결과, cnt={}", cnt);

		return "redirect:/SERVICE/Qlist.do";
	}

	@RequestMapping("/Qlist.do")
	public String Qlist(@ModelAttribute SearchVO searchVo, Model model, HttpSession Session) {
		logger.info("글 목록, 파라미터 searchVo={}", searchVo);

		// 임시 id 지정
		Session.setAttribute("id", "YBM");

		// [1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		// [2] SearchVO 에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("setting 후 searchVo={}", searchVo);

		List<QVO> list = qService.selectAll(searchVo);
		logger.info("글 목록 조회 결과, list.size={}", list.size());

		// 전체 레코드 개수 조회
		int totalRecord = qService.getTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("전체 레코드 개수={}", totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pageVo", pagingInfo);

		return "SERVICE/Qlist";
	}

	@RequestMapping("/Qdetail.do")
	public String detail(@ModelAttribute QdetailVO QdetailVo, Model model, HttpSession Session) {
		logger.info("상세보기, 파라미터 QdetailVo={}", QdetailVo);

		// 임시 아이디
		Session.setAttribute("id", QdetailVo.getMemberid());
		System.out.println("\ndetail 임시 아이디 id=" + Session.getAttribute("id") + "\n");
		System.out.println("QdetailVo 아이디=" + QdetailVo.getMemberid() + "\n");

		if (QdetailVo.getqNo() == 0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/SERVICE/Qlist.do");
			return "common/message";
		} else if (QdetailVo.getMemberid() != Session.getAttribute("id")) {
			model.addAttribute("msg", "비공개 글입니다.");
			model.addAttribute("url", "/SERVICE/Qlist.do");
			return "common/message";
		}

		QVO vo = qService.selectByNo(QdetailVo.getqNo());
		logger.info("상세보기 결과, vo={}", vo);

		model.addAttribute("vo", vo);

		return "SERVICE/Qdetail";
	}
	
	
/*	@RequestMapping(value="/edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue="0") int no, 
			HttpServletRequest request, Model model) {
		logger.info("수정화면 파라미터 no={}", no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/reBoard/list.do");
			return "common/message";
		}
		
		ReBoardVO vo=reBoardService.selectByNo(no);
		logger.info("수정화면 상세보기 결과, vo={}", vo);
		
		String fileInfo=Utility.getFileInfo(vo.getOriginalFileName(), vo.getFileSize(), request);
		
		model.addAttribute("vo", vo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "reBoard/edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute ReBoardVO reBoardVo, 
			@RequestParam String oldFileName, HttpServletRequest request,
			Model model) {
		logger.info("글수정 처리, 파라미터 vo={}, oldFileName={}",
				reBoardVo, oldFileName);
		
		String msg="", url="/reBoard/edit.do?no="+reBoardVo.getNo();
		if(reBoardService.checkPwd(reBoardVo.getNo(), reBoardVo.getPwd())) {
			//파일 업로드 처리
			String fileName="", originalFileName="";
			long fileSize=0;
			try {
				List<Map<String, Object>> fileList
					=fileUploadUtil.fileUpload(request,fileUploadUtil.PATH_FLAG_PDS);
				
				for(Map<String, Object> map : fileList) {
					fileName=(String) map.get("fileName");
					originalFileName=(String) map.get("originalFileName");
					fileSize=(long) map.get("fileSize");
				}
				
				//업로드 파일의 정보 셋팅
				reBoardVo.setFileName(fileName);
				reBoardVo.setOriginalFileName(originalFileName);
				reBoardVo.setFileSize(fileSize);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}			
			
			int cnt=reBoardService.updateReBoard(reBoardVo);
			logger.info("글수정 결과, cnt={}", cnt);
			if(cnt>0) {
				msg="글 수정 성공";			
				url="/reBoard/detail.do?no="+reBoardVo.getNo();
			}else {
				msg="글 수정 실패";
			}
			
			//새로 업로드하는 파일이 있으면 기존 파일 삭제
			if(fileName!=null && !fileName.isEmpty()) {
				File oldFile 
				= new File(fileUploadUtil.getUploadPath(request,fileUploadUtil.PATH_FLAG_PDS), oldFileName);
				if(oldFile.exists()) {
					boolean bool=oldFile.delete();
					logger.info("기존 파일 삭제 여부:{}", bool);
				}
			}//if
		}else {
			msg="비밀번호가 일치하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete(@RequestParam(defaultValue="0") int no,
			Model model) {
		logger.info("글삭제 화면, 파라미터 no={}", no);
		
		if(no==0) {
			model.addAttribute("msg","잘못된 URL 입니다.");
			model.addAttribute("url","/reBoard/list.do");
			return "common/message";
		}
		
		return "reBoard/delete";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String delete_post(@ModelAttribute ReBoardVO reBoardVo, 
			HttpServletRequest request, Model model) {
		logger.info("글삭제 처리, 파라미터 vo={}", reBoardVo);
		
		String msg="", url="/reBoard/delete.do?no="+reBoardVo.getNo()
			+"&fileName="+reBoardVo.getFileName();
		if(reBoardService.checkPwd(reBoardVo.getNo(), reBoardVo.getPwd())) {
			Map<String, String> map = new HashMap<>();
			map.put("no", reBoardVo.getNo()+"");
			
			reBoardService.deleteReBoard(map);			
			msg="글 삭제 성공";
			url="/reBoard/list.do";	
			
			//파일이 첨부된 경우에는 파일도 삭제처리
			if(reBoardVo.getFileName()!=null && !reBoardVo.getFileName().isEmpty()) {
				File file 
	= new File(fileUploadUtil.getUploadPath(request,fileUploadUtil.PATH_FLAG_PDS), reBoardVo.getFileName());
				if(file.exists()) {
					boolean bool =file.delete();
					logger.info("파일 삭제 여부 : {}", bool);
				}
			}
		}else {
			msg="비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
*/
}