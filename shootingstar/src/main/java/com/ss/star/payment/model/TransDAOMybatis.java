package com.ss.star.payment.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.star.common.SearchVO;

@Repository
public class TransDAOMybatis implements TransDAO {
	
	private String namespace = "config.mybatis.mapper.oracle.transactional.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<TransacInfoVO> selectAll(SearchVO searchVo) {
		List<TransacInfoVO> list = sqlSession.selectList(namespace + "selectAll", searchVo);
		return list;
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		int cnt = sqlSession.selectOne(namespace + "getTotalRecord", searchVo);
		return cnt;
	}

}
