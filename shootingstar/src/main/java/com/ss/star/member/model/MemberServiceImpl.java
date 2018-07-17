package com.ss.star.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired private MemberDAO memberDao;

	@Override
	public MemberVO selectID(String email) {
		return memberDao.selectID(email);
	}

	@Override
	public int insertMember(MemberVO memberVo) {
		return memberDao.insertMember(memberVo);
	}
}
