package com.ss.star.request.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RequestDAOMybatis implements RequestDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.request.";
	
	
	@Override
	public int insertRequest(RequestVO vo) {
		int cnt=sqlSession.insert(namespace+"insertRequest", vo);
		return cnt;
	}


	@Override
	public int insertReqImg(RequestImgVO ivo) {
		int cnt=sqlSession.insert(namespace+"insertReqImg", ivo);
		return cnt;
	}
	
	


}
