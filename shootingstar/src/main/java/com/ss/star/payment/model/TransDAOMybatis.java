package com.ss.star.payment.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.star.common.SearchVO;

@Repository
public class TransDAOMybatis implements TransDAO {
	
	private String namespace = "config.mybatis.mapper.oracle.transactional.";
	private String namespace2 = "config.mybatis.mapper.oracle.review.";
	
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

	@Override
	public int regitReview(ReviewVO reviewVo) {
		int cnt = sqlSession.insert(namespace2 + "regitReview", reviewVo);
		return cnt;
	}

	@Override
	public TransacInfoVO selectByNo(int no) {
		TransacInfoVO transacVo = sqlSession.selectOne(namespace + "selectByNo", no);
		return transacVo;
	}

	@Override
	public int updateFlag(int no) {
		int cnt = sqlSession.update(namespace + "updateFlag", no);
		return cnt;
	}

}
