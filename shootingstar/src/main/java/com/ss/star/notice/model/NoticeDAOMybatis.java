package com.ss.star.notice.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOMybatis implements NoticeDAO {
	private String namespace="com.sql.notice.";
@Autowired SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

}
