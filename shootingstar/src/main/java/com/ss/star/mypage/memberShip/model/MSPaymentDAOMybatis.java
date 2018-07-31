package com.ss.star.mypage.memberShip.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MSPaymentDAOMybatis implements MSPaymentDAO{

	private String namespace="com.sql.membership.";
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override
	public int updateMembership(Map<String, Object> map) {
		return sqlSession.update(namespace+"updateMembership", map);
	}
	@Override
	public int insertMembership(MSPaymentVO mSPaymentVo) {
		return sqlSession.insert(namespace+"insertMembership", mSPaymentVo);
	}
	
	
}
