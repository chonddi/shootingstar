package com.ss.star.portfolio.model;

import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;

public interface PortfolioService {
	public int insertPf(PortfolioVO vo, List<Map<String, Object>> list) ;
	public List<Map<String, Object>> selectAllList(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public int updateReadCount(int pfNo);
	public List<Map<String, Object>> selectPfDetail(int pfNo);
	public List<reviewVO> selectReview(int pfNo);
	public PortfolioVO selectBySmemberId(String smemberId);
	public String selectAdd(int pfNo);
	public List<Map<String, Object>> selectMyPofol(String sMemberId, SearchVO searchVo);
	public int getTotalMyPofol(String sMemberId, SearchVO searchVo);
}
