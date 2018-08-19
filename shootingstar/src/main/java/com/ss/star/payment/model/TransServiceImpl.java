package com.ss.star.payment.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.star.common.SearchVO;

@Service
public class TransServiceImpl implements TransService {

	@Autowired
	private TransDAO transDao;

	@Override
	public List<TransacInfoVO> selectAll(String memberid, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberid", memberid);
		map.put("searchVo", searchVo);
		
		return transDao.selectAll(map);
	}
	
	@Override
	public List<TransacInfoVO2> selectAll2(String sMemberid, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("sMemberid", sMemberid);
		map.put("searchVo", searchVo);
		
		return transDao.selectAll2(map);
	}

	@Override
	public int getTotalRecord(String memberid, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberid", memberid);
		map.put("searchVo", searchVo);
		
		return transDao.getTotalRecord(map);
	}
	
	@Override
	public int getTotalRecord2(String sMemberid, SearchVO searchVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("sMemberid", sMemberid);
		map.put("searchVo", searchVo);
		
		return transDao.getTotalRecord2(map);
	}

	@Override
	public int regitReview(ReviewVO reviewVo) {
		return transDao.regitReview(reviewVo);
	}

	@Override
	public TransacInfoVO selectByNo(int no) {
		return transDao.selectByNo(no);
	}
	
	@Override
	public TransacInfoVO2 selectByNo2(int no) {
		return transDao.selectByNo2(no);
	}

	@Override
	public int updateFlag(int no) {
		return transDao.updateFlag(no);
	}

}
