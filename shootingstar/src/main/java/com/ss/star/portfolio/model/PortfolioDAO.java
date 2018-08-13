package com.ss.star.portfolio.model;

import java.util.List;
import java.util.Map;

import com.ss.star.common.SearchVO;


public interface PortfolioDAO {
	public int insertPfImg(PortfolioImgVO vo) ;
	public int insertPf(PortfolioVO vo) ;
	public List<Map<String, Object>> selectAllList(SearchVO searchVo);
	public List<Map<String, Object>> selectAllList2(SearchVO searchVo);
	public int getTotalRecord(SearchVO searchVo);
	public int updateReadCount(int pfNo);
	public List<Map<String, Object>> selectPfDetail(int pfNo);
	public List<Map<String, Object>> selectPfDetailByN(String sname);
	public List<reviewVO> selectReview(int pfNo);
	public PortfolioVO selectBySmemberId(String smemberId);
	public String selectAdd(int pfNo);	
	public List<Map<String, Object>> selectMyPofol(Map<String, Object> map);	//마이포폴
	public int getTotalMyPofol(Map<String, Object> map);	
	public String detailSmemberId(int pfNo);	//디테일에 넣을 sMemberId
	public String authorityById(String sMemberId);   //권한 N일때 막기
	public int deletePf (int no);
	public int resPf (int no);
	public List<PortfolioImgVO> selImgName (int no);
}
