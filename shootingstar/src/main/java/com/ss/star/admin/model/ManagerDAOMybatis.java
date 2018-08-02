package com.ss.star.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ss.star.member.model.MemberVO;
import com.ss.star.smember.model.SMemberVO;

@Repository
public class ManagerDAOMybatis implements ManagerDAO {
	private String namespace="com.sql.manager.";
	@Autowired SqlSessionTemplate sqlSession;
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

	@Override
	public int pwdUpdate(ManagerVO vo) {
		return sqlSession.update(namespace+"pwdUpdate", vo);
	}

	@Override
	public List<MemberVO> memberList() {
		return sqlSession.selectList(namespace+"memberList");
	}

	@Override
	public int updateMember(MemberVO vo) {
		return sqlSession.update(namespace+"updateMember", vo);
	}

	@Override
	public List<SMemberVO> sMemberList() {
		return sqlSession.selectList(namespace+"SMemberList");
	}

	@Override
	public int updateSMember(SMemberVO vo) {
		return sqlSession.update(namespace+"updateSMember", vo);
	}

	@Override
	public List<SMemberVO> sMemberOutList() {
		return sqlSession.selectList(namespace+"SMemberOutList");
	}

	@Override
	public int smemberAuOut(SMemberVO vo) {
		return sqlSession.update(namespace+"smemberAuOut", vo);
	}

	@Override
	public int smemberAuBack(SMemberVO vo) {
		return sqlSession.update(namespace+"smemberAuBack", vo);
	}

	@Override
	public int smemberOut(SMemberVO vo) {
		return sqlSession.update(namespace+"smemberOut", vo);
	}

	@Override
	public int smemberBack(SMemberVO vo) {
		return sqlSession.update(namespace+"smemberBack", vo);
	}

	@Override
	public int memberOut(MemberVO vo) {
		return sqlSession.update(namespace+"memberOut", vo);
	}

	@Override
	public int memberBack(MemberVO vo) {
		return sqlSession.update(namespace+"memberBack", vo);
	}

}
