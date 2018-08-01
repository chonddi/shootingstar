package com.ss.star.request.model;

import java.util.List;
import java.util.Map;

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

}
