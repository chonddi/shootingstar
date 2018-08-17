package com.ss.star.payment.model;

import java.util.List;

import com.ss.star.common.SearchVO;

public interface TransService {

	public List<TransacInfoVO> selectAll(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public int regitReview(ReviewVO reviewVo);
	public TransacInfoVO selectByNo(int no);
	public int updateFlag(int no);
	
}
