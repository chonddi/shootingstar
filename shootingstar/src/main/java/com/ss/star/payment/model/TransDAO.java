package com.ss.star.payment.model;

import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;

public interface TransDAO {

	public List<TransacInfoVO> selectAll(Map<String, Object> map);
	public List<TransacInfoVO2> selectAll2(Map<String, Object> map);
	public int getTotalRecord(Map<String, Object> map);
	public int getTotalRecord2(Map<String, Object> map);
	public int regitReview(ReviewVO reviewVo);
	public TransacInfoVO selectByNo(int no);
	public TransacInfoVO2 selectByNo2(int no);
	public int updateFlag(int no);
	public int selectPickNo(int no);

}
