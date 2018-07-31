package com.ss.star.mypage.memberShip.model;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MSPaymentServiceImpl implements MSPaymentService{

	@Autowired private MSPaymentDAO mSPaymentDao;
	
	@Override
	@Transactional
	public int msPayment(MSPaymentVO mSPaymentVo) {
		int cnt =0;
		try {
			cnt=mSPaymentDao.insertMembership(mSPaymentVo);
			
			Map<String, Object> map = new HashMap<>();
			map.put("sMemberId", mSPaymentVo.getsMemberId());
			map.put("period", mSPaymentVo.getPeriod());
			
			cnt=mSPaymentDao.updateMembership(map);
			
		}catch (RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
		}
		
		return cnt;
	}

}
