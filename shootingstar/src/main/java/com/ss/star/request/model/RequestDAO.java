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
	public List<RequestImgVO> selectByNoImg(int no);
	public int insertPick(RequestPickVO pvo);
	public int getPickCount(int no);
	public int updatePick (int no);
	public List<RequestPickVO> pickByNo(int no);
	public List<PickAllVO> selectPList(int no);
	public PickAllVO selectByPick(int no);

}
