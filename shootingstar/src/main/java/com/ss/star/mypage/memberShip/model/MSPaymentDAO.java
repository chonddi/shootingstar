package com.ss.star.mypage.memberShip.model;

import java.util.Map;

public interface MSPaymentDAO {

	public int updateMembership(Map<String, Object> map);
	public int insertMembership(MSPaymentVO mSPaymentVo);
}
