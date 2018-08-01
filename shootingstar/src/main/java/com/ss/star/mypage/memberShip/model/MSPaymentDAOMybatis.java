package com.ss.star.mypage.memberShip.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MSPaymentDAOMybatis implements MSPaymentDAO{

	private String namespace="com.sql.membership.";
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public Map<String, Object> nowMembership(String sMemberId) {
		return sqlSession.selectOne(namespace+"nowMembership", sMemberId);
	}
	
	@Override
	public int updateMembership(Map<String, Object> map) {
		return sqlSession.update(namespace+"updateMembership", map);
	}
	@Override
	public int insertMembership(MSPaymentVO mSPaymentVo) {
		return sqlSession.insert(namespace+"insertMembership", mSPaymentVo);
	}

	@Override
	public List<Map<String, Object>> selectAllPayment(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectAllPayment", map);
	}

	@Override
	public MSPaymentVO PaymentFinish(String sMemberId) {
		return sqlSession.selectOne(namespace+"PaymentFinish", sMemberId);
	}

	@Override
	public int getTotalRecord(String sMemberId) {
		return sqlSession.selectOne(namespace+"getTotalRecord", sMemberId);
	}

	
	
	
}
