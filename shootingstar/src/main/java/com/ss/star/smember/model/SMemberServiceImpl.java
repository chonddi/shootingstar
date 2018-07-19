package com.ss.star.smember.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SMemberServiceImpl implements SMemberService{
	
	@Autowired private SMemberDAO sMemberDao;

	@Override
	public SMemberVO selectID(String sMemberId) {
		return sMemberDao.selectID(sMemberId);
	}

	@Override
	public int insertSMember(SMemberVO sMemberVo) {
		return sMemberDao.insertSMember(sMemberVo);
	}
	
}
