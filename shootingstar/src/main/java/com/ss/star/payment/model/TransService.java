package com.ss.star.payment.model;

import java.util.List;

import com.ss.star.common.SearchVO;

public interface TransService {

	public List<TransacInfoVO> selectAll(String memberid, SearchVO searchVo);
	public List<TransacInfoVO2> selectAll2(String sMemberid, SearchVO searchVo);
	public int getTotalRecord(String memberid, SearchVO searchVo);
	public int getTotalRecord2(String sMemberid, SearchVO searchVo);
	public int regitReview(ReviewVO reviewVo);
	public TransacInfoVO selectByNo(int no);
	public TransacInfoVO2 selectByNo2(int no);
	public int updateFlag(int no);
	public int selectPickNo(int no);
	
}
