package com.ss.star.request.model;

import java.util.List;
import java.util.Map;

import com.ss.star.request.model.ctgRequestVO;
import com.ss.star.common.SearchVO;

public interface RequestService {

	public int insertRequest(RequestVO vo, List<Map<String, Object>> fileList);
	public List<RequestVO> selectAll(ctgRequestVO searchVo);
	public int getTotalRecord(ctgRequestVO searchVo);
	public RequestVO selectByNo(int no);
	public RequestImgVO selectByNoImg(int no);
}
