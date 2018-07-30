package com.ss.star.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAOMybatis implements ManagerDAO {
	private String namespace="com.sql.manager.";
	@Autowired SqlSessionTemplate sqlSession;
	@Override
	public ManagerVO selectID(String email) {
		return sqlSession.selectOne(namespace+"selectID", email);
	}
	@Override
	public String selectPwdById(String adminId) {
		return sqlSession.selectOne(namespace+"selectPwdById", adminId);
	}
	@Override
	public String selectNameById(String adminId) {
		return sqlSession.selectOne(namespace+"selectNameById", adminId);
	}
	@Override
	public int checkSignup(String adminId) {
		return sqlSession.selectOne(namespace+"checkSignup", adminId);
	}
	@Override
	public int checkDuplicate(String adminId) {
		return sqlSession.selectOne(namespace+"checkDuplicate", adminId);
	}
	
	
}
