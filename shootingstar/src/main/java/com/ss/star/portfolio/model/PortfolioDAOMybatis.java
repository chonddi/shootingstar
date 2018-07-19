package com.ss.star.portfolio.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PortfolioDAOMybatis implements PortfolioDAO {
	private String namespace = "config.mybatis.mapper.oracle.portfolio.";
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

}
