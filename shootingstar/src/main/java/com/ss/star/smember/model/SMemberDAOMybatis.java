package com.ss.star.smember.model;

import java.util.Map;
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
	@Override
	public int updateSMember(SMemberVO sMemberVo) {
		return sqlSession.update(namespace+"updateSMember", sMemberVo);
	}
	@Override
	public int updatePwd(Map<String, String> map) {
		return sqlSession.update(namespace+"updatePwd", map);
	}
	@Override
	public int updateTempPwd(Map<String, String> map) {
		return sqlSession.update(namespace+"updateTempPwd", map);
	}
	@Override
	public String selectTempPwd(String tempPwd) {
		return sqlSession.selectOne(namespace+"selectTempPwd", tempPwd);
	}
	@Override
	public int changeNewPwd(SMemberVO sMemberVo) {
		return sqlSession.update(namespace+"changeNewPwd", sMemberVo);
	}
	@Override
	public int deleteTempPwd(String sMemberId) {
		return sqlSession.update(namespace+"deleteTempPwd", sMemberId);
	}
	@Override
	public int autoAuthority() {
		return sqlSession.update(namespace+"autoAuthority");
	}
	@Override
	public int selCount() {
		return sqlSession.selectOne(namespace+"selCount");
	}
	@Override
	public String selectIdByName(String sName) {
		return sqlSession.selectOne(namespace+"selectIdByName", sName);
	}
}
