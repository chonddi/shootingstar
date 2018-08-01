package com.ss.star.mypage.memberShip.model;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.star.common.SearchVO;

@Service
public class MSPaymentServiceImpl implements MSPaymentService{

	@Autowired private MSPaymentDAO mSPaymentDao;
	
	@Override
	@Transactional
	public int msPayment(MSPaymentVO mSPaymentVo) {
		int cnt =0;
		
		Map<String, Object> dateMap = mSPaymentDao.nowMembership(mSPaymentVo.getsMemberId());
		Timestamp membership = (Timestamp) dateMap.get("MEMBERSHIP");
		Timestamp sysdate = (Timestamp) dateMap.get("SYSDATE");
		
		System.out.println("membership: "+membership+", sysdate: "+sysdate);
		
		try {
			cnt=mSPaymentDao.insertMembership(mSPaymentVo);
			System.out.println("1번째, 결제내역 cnt: "+ cnt);
			
			Map<String, Object> map = new HashMap<>();
			map.put("sMemberId", mSPaymentVo.getsMemberId());
			map.put("period", mSPaymentVo.getPeriod());
			map.put("membership", membership);
			map.put("sysdate", sysdate);
			
			cnt=mSPaymentDao.updateMembership(map);
			System.out.println("2번째, 멤버십 업데이트 cnt: "+ cnt);
			
		}catch (RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public List<Map<String, Object>> selectAllPayment(String sMemberId, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("sMemberId", sMemberId);
		map.put("searchVo", searchVo);
		
		return mSPaymentDao.selectAllPayment(map);
	}
	

	@Override
	public MSPaymentVO PaymentFinish(String sMemberId) {
		return mSPaymentDao.PaymentFinish(sMemberId);
	}

	@Override
	public int getTotalRecord(String sMemberId) {
		return mSPaymentDao.getTotalRecord(sMemberId);
	}


}
