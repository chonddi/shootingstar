package com.ss.star.portfolio.model;

import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;

public interface PortfolioService {
	public int insertPf(PortfolioVO vo, List<Map<String, Object>> list) ;
	public List<Map<String, Object>> selectAllList(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
}
