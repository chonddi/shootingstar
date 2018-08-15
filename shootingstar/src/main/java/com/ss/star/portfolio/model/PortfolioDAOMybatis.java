package com.ss.star.portfolio.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.star.common.SearchVO;


@Repository
public class PortfolioDAOMybatis implements PortfolioDAO {
	
	private String namespace = "config.mybatis.mapper.oracle.portfolio.";
	private String namespace2 = "config.mybatis.mapper.oracle.review.";
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertPfImg(PortfolioImgVO vo) {
		// TODO Auto-generated method stub
		int cnt = sqlSession.insert(namespace+"insertPfImg", vo);
		return cnt;
	}

	@Override
	public int insertPf(PortfolioVO vo) {
		// TODO Auto-generated method stub
		int cnt = sqlSession.insert(namespace+"insertPf", vo);
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectAllList(SearchVO searchVo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = sqlSession.selectList(namespace+"selectAllList", searchVo);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> selectAllList2(SearchVO searchVo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = sqlSession.selectList(namespace+"selectAllList", searchVo);
		return list;
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", searchVo);
	}
	
	@Override
	public int updateReadCount(int pfNo) {
		return sqlSession.update(namespace+"updateReadCount", pfNo);
	}

	@Override
	public List<Map<String, Object>> selectPfDetail(int pfNo) {
		List<Map<String, Object>> list = sqlSession.selectList(namespace+"selectPfDetail", pfNo);
		return list;
	}

	@Override
	public PortfolioVO selectBySmemberId(String smemberId) {
		PortfolioVO vo = sqlSession.selectOne(namespace+"selectBySmemberId", smemberId);
		return vo;
	}

	@Override
	public String selectAdd(int pfNo) {
		String address = sqlSession.selectOne(namespace+"selectAdd", pfNo);
		return address;
	}

	@Override
	public List<Map<String, Object>> selectMyPofol(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectMyPofol", map);
	}

	@Override
	public int getTotalMyPofol(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalMyPofol", map);
	}

	@Override
	public String detailSmemberId(int pfNo) {
		return sqlSession.selectOne(namespace+"detailSmemberId", pfNo);
	}

	@Override
	public String authorityById(String sMemberId) {
		return sqlSession.selectOne(namespace+"authorityById", sMemberId);
	}

	@Override
	public int deletePf(int no) {
		return sqlSession.update(namespace+"deletePf", no);
	}

	@Override
	public int resPf(int no) {
		return sqlSession.update(namespace+"resPf", no);
	}

	@Override
	public List<PortfolioImgVO> selImgName(int no) {
		return sqlSession.selectList(namespace+"selImgName", no);
	}

	@Override
	public List<Map<String, Object>> selectPfDetailByN(String sname) {
		List<Map<String, Object>> list = sqlSession.selectList(namespace+"selectPfDetailByN", sname);
		return list;
	}

}
