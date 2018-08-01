package com.ss.star.mypage.memberShip.model;

import java.util.List;
import java.util.Map;

public interface MSPaymentDAO {

	public Map<String, Object> nowMembership(String sMemberId);
	public int updateMembership(Map<String, Object> map);
	public int insertMembership(MSPaymentVO mSPaymentVo);
	public List<Map<String, Object>> selectAllPayment(Map<String, Object> map);
	public int getTotalRecord(String sMemberId);
	public MSPaymentVO PaymentFinish(String sMemberId);
}
