package com.ss.star.request.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ss.star.member.model.MemberVO;
import com.ss.star.payment.model.PayfinishVO;
import com.ss.star.payment.model.PaymentVO;

public interface RequestService {

	public int insertRequest(RequestVO vo, List<Map<String, Object>> fileList);
	public List<RequestVO> selectAll(ctgRequestVO searchVo);
	public int getTotalRecord(ctgRequestVO searchVo);
	public RequestVO selectByNo(int no);
	public List<RequestImgVO> selectByNoImg(int no);
	public int insertPick(RequestPickVO pvo);
	public List<RequestPickVO> pickByNo(int no);
	public List<PickAllVO> selectPList(int no);
	public int updatePlevel (int no);
	public int getPickNo (int no);
	public String getPkMem (int no);
	public PayfinishVO selectPayAll(int no);
	public int insertPayment(PayfinishVO vo);
	public PaymentVO selectByPay(int no);
	public int updatePrice (HashMap<String, Object> map);
	public int getFinalP (int no);
	public int getPLevel (int no);
	public int getPLevel2 (int no);
	public int updateMileage(MemberVO vo);
	public PickAllVO selPvo (int no);
	public int deleteMulti (List<RequestVO> list);
	public List<RequestImgVO> selImgName (int no);
	 
}
