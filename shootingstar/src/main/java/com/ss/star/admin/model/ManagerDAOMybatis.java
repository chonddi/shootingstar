package com.ss.star.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAOMybatis implements ManagerDAO {
	private String namespace="com.sql.manager";
	@Autowired SqlSessionTemplate sqlSession;
	@Override
	public ManagerVO selectID(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"selectID", email);
	}
	@Override
	public String selectPwdById(String adminId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"selectPwdById", adminId);
	}
	
	
}
