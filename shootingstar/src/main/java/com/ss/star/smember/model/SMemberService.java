package com.ss.star.smember.model;

public interface SMemberService {

	public SMemberVO selectID(String sMemberId);
	public int insertSMember(SMemberVO sMemberVo);
}
