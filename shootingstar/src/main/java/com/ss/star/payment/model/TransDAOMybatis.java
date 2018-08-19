package com.ss.star.payment.model;

import java.util.List;
import java.util.Map;

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
	public List<TransacInfoVO> selectAll(Map<String, Object> map) {
		List<TransacInfoVO> list = sqlSession.selectList(namespace + "selectAll", map);
		return list;
	}
	
	@Override
	public List<TransacInfoVO2> selectAll2(Map<String, Object> map) {
		List<TransacInfoVO2> list = sqlSession.selectList(namespace + "selectAll2", map);
		return list;
	}

	@Override
	public int getTotalRecord(Map<String, Object> map) {
		int cnt = sqlSession.selectOne(namespace + "getTotalRecord", map);
		return cnt;
	}
	
	@Override
	public int getTotalRecord2(Map<String, Object> map) {
		int cnt = sqlSession.selectOne(namespace + "getTotalRecord2", map);
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
	public TransacInfoVO2 selectByNo2(int no) {
		TransacInfoVO2 transacVo = sqlSession.selectOne(namespace + "selectByNo", no);
		return transacVo;
	}

	@Override
	public int updateFlag(int no) {
		int cnt = sqlSession.update(namespace + "updateFlag", no);
		return cnt;
	}

}
