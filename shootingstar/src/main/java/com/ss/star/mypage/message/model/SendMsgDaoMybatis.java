package com.ss.star.mypage.message.model;

import java.util.List;
import java.util.Map;

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
	@Override
	public int insertReceiveMsg(ReceiveMsgVO receiveMsgVo) {
		return sqlSession.insert(namespace+"insertReceiveMsg", receiveMsgVo);
	}
	@Override
	public List<Map<String, Object>> selectSendMsg(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectSendMsg", map);
	}
	@Override
	public int getTotalRecord(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalRecord", map);
	}
	@Override
	public List<Map<String, Object>> selectReceiveMsg(Map<String, Object> map) {
		return sqlSession.selectList(namespace+"selectReceiveMsg", map);
	}
	@Override
	public int getTotalRecordReceive(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"getTotalRecordReceive", map);
	}
	@Override
	public Map<String, Object> selectDetail(int sMsgNo) {
		return sqlSession.selectOne(namespace+"selectDetail", sMsgNo);
	}
	@Override
	public int updateRead(int sMsgNo) {
		return sqlSession.update(namespace+"updateRead", sMsgNo);
	}
	
}
