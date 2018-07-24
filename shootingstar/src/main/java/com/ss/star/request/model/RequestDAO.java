package com.ss.star.request.model;

import java.util.List;

import com.ss.star.request.model.ctgRequestVO;
import com.ss.star.common.SearchVO;

public interface RequestDAO {
	
	public int insertRequest(RequestVO vo);
	public int insertReqImg(RequestImgVO ivo);
	public List<RequestVO> selectAll(ctgRequestVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public RequestVO selectByNo(int no);
	public RequestImgVO selectByNoImg(int no);

}
