package com.ss.star.portfolio.model;

import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;

public interface PortfolioDAO {
	public int insertPfImg(PortfolioImgVO vo) ;
	public int insertPf(PortfolioVO vo) ;
	public List<Map<String, Object>> selectAllList(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public List<Map<String, Object>> selectPfDetail(int pfNo);
	public List<reviewVO> selectReview(int pfNo);
	public PortfolioVO selectBySmemberId(String smemberId);
}
