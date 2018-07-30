package com.ss.star.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAOMybatis implements ManagerDAO {
	private String namespace="com.sql.manager.";
	@Autowired SqlSessionTemplate sqlSession;
	@Override
	public ManagerVO selectID(String adminId) {
		return sqlSession.selectOne(namespace+"selectID", adminId);
	}

	@Override
	public int insertManager(ManagerVO vo) {
		return sqlSession.insert(namespace+"insertManager", vo);
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

	@Override
	public int adminUpdate(ManagerVO vo) {
		return sqlSession.update(namespace+"adminUpdate", vo);
	}
}
