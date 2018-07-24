package com.ss.star.mypage.message.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SendMsgDaoMybatis implements SendMsgDAO{

	private String namespace="com.sql.message.";
	@Autowired private SqlSessionTemplate sqlSession;
	@Override
	public int insertSendMsg(SendMsgVO sendMsgVo) {
		return sqlSession.insert(namespace+"insertSendMsg", sendMsgVo);
	}
	
}
