package com.ss.star.request.model;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.request.model.ctgRequestVO;
import com.ss.star.common.SearchVO;


@Service
public class RequestServiceImpl implements RequestService {
	
	@Autowired private RequestDAO requestDao;

	@Override
	@Transactional
	public int insertRequest(RequestVO vo, List<Map<String, Object>> fileList) {
	
		int cnt= requestDao.insertRequest(vo);
		int rqNo=vo.getRQNo();
		try {
	         for(Map<String, Object> map : fileList) {
	               RequestImgVO ivo = new RequestImgVO();
	               ivo.setFileName((String)map.get("fileName"));
	               ivo.setOriginalFileName((String)map.get("originalFileName"));
	               ivo.setRQNo(rqNo);
	               cnt=requestDao.insertReqImg(ivo);
	         }//for
	      }catch(RuntimeException e) {
	         cnt=-1;   //rollback시 에러 처리를 위해 cnt값을 -1로 셋팅
	         e.printStackTrace();
	      }
	      return cnt;
	   }

	@Override
	public List<RequestVO> selectAll(ctgRequestVO searchVo) {
		return requestDao.selectAll(searchVo);
	}

	@Override
	public int getTotalRecord(ctgRequestVO searchVo) {		
		return requestDao.getTotalRecord(searchVo);
	}

	@Override
	public RequestVO selectByNo(int no) {
		return requestDao.selectByNo(no);	
	
	}

	@Override
	public RequestImgVO selectByNoImg(int no) {
		return requestDao.selectByNoImg(no);	
	}
	
	
	
	
	
}

	
	
	

	

