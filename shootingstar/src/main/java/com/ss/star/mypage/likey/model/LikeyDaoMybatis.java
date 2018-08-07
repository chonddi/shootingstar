package com.ss.star.mypage.likey.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeyDaoMybatis implements  LikeyDao{

	@Autowired SqlSessionTemplate sqlSession;
	String namespace="com.sql.likey.";
	
	@Override
	public int insertLikey(Map<String, Object> map) {
		return sqlSession.insert(namespace+"insertLikey", map);
	}

	@Override
	public int countLikey(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"countLikey", map);
	}

	@Override
	public int deleteLikey(Map<String, Object> map) {
		return sqlSession.delete(namespace+"deleteLikey", map);
	}

	@Override
	public List<Integer> myLikey(String memberId) {
		return sqlSession.selectList(namespace+"myLikey", memberId);
	}

	@Override
	public List<Map<String, Object>> myLikeyList(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"myLikeyList", map);
	}

	@Override
	public int getTotalMyLikey(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalMyLikey", map);
	}
	
	
}
