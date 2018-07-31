package com.ss.star.member.model;

import java.util.Map;

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

	@Override
	public String selectPwdById(String memberId) {
		return sqlSession.selectOne(namespace+"selectPwdById", memberId);
	}

	@Override
	public String selectNameById(String memberId) {
		return sqlSession.selectOne(namespace+"selectNameById", memberId);
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		return sqlSession.update(namespace+"updateMember", memberVo);
	}

	@Override
	public int updateOutDate(String memberId) {
		return sqlSession.update(namespace+"updateOutDate", memberId);
	}

	@Override
	public int selectCountMemberId(String memberId) {
		return sqlSession.selectOne(namespace+"selectCountMemberId", memberId);
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
	public int changeNewPwd(MemberVO memberVo) {
		return sqlSession.update(namespace+"changeNewPwd", memberVo);
	}

	@Override
	public int deleteTempPwd(String memberId) {
		return sqlSession.update(namespace+"deleteTempPwd", memberId);
	}
}
