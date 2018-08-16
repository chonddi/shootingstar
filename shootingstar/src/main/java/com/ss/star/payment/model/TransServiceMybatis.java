package com.ss.star.payment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.star.common.SearchVO;

@Service
public class TransServiceMybatis implements TransService {

	@Autowired
	private TransDAO transDao;

	@Override
	public List<TransacInfoVO> selectAll(SearchVO searchVo) {
		return transDao.selectAll(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return transDao.getTotalRecord(searchVo);
	}

	@Override
	public int regitReview(ReviewVO reviewVo) {
		return transDao.regitReview(reviewVo);
	}

}
