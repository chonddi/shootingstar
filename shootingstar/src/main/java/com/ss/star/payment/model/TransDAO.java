package com.ss.star.payment.model;

import java.util.List;

import com.ss.star.common.SearchVO;

public interface TransDAO {

	public List<TransacInfoVO> selectAll(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);

}
