package com.ss.star.portfolio.model;

import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;
import com.ss.star.payment.model.ReviewVO;


public interface PortfolioService {
	public int insertPf(PortfolioVO vo, List<Map<String, Object>> list) ;
	public List<Map<String, Object>> selectAllList(SearchVO searchVo);
	public List<Map<String, Object>> selectAllList2(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public int updateReadCount(int pfNo);
	public List<Map<String, Object>> selectPfDetail(int pfNo);
	public List<Map<String, Object>> selectPfDetailByN(String sname);
	public List<ReviewVO> selectReview(String sMemberid);
	public PortfolioVO selectBySmemberId(String smemberId);
	public String selectAdd(int pfNo);
	public List<Map<String, Object>> selectMyPofol(String sMemberId, SearchVO searchVo);
	public int getTotalMyPofol(String sMemberId, SearchVO searchVo);
	public String detailSmemberId(int pfNo);
	public String authorityById(String sMemberId);
	public int deleteMulti (List<PortfolioVO> list);
	public int resMulti (List<PortfolioVO> list);
	public List<PortfolioImgVO> selImgName (int no);
}
