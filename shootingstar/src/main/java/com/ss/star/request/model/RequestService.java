package com.ss.star.request.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;

import com.ss.star.member.model.MemberVO;
import com.ss.star.payment.model.PayfinishVO;
import com.ss.star.payment.model.PaymentVO;
import com.ss.star.payment.model.TransacInfoVO;

public interface RequestService {

	public int insertRequest(RequestVO vo, List<Map<String, Object>> fileList);
	public List<Map<String, Object>> selectAll(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public int getTotalRecord2(SearchVO searchVo);
	public RequestVO selectByNo(int no);
	public List<RequestImgVO> selectByNoImg(int no);
	public int insertPick(int no);
	public int smemPick(RequestPickVO pvo);
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
	public int getMaxP (int no);
	public int getPLevel (int no);
	public int getPLevel2 (int no);
	public int updateMileage(MemberVO vo);
	public PickAllVO selPvo (int no);
	public int deleteMulti (List<RequestVO> list);
	public int resMulti (List<RequestVO> list);
	public List<RequestImgVO> selImgName (int no);
	public TransacInfoVO ByNoPayment(int no);
	public int ReqCount(); 
	public int pLevel3(int no);
	public List<Map<String, Object>>selectMyAll(String memberId, SearchVO searchVo);
	public int getMyTotalRecord(String memberId, SearchVO searchVo);
	public int adminUpPrice (HashMap<String, Object> map);
}
