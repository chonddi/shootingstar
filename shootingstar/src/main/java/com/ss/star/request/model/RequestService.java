package com.ss.star.request.model;

import java.util.List;
import java.util.Map;

import com.ss.star.request.model.ctgRequestVO;
import com.ss.star.common.SearchVO;
import com.ss.star.payment.model.PayfinishVO;

public interface RequestService {

	public int insertRequest(RequestVO vo, List<Map<String, Object>> fileList);
	public List<RequestVO> selectAll(ctgRequestVO searchVo);
	public int getTotalRecord(ctgRequestVO searchVo);
	public RequestVO selectByNo(int no);
	public List<RequestImgVO> selectByNoImg(int no);
	public int insertPick(RequestPickVO pvo);
	public List<RequestPickVO> pickByNo(int no);
	public List<PickAllVO> selectPList(int no);
	public PickAllVO selectByPick(int no);
	public PayfinishVO selectAll(int no);

}
