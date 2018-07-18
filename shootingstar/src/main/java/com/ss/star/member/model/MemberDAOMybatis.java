package com.ss.star.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO{

	private String namespace="com.sql.member.";
	@Autowired private SqlSessionTemplate sqlSession;
	@Override
	public MemberVO selectID(String email) {
		return sqlSession.selectOne(namespace+"selectID", email);
	}
	
	@Override
	public int insertMember(MemberVO memberVo) {
		return sqlSession.insert(namespace+"insertMember", memberVo);
	}
}
