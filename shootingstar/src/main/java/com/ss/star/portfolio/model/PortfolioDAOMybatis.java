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
	public int getTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", searchVo);
	}

	@Override
	public List<Map<String, Object>> selectPfDetail(int pfNo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = sqlSession.selectList(namespace+"selectPfDetail", pfNo);
		return list;
	}

	@Override
	public List<reviewVO> selectReview(int pfNo) {
		List<reviewVO> list = sqlSession.selectList(namespace2+"selectReview", pfNo);
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

}
