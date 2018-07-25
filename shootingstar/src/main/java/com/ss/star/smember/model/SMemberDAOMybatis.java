package com.ss.star.smember.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SMemberDAOMybatis implements SMemberDAO{

	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.sql.sMember.";
	@Override
	public SMemberVO selectID(String sMemberId) {
		return sqlSession.selectOne(namespace+"selectID", sMemberId);
	}
	@Override
	public int insertSMember(SMemberVO sMemberVo) {
		return sqlSession.insert(namespace+"insertSMember", sMemberVo);
	}
	@Override
	public String selectPwdById(String sMemberId) {
		return sqlSession.selectOne(namespace+"selectPwdById", sMemberId);
	}
	@Override
	public String selectNameById(String sMemberId) {
		return sqlSession.selectOne(namespace+"selectNameById", sMemberId);
	}
	@Override
	public int selectCountSMemberId(String sMemberId) {
		return sqlSession.selectOne(namespace+"selectCountSMemberId", sMemberId);
	}
	@Override
	public int updateOutDate(String sMemberId) {
		return sqlSession.update(namespace+"updateOutDate", sMemberId);
	}
}
