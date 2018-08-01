package com.ss.star.mypage.memberShip.model;

import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;

public interface MSPaymentService {
	
	
	public int msPayment(MSPaymentVO mSPaymentVo);
	public List<Map<String, Object>> selectAllPayment(String sMemberId ,SearchVO searchVo);
	public int getTotalRecord(String sMemberId);
	public MSPaymentVO PaymentFinish(String sMemberId);
}
